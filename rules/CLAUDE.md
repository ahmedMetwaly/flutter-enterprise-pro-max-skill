# Claude Code Project Guidelines - Flutter Enterprise Pro Max

## Architecture & Standards (Production Enterprise Standard)

- **Architecture**: 3-Layer Clean Architecture (Domain, Data, Presentation) per feature.
- **Dependency Injection**: Injectable + GetIt (`@InjectableInit`, `@singleton`, `@LazySingleton(as: *Repo)`, `@lazySingleton`, `@injectable`, `@module`).
- **State Management**: Cubit only with Freezed States (`*_cubit.dart`, `*_state.dart`).
- **Data Layer**: Retrofit DataSources (`*_datasource.dart`), `@JsonSerializable` Models + manual `copyWith` + Mappers, Repositories returning `ResultFuture<T>`.
- **Domain Layer**: Pure Entities (`Equatable`), abstract Repositories, discrete UseCases.
- **Networking**: Enterprise DioClient, AuthInterceptor (with 401 refresh lock and auto-retry), ApiErrorHandler, ApiResponse<T>, PaginatedResponse<T>, `dartz` `Either`.
- **Routes**: Centralized `core/routes/routes.dart` and `core/routes/app_router.dart` (`PageRouteBuilder` with `FadeTransition`).
- **Flavors**: `DevConfig` / `StagingConfig` (via `dotenv`), `ProductionConfig` (via `--dart-define`), with `.vscode/launch.json` and all `.env` in `.gitignore`.
- **Localization**: Mandatory AR and EN with **STRICT ZERO hardcoded strings**. Always use `context.l10n.<key>`.
- **Validation**: Centralized `Validators` utility returning localized error strings.
- **Caching**: `FlutterSecureStorage` for tokens, `SharedPreferences` for sessions, cache-first repository pattern.
- **Platform Adaptability**: Material 3 on Android/Desktop/Web, Cupertino on iOS/macOS.
- **Responsiveness**: ResponsiveLayout supporting Mobile (<600), Tablet (600-1024), and Desktop (>1024).
- **Widgets**: Strictly ONE widget class per file. Never use helper functions returning Widgets.
- **Theme**: Always use `CardThemeData` in `ThemeData(cardTheme: const CardThemeData(...))`. Never use `CardTheme(...)`.
- **Interactive Initializer**: When user asks to init project, ALWAYS ask the 3 questions first (Name, Platforms, Category).
- **Automated Runner**: ALWAYS execute `dart run build_runner build --delete-conflicting-outputs` and `flutter analyze` automatically after scaffolding.





