import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter_enterprise_template/core/network/network_info.dart';

class MockInternetConnection extends Mock implements InternetConnection {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnection mockInternetConnection;

  setUp(() {
    mockInternetConnection = MockInternetConnection();
    networkInfo = NetworkInfoImpl(mockInternetConnection);
  });

  group('NetworkInfo - isConnected', () {
    test('should return true when InternetConnection has access', () async {
      when(() => mockInternetConnection.hasInternetAccess).thenAnswer((_) async => true);

      final result = await networkInfo.isConnected;

      expect(result, isTrue);
      verify(() => mockInternetConnection.hasInternetAccess).called(1);
    });

    test('should return false when InternetConnection has no access', () async {
      when(() => mockInternetConnection.hasInternetAccess).thenAnswer((_) async => false);

      final result = await networkInfo.isConnected;

      expect(result, isFalse);
      verify(() => mockInternetConnection.hasInternetAccess).called(1);
    });
  });
}
