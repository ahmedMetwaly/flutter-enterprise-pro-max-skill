# Claude Code Project Guidelines — Flutter Enterprise Pro Max

## Architecture & Standards (Production Enterprise Standard)

- **Rule Priority**: P0 (Security & Correctness) > P1 (Architecture & SOLID) > P2 (Maintainability & Testing) > P3 (Performance) > P4 (Style).
- **Architecture Profiles**:
  - **Profile 1 (Default)**: Feature-First 3-Layer Clean Architecture (`domain`, `data`, `presentation`), Cubit + States, Injectable + GetIt, Retrofit + Dio, Centralized Routes.
  - **Profile 2 (Riverpod)**: Feature-First, `AsyncNotifier`, Riverpod Providers (DI), GoRouter.
  - **Profile 3 (Offline-First)**: Clean Arch, Drift SQLite, Sync Queue Engine with Idempotent Retries.
  - **Profile 4 (Custom)**: Configured in `enterprise_flutter.yaml`.
- **Domain Error Isolation**:
  - Domain Layer NEVER depends on Dio, HTTP status codes, or `ApiErrorModel`.
  - Domain contracts use `typedef ResultFuture<T> = Future<Either<Failure, T>>;` (or `Result<T, Failure>`).
  - Data repositories map `DioException` / `ApiErrorModel` into domain `Failure`s (`ServerFailure`, `NetworkFailure`, `UnauthorizedFailure`).
- **Feature Generation (`add feature <name>`)**:
  - Ask for user stories/documentation and UI/Figma links.
  - Scaffold 3 layers under strict SOLID principles.
  - Generate full 3-tier tests (Unit, Widget, and E2E Integration tests).
- **State Management**: Cubit or Riverpod with immutable states and UseCase dependency injection.
- **Unit Testing**: Standardized unit tests with `mocktail` & `bloc_test` (or `ProviderContainer` overrides for Riverpod).
- **Security & Privacy**: Hardware-encrypted `TokenStorage` (`encryptedSharedPreferences: true`, `first_unlock`), `PrivacyScreenOverlay` on backgrounding.
- **Core Atoms**: `AppButton`, `AppTextField`, `AppShimmerLoading`, `AppEmptyState`, `AppErrorWidget` in `core/widgets/`.
- **Theme**: Always use `CardThemeData` in `ThemeData(cardTheme: const CardThemeData(...))`. Never use `CardTheme(...)`.
- **Context-Aware Localization**:
  - **User-Facing UI Strings** (`Text(...)`, dialogs, error banners shown to user): MUST be localized via `context.l10n.<key>`.
  - **Infrastructure & Dev Strings** (Logs `debugPrint`, Telemetry events, Asserts, Data Exception codes): DO NOT localize; keep as plain English string literals.
- **Automated Runner**: Automatically run `flutter pub get`, `build_runner` (if needed), and `flutter analyze` after scaffolding.
