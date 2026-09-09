import 'dart:io';

void main(List<String> args) {
  final lcovFile = File('coverage/lcov.info');

  if (!lcovFile.existsSync()) {
    stderr.writeln('❌ Error: coverage/lcov.info not found. Run tests first.');
    exit(1);
  }

  final lines = lcovFile.readAsLinesSync();
  int found = 0;
  int hit = 0;
  bool isGeneratedFile = false;

  for (var line in lines) {
    if (line.startsWith('SF:')) {
      final filePath = line.substring(3).toLowerCase();
      isGeneratedFile =
          filePath.endsWith('.g.dart') ||
          filePath.endsWith('.freezed.dart') ||
          filePath.endsWith('.config.dart');
    }

    if (isGeneratedFile) continue;

    if (line.startsWith('LF:')) found += int.parse(line.substring(3));
    if (line.startsWith('LH:')) hit += int.parse(line.substring(3));
  }

  final percentage = found > 0 ? (hit / found) * 100 : 0.0;

  stdout.writeln('');
  stdout.writeln('====================================================');
  stdout.writeln(
    '📊 Effective Test Coverage: ${percentage.toStringAsFixed(2)}%',
  );
  stdout.writeln('====================================================');

  // NOTE: Customize targetCoverage here if your project needs a different threshold (e.g. 70.0, 85.0, 90.0)
  const double targetCoverage = 80.0;
  final isCoveragePassed = percentage >= targetCoverage;

  // 1. Generate HTML report if genhtml is available
  try {
    final result = Process.runSync('genhtml', [
      'coverage/lcov.info',
      '-o',
      'coverage/html',
      '--ignore-errors',
      'source,unused',
    ]);
    if (result.exitCode == 0) {
      stdout.writeln(
        '📦 Visual HTML report generated: coverage/html/index.html',
      );
    }
  } catch (_) {
    // genhtml not available on this machine (e.g. Windows without Perl)
  }

  // 2. Check if running inside GitHub Actions CI
  final stepSummaryPath = Platform.environment['GITHUB_STEP_SUMMARY'];
  final isGitHubCi = stepSummaryPath != null && stepSummaryPath.isNotEmpty;

  final formatFailed = Platform.environment['FORMAT_FAILED'] == 'true';
  final analyzeFailed = Platform.environment['ANALYZE_FAILED'] == 'true';
  final testsFailed = Platform.environment['TESTS_FAILED'] == 'true';

  if (isGitHubCi) {
    final summaryFile = File(stepSummaryPath);
    final buffer = StringBuffer();

    buffer.writeln('# 🛡️ Code Quality & Coverage Report');
    buffer.writeln('');
    buffer.writeln('| Check | Status | Metric / Details | Action if Failed |');
    buffer.writeln('| :--- | :---: | :---: | :--- |');

    buffer.writeln(
      '| **Dart Format** | ${formatFailed ? "❌ Failed" : "✅ Passed"} | Code Style | Run `dart format .` locally |',
    );
    buffer.writeln(
      '| **Static Analysis** | ${analyzeFailed ? "❌ Failed" : "✅ Passed"} | Flutter Lints | Fix analyzer warnings/errors |',
    );
    buffer.writeln(
      '| **Unit Tests** | ${testsFailed ? "❌ Failed" : "✅ Passed"} | Test Execution | Fix failing test cases |',
    );

    final coverageStatus = isCoveragePassed ? '✅ Passed' : '⚠️ Warning';
    buffer.writeln(
      '| **Test Coverage** | $coverageStatus | **${percentage.toStringAsFixed(2)}%** (Target: $targetCoverage%) | Add tests for uncovered code |',
    );

    buffer.writeln('');
    if (formatFailed || analyzeFailed || testsFailed) {
      buffer.writeln(
        '> ❌ **Quality Gate Failed:** One or more critical code checks failed.',
      );
    } else if (!isCoveragePassed) {
      buffer.writeln(
        '> ⚠️ **Quality Gate Warning:** Coverage is below target ($targetCoverage%), but build passed.',
      );
    } else {
      buffer.writeln(
        '> 🚀 **Quality Gate Succeeded:** All code quality standards met.',
      );
    }

    summaryFile.writeAsStringSync(buffer.toString(), mode: FileMode.append);
  }

  // 3. Exit code evaluation
  if (formatFailed || analyzeFailed || testsFailed) {
    stderr.writeln(
      '❌ Quality Gate failed due to errors in format, analysis, or tests.',
    );
    exit(1);
  }

  if (!isCoveragePassed) {
    stdout.writeln(
      '⚠️ Notice: Coverage (${percentage.toStringAsFixed(2)}%) is below target ($targetCoverage%). You can adjust `targetCoverage` in `scripts/check_coverage.dart`.',
    );
    // If running strictly in pre-push or strict CI mode:
    // exit(1);
  } else {
    stdout.writeln('✅ All quality & coverage checks passed successfully!');
  }
}
