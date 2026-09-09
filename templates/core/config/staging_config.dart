import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app_flavor.dart';
import 'env_config.dart';

class StagingConfig implements EnvConfig {
  @override
  AppFlavor get flavor => AppFlavor.staging;

  @override
  String get appName => dotenv.env['APP_NAME'] ?? 'App (Staging)';

  @override
  String get baseUrl => dotenv.env['BASE_URL']!;

  @override
  String get apiKey => dotenv.env['API_KEY']!;

  @override
  bool get enableLogging => dotenv.env['ENABLE_LOGGING'] == 'true';
}
