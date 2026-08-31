# GitHub Copilot Custom Instructions for Flutter Enterprise Pro Max

- **Architecture**: 3-Layer Clean Architecture (Domain, Data, Presentation) adhering to strict **SOLID principles**.
- **Dependency Injection**: Injectable with GetIt. Never manually construct repositories or usecases.
- **State Management**: Cubit only with **Freezed States** (`@freezed class FeatureState with _$FeatureState`). Provides immutable union states and value equality for `bloc_test`.
- **Cubit Logic**: Always inject discrete single-responsibility UseCases (`LoginCubit(this.loginUseCase)`).
- **Data Layer**: Retrofit for DataSources, `@JsonSerializable(explicitToJson: true)` with manual `copyWith` and Model-to-Entity mappers.
- **Domain Layer**: Pure Entities (`Equatable` with `const` constructors), abstract Repositories (`ResultFuture<T>`), single-responsibility UseCases.
- **Networking**: Enterprise DioClient, AuthInterceptor, ApiErrorHandler, ApiResponse, PaginatedResponse, `dartz` `Either`.
- **Routes**: `core/routes/routes.dart` & `core/routes/app_router.dart` (`PageRouteBuilder` with `FadeTransition`).
- **Flavors**: `DevConfig` / `StagingConfig` (dotenv), `ProductionConfig` (`--dart-define`), `.vscode/launch.json`, and all `.env` in `.gitignore`.
- **Localization**: Mandatory AR/EN with zero hardcoded strings. Always use `context.l10n.<key>`.
- **Platform UI**: Material 3 for Android/Desktop/Web, Cupertino for iOS/macOS.
- **Responsiveness**: ResponsiveLayout (<600 phone, 600-1024 tablet, >1024 desktop).
- **Performance & Widgets**: Always use Widget classes in separate files with `const` constructors. Strictly NO widget helper methods.
- **ScreenUtil**: Use `flutter_screenutil` for sizes (.w, .h, .sp, .r).
- **Theme**: Always use `CardThemeData` in `ThemeData(cardTheme: const CardThemeData(...))`. Never use `CardTheme(...)`.
- **Interactive Initializer & Build Runner**: Ask 3 interactive questions on init, and automatically execute `dart run build_runner build --delete-conflicting-outputs` and `flutter analyze` after generating code.







