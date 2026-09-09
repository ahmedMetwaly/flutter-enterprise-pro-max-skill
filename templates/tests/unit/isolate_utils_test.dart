import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_enterprise_template/core/utils/isolate_utils.dart';

int _heavyCalculation(int n) {
  int sum = 0;
  for (int i = 0; i < n; i++) {
    sum += i;
  }
  return sum;
}

void main() {
  group('IsolateUtils', () {
    test('should execute heavy calculation on background isolate and return result', () async {
      final result = await IsolateUtils.run(_heavyCalculation, 1000);
      expect(result, 499500);
    });

    test('should execute zero-arg computation', () async {
      final result = await IsolateUtils.runCompute(() => 'success');
      expect(result, 'success');
    });
  });
}
