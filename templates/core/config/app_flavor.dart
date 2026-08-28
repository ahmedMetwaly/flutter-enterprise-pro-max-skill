enum AppFlavor {
  dev,
  staging,
  production;

  String get name {
    switch (this) {
      case AppFlavor.dev:
        return 'Development';
      case AppFlavor.staging:
        return 'Staging';
      case AppFlavor.production:
        return 'Production';
    }
  }

  bool get isDev => this == AppFlavor.dev;
  bool get isStaging => this == AppFlavor.staging;
  bool get isProduction => this == AppFlavor.production;
}
