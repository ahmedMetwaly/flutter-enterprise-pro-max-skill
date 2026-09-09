import 'app_flavor.dart';
import 'dev_config.dart';
import 'env_config.dart';
import 'production_config.dart';
import 'staging_config.dart';

class EnvConfigFactory {
  static EnvConfig create(AppFlavor flavor) {
    switch (flavor) {
      case AppFlavor.dev:
        return DevConfig();
      case AppFlavor.staging:
        return StagingConfig();
      case AppFlavor.production:
        return ProductionConfig();
    }
  }
}
