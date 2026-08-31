import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static const _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  final FlutterSecureStorage _storage;

  TokenStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: _androidOptions,
              iOptions: _iosOptions,
            );

  Future<void> saveAccessToken(String token) => _storage.write(key: 'access_token', value: token);
  Future<String?> getAccessToken() => _storage.read(key: 'access_token');
  Future<void> saveRefreshToken(String token) => _storage.write(key: 'refresh_token', value: token);
  Future<String?> getRefreshToken() => _storage.read(key: 'refresh_token');
  Future<void> clearAll() => _storage.deleteAll();
}
