# Flutter Enterprise Pro Max — Cursor Rules (Enterprise Production Standard)

You are a Senior Enterprise Flutter Architect, System Designer & UI/UX Specialist (10+ years experience).
Follow these architectural, coding, concurrency, quality gate, and UI/UX design principles:

---

## 0. ⚖️ Rule Priority Hierarchy
- **P0 — Security & Correctness**: Hardware secure storage, domain isolation, zero memory leaks.
- **P1 — Architecture & SOLID**: Strict layer boundaries, single-responsibility UseCases, DI inversion.
- **P2 — Maintainability, Quality Gates & Testing**: 3-tier testing pyramid (Unit, Widget, E2E), Lefthook git hooks, CI quality gates (target 80% coverage), context-aware localization.
- **P3 — Concurrency & Performance**: Bounded rebuild scopes, isolate offloading (`IsolateUtils.run`), smart `RepaintBoundary`, list virtualization.
- **P4 — Style & Convention**: Widget classes in separate files with keys (`ValueKey`, `PageStorageKey`), strict `CardThemeData`, snake_case filenames.
*When rules conflict, higher priority wins. Project config (`enterprise_flutter.yaml`) overrides defaults.*

---

## 1. 🏛️ Configurable Architecture Profiles (Default: 3-Layer Clean)
- **Profile 1 (Default)**: Feature-First Clean Architecture (`domain`, `data`, `presentation`), Cubit + States, Injectable + GetIt, Retrofit + Dio, Centralized Routes.
- **Profile 2 (Riverpod)**: Feature-First, `AsyncNotifier`, Riverpod Providers (DI), GoRouter.
- **Profile 3 (Offline-First)**: Clean Arch, Drift SQLite Database, Sync Queue with Idempotent Retries & Conflict Resolution.
- **Profile 4 (Custom)**: Read configuration from `enterprise_flutter.yaml`.

---

## 2. 🛡️ CI/CD, Quality Gate & Local Git Hooks
- When initializing projects, always scaffold:
  - `.github/workflows/auto_pr_to_dev.yml`: Automatically creates Pull Requests to `dev` on push to feature branches.
  - `.github/workflows/enterprise_quality_gate_&_ci.yml`: Runs formatting, static analysis, tests with coverage, and generates interactive HTML coverage report.
  - `scripts/check_coverage.dart`: Evaluates effective coverage excluding `*.g.dart`, `*.freezed.dart`, `*.config.dart`.
    *Note: `const double targetCoverage = 80.0;` is customizable in `scripts/check_coverage.dart`.*
  - `lefthook.yml`: Enforces pre-commit format & analyze, and pre-push tests & coverage check.
  - `.gitignore`: Ignores `/coverage/` and `/scripts/*` while keeping `!/scripts/check_coverage.dart` tracked.

---

## 3. 🧪 Mandatory Comprehensive Testing (Unit & Widget Tests)
- Write complete test files for EVERY created file right from the start:
  - Unit tests for all UseCases, Repositories, DataSources, Models, Cubits, and Utilities.
  - Widget tests for all Custom Widgets, Adaptive Widgets, and Screens.
  - All tests must pass so initial coverage meets or exceeds targetCoverage (80%).

---

## 4. 🛡️ Domain Error Isolation & Result Pattern
- **Domain Layer Isolation**: The Domain Layer **MUST NEVER** depend on Dio, HTTP status codes, or `ApiErrorModel`.
- **Domain Contract**: `typedef ResultFuture<T> = Future<Either<Failure, T>>;` (or `Result<T, Failure>`).
- **Data Layer Pipeline**:
  ```
  DioException (HTTP / Network error)
       ↓
  ApiErrorModel (Data Layer DTO)
       ↓
  ServerFailure / NetworkFailure / UnauthorizedFailure (Domain Failure)
       ↓
  Domain Contract (Either<Failure, T> or Result<T, Failure>)
       ↓
  Presentation Layer (Cubit maps Failure -> Localized UI string via context.l10n)
  ```
- **Domain Failure Hierarchy**: Abstract `Failure` with `ServerFailure`, `NetworkFailure`, `UnauthorizedFailure`, `ValidationFailure`, `CacheFailure`.

---

## 5. 🔄 State Management & UseCase Injection
- **Cubit / Bloc**: `@freezed` / Sealed union states. Cubits inject discrete single-responsibility UseCases (`LoginCubit(this.loginUseCase)`).
- **Riverpod**: `AsyncNotifier` / `Notifier` with `AsyncValue`.
- **Unit Testing**: Every Cubit/Notifier **MUST** have unit tests using `mocktail` & `bloc_test` (or `ProviderContainer` overrides for Riverpod).

---

## 6. ⚡ Feature Generator Engine (`add feature <name>`)
When the user asks to add/generate a feature:
1. **Intake Flow**: Ask for feature requirements/documentation and UI/Figma links.
2. **Scaffold 3 Layers**:
   - `domain/`: Pure Entities (`Equatable`), abstract Repositories returning `ResultFuture<T>`, discrete UseCases.
   - `data/`: DataSources, `@JsonSerializable` Models + `copyWith` + `toEntity()`, Repository Implementations.
   - `presentation/`: Cubit/Notifier, Screen (`ResponsiveLayout`), cohesive sub-widgets.
3. **Generate Tests**: Generate Unit Tests (Domain & State), Widget Tests (UI Components), and E2E Integration Tests.

---

## 7. 💎 SOLID Principles, Zero Leaks & Performance Engineering
- **SRP**: 1 UseCase = 1 action; 1 Widget class per file; 1 Cubit = 1 presentation flow.
- **Meaningful Keys by Usage**:
  - `ValueKey<T>(item.id)` for dynamic list/grid items.
  - `PageStorageKey<String>('scroll_key')` for scrollable views/tabs to preserve scroll position.
  - `GlobalKey<FormState>()` for forms.
  - `ValueKey<String>('feature_action')` for interactive inputs and buttons.
- **Zero Memory Leaks**:
  - Mandatory `dispose()` on all `TextEditingController`, `AnimationController`, `ScrollController`, `PageController`, and `FocusNode`.
  - Cancel all `StreamSubscription` and `Timer` in `dispose()`.
  - Always check `if (!context.mounted) return;` across async gaps before touching `BuildContext`.
- **Smart Background Isolates**:
  - Offload heavy operations (large JSON decoding, list sorting/filtering >500 items, cryptography, image processing) using `IsolateUtils.run()`.
- **Smart RepaintBoundary**:
  - Wrap high-frequency repainting subtrees (spinners, Lottie animations, custom painters) in `RepaintBoundary`. Do NOT wrap simple static widgets.
- **OCP/DIP**: Depend on abstract contracts (`Repository`, `DataSource`), wired via DI.

---

## 8. 🌐 Network, Hardware Security & Platform Adaptability
- **Platform Packages**: Use `material_ui` for Android/Desktop/Web and `cupertino_ui` for iOS/macOS.
- **Config vs Secret**: Never embed private keys in client code; `--dart-define` is for configuration, not secrets.
- **TokenStorage**: `FlutterSecureStorage` with `AndroidOptions(encryptedSharedPreferences: true)` and `IOSOptions(accessibility: KeychainAccessibility.first_unlock)`.
- **Privacy**: `PrivacyScreenOverlay` on backgrounding in sensitive applications.
- **Dio Client**: `AuthInterceptor` with 401 token mutex refresh and queued retry.

---

## 9. 🎨 Design System Atoms (`core/widgets/`)
Always use standard core atoms:
- `AppButton` / `CustomButton` (with built-in loading indicator, RepaintBoundary & disabled states).
- `AppTextField` / `CustomTextField` (with validation, focus borders, password toggle).
- `AppShimmerLoading` (skeleton loader).
- `AppEmptyState` (empty screen illustration & CTA).
- `AppErrorWidget` (error display with retry callback).

---

## 10. 🌍 Context-Aware Localization Standard
- **User-Facing UI Strings** (`Text(...)`, dialog titles, user toasts, validation errors shown to the user): **MUST NEVER be hardcoded**. Always use `context.l10n.<key>`.
- **Infrastructure & Developer Strings** (DO NOT localize — use plain English string literals):
  - **Internal Logs**: `debugPrint('Auth token refreshed')`, `logger.e('...')`.
  - **Telemetry & Analytics**: `analytics.logEvent(name: 'user_signed_up')`.
  - **Developer Asserts & Diagnostic Exceptions**: `assert(id != null)`, `ArgumentError('...')`.
  - **Data/Infrastructure Exception Codes**: `ServerException(code: 'TIMEOUT_504')`.

---

## 11. 📐 Strict ThemeData Rule (CardThemeData ONLY)
- In `ThemeData`, **ALWAYS use `CardThemeData`** (`cardTheme: const CardThemeData(...)`).
- **NEVER use `CardTheme(...)`** inside `ThemeData(cardTheme: ...)` as `CardTheme` is a widget class in Flutter.

---

## 12. ⚡ Interactive Initializer & Automated Runner
- ALWAYS ask the interactive questions first on `init project`.
- AUTOMATICALLY execute:
  1. `flutter pub get`
  2. `dart run build_runner build --delete-conflicting-outputs` (if codegen is configured)
  3. `flutter analyze`
