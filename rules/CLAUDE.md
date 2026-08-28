# Claude Code Project Guidelines - Flutter Enterprise Pro Max

## Architecture & Standards (Production Enterprise Standard)

- **Architecture**: 3-Layer Clean Architecture (Domain, Data, Presentation) per feature.
- **Dependency Injection**: Injectable + GetIt (`@InjectableInit`, `@singleton`, `@LazySingleton(as: *Repo)`, `@lazySingleton`, `@injectable`, `@module`).
- **State Management**: Cubit only with Freezed States (`*_cubit.dart`, `*_state.dart`).
- **Data Layer**: Retrofit DataSources (`*_datasource.dart`), `@JsonSerializable` Models + manual `copyWith` + Mappers, Repositories returning `ResultFuture<T>`.
- **Domain Layer**: Pure Entities (`Equatable`), abstract Repositories, discrete UseCases.
- **Networking**: Enterprise DioClient, AuthInterceptor (with 401 refresh lock and auto-retry), ApiErrorHandler, ApiResponse<T>, PaginatedResponse<T>.
- **Flavors**: Mandatory dev, staging, production setup with `.env.*`, `AppFlavor`, `EnvConfig`, and separate entry points (`main_dev.dart`, `main_staging.dart`, `main_production.dart`).
- **Localization**: Mandatory AR and EN with **STRICT ZERO hardcoded strings**. Always use `context.l10n.<key>`.
- **Validation**: Centralized `Validators` utility returning localized error strings.
- **Caching**: `FlutterSecureStorage` for tokens, `SharedPreferences` for sessions, cache-first repository pattern.
- **Platform Adaptability**: Material 3 on Android/Desktop/Web, Cupertino on iOS/macOS.
- **Responsiveness**: ResponsiveLayout supporting Mobile (<600), Tablet (600-1024), and Desktop (>1024).
- **Widgets**: Strictly ONE widget class per file. Never use helper functions returning Widgets.
- **Firebase**: Modular services (Auth, Firestore, Storage, Messaging, Crashlytics hooked into BlocObserver).
- **Fastlane & CI/CD**: Android/iOS Fastfile with flavor-based lanes (`deploy_dev`, `deploy_staging`, `deploy_prod`), `.env.fastlane`, and `.github/workflows/deploy.yml`.
- **Interactive Initializer**: When user asks to init project, ALWAYS ask the 6 questions first (Name, FVM, Platforms, Category, Firebase, Fastlane).
- **FVM Setup**: When custom version is requested, create `.fvmrc`, `.fvm/fvm_config.json`, and `.vscode/settings.json` (`dart.flutterSdkPath: .fvm/flutter_sdk`).
- **Package Matrix**: Ensure all `pubspec.yaml` dependencies match target Flutter version without conflicts and run `flutter pub get` immediately.
- **Theme Data**: Always use `CardThemeData` for `cardTheme` in `ThemeData`. Never use `CardTheme(...)`.
- **Automated Runner**: ALWAYS execute `dart run build_runner build --delete-conflicting-outputs` and `flutter analyze` automatically after scaffolding.



