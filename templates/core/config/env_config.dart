import 'app_flavor.dart';

abstract class EnvConfig {
  AppFlavor get flavor;
  String get appName;
  String get baseUrl;
  String get apiKey;
  bool get enableLogging;
}
