import 'dart:io';

void main(List<String> args) {
  print('============================================================');
  print('🔍 Flutter Enterprise Pro Max — Repository Validator');
  print('============================================================\n');


  int totalChecks = 0;
  int passedChecks = 0;
  int failedChecks = 0;

  void check(String title, bool condition, [String? errorMsg]) {
    totalChecks++;
    if (condition) {
      passedChecks++;
      print('  ✅ [PASS] $title');
    } else {
      failedChecks++;
      print('  ❌ [FAIL] $title: ${errorMsg ?? 'Failed'}');
    }
  }

  print('1. 📁 Checking Core Documentation & Schema:');
  check('SKILL.md exists', File('SKILL.md').existsSync());
  check('README.md exists', File('README.md').existsSync());
  check('Schema exists', File('config/schema/enterprise_flutter_schema.json').existsSync());

  print('\n2. 🏛️ Checking Architecture Guides:');
  final archFiles = [
    'architecture/decision-matrix.md',
    'architecture/feature-generation.md',
    'architecture/error-handling.md',
    'architecture/state-management.md',
    'architecture/performance.md',
    'architecture/offline-first.md',
    'architecture/feature-documentation.md',
    'architecture/testing.md',
    'architecture/security.md',
  ];
  for (final file in archFiles) {
    check('$file exists', File(file).existsSync());
  }

  print('\n3. 📦 Checking Pre-configured Profiles:');
  final profiles = [
    'config/profiles/enterprise_clean.yaml',
    'config/profiles/riverpod_enterprise.yaml',
    'config/profiles/offline_first_enterprise.yaml',
    'config/profiles/minimal.yaml',
    'config/defaults/default_config.yaml',
  ];
  for (final profile in profiles) {
    check('$profile exists', File(profile).existsSync());
  }

  print('\n4. 🤖 Checking Multi-IDE Rule Files:');
  final rules = [
    'rules/.cursorrules',
    'rules/CLAUDE.md',
    'rules/.windsurfrules',
    'rules/copilot-instructions.md',
  ];
  for (final rule in rules) {
    check('$rule exists', File(rule).existsSync());
  }

  print('\n5. 🧱 Checking Core Templates:');
  final templates = [
    'templates/common/core/errors/failure.dart',
    'templates/common/core/network/result.dart',
    'templates/common/core/network/typedef.dart',
    'templates/common/core/widgets/app_button.dart',
    'templates/common/core/widgets/app_text_field.dart',
    'templates/common/core/widgets/app_empty_state.dart',
    'templates/common/core/widgets/app_error_widget.dart',
    'templates/common/core/widgets/pagination_scroll_listener.dart',
    'templates/common/core/widgets/privacy_screen_overlay.dart',
    'templates/common/core/services/token_storage.dart',
    'templates/common/core/services/connectivity_service.dart',
    'templates/common/core/bloc_observer.dart',
    'templates/common/analysis_options.yaml',
    'templates/routing/go_router/app_router.dart',
    'templates/routing/navigator/app_router.dart',
    'templates/routing/navigator/routes.dart',
  ];
  for (final tmpl in templates) {
    check('$tmpl exists', File(tmpl).existsSync());
  }

  print('\n6. ⚡ Checking CLI Tools:');
  check('bin/init.dart exists', File('bin/init.dart').existsSync());
  check('bin/generate.dart exists', File('bin/generate.dart').existsSync());
  check('bin/doc.dart exists', File('bin/doc.dart').existsSync());
  check('bin/validate.dart exists', File('bin/validate.dart').existsSync());


  print('\n============================================================');
  print('📊 Validation Summary:');
  print('  - Total Checks: $totalChecks');
  print('  - Passed: $passedChecks');
  print('  - Failed: $failedChecks');
  print('============================================================\n');

  if (failedChecks == 0) {
    print('🎉 ALL CHECKS PASSED! Repository is 100% consistent.\n');
    exit(0);
  } else {
    print('🚨 SOME CHECKS FAILED! Please resolve the missing files or errors.\n');
    exit(1);
  }
}
