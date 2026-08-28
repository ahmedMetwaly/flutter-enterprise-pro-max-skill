# GitHub Copilot Custom Instructions for Flutter Enterprise Pro Max

- **Architecture**: 3-Layer Clean Architecture (Domain, Data, Presentation).
- **Dependency Injection**: Injectable with GetIt. Never manually construct repositories or usecases.
- **State Management**: Cubit only. States must use `@freezed`.
- **Data Layer**: Retrofit for DataSources, `@JsonSerializable(explicitToJson: true)` with manual `copyWith` and Model-to-Entity mappers.
- **Domain Layer**: Pure Entities (`Equatable`), abstract Repositories (`ResultFuture<T>`), single-responsibility UseCases.
- **Networking**: Enterprise DioClient, AuthInterceptor, ApiErrorHandler, ApiResponse, PaginatedResponse, `dartz` `Either`.
- **Routes**: `core/routes/routes.dart` & `core/routes/app_router.dart` (`PageRouteBuilder` with `FadeTransition`).
- **Flavors**: `DevConfig` / `StagingConfig` (dotenv), `ProductionConfig` (`--dart-define`), `.vscode/launch.json`, and all `.env` in `.gitignore`.
- **Localization**: Mandatory AR/EN with zero hardcoded strings. Always use `context.l10n.<key>`.
- **Platform UI**: Material 3 for Android/Desktop/Web, Cupertino for iOS/macOS.
- **Responsiveness**: ResponsiveLayout (<600 phone, 600-1024 tablet, >1024 desktop).
- **Widgets**: Always use Widget classes in separate files. Strictly NO widget helper methods.
- **Fastlane**: Fastfiles with flavor lanes (`deploy_dev`, `deploy_staging`, `deploy_prod`).
- **ScreenUtil**: Use `flutter_screenutil` for sizes (.w, .h, .sp, .r).
- **Theme**: Always use `CardThemeData` in `ThemeData(cardTheme: const CardThemeData(...))`. Never use `CardTheme(...)`.
- **Interactive Initializer & Build Runner**: Ask interactive questions on init, and automatically execute `dart run build_runner build --delete-conflicting-outputs` after generating code.




