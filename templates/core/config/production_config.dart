import 'app_flavor.dart';
import 'env_config.dart';

/// Production environment configuration.
///
/// All values are injected at build time via `--dart-define` flags in the
/// CI/CD pipeline. No `.env` file is loaded — secrets never ship with the app.
/// Logging is disabled for performance and security.
class ProductionConfig implements EnvConfig {
  @override
  AppFlavor get flavor => AppFlavor.production;

  @override
  String get appName => const String.fromEnvironment('APP_NAME', defaultValue: 'App');

  @override
  String get baseUrl => const String.fromEnvironment('BASE_URL');

  @override
  String get apiKey => const String.fromEnvironment('API_KEY');

  @override
  bool get enableLogging => false;
}
