---
name: flutter-enterprise-pro-max
description: Universal enterprise Flutter architect, system designer, and UI/UX intelligence skill. Use when creating new Flutter projects ("init project", "create flutter app", "scaffold clean architecture"), creating features ("add feature <name>"), setting up 3-layer Clean Architecture (domain, data, presentation), configuring state management (Cubit/Bloc, Riverpod, Provider, Signals), Injectable + GetIt or Riverpod DI, sealed Result or dartz Either error handling with pure Domain Failures, routing (AppRouter or GoRouter), Mandatory Flavors (.vscode/launch.json, DevConfig, StagingConfig, ProductionConfig with --dart-define), Hardware Security, Privacy Screen, Core Design Atoms, Context-Aware AR/EN Localization, Device responsiveness, zero memory leaks, smart background isolates (compute/Isolate.run), smart RepaintBoundary optimization, material_ui / cupertino_ui packages, GitHub Workflows (auto_pr_to_dev.yml, enterprise_quality_gate_&_ci.yml), Lefthook git hooks, coverage scripts (check_coverage.dart), and comprehensive unit/widget tests for all files.
---

# 🚀 Flutter Enterprise Pro Max — AI Agent Skill

This skill turns any AI Agent into a **Principal Flutter Architect, Enterprise Software Architect & UI/UX Specialist (10+ years experience)**. It enforces a configurable, production-grade **Flutter Enterprise Engineering System** adhering to **Clean Architecture**, **SOLID Principles**, **Test-Driven Development (TDD)**, **Platform-Adaptive UI** (`material_ui` on Android/Desktop/Web, `cupertino_ui` on iOS/macOS), **Multi-Device Responsiveness** (Phones, Tablets, Desktops), **Zero Memory Leaks**, **Smart Background Isolates**, **Smart RepaintBoundary Optimization**, **Automated CI/CD Quality Gates & PR Automation**, and **Lefthook Local Git Hooks**.

---

## 0. ⚖️ Rule Priority Hierarchy

When architectural rules or trade-offs conflict, the AI Agent MUST strictly adhere to this priority order:

```
P0 — Security & Correctness   (Hardware secure storage, domain isolation, zero memory leaks)
        ↓
P1 — Architecture & SOLID     (Clean layer separation, single-responsibility UseCases, DI inversion)
        ↓
P2 — Quality Gates & Tests    (3-tier testing pyramid, Lefthook, CI Quality Gate [80%], Context-Aware L10n)
        ↓
P3 — Concurrency & Perf       (Isolates offloading, smart RepaintBoundary, bounded rebuild scopes)
        ↓
P4 — Style & Convention       (Separated widgets with keys, strict CardThemeData, snake_case)
```

> **Rule Override**: Project-specific configuration in `enterprise_flutter.yaml` overrides generic defaults.

---

## 1. 🎯 When to Activate This Skill

- When user asks to:
  - `"init project"`, `"create flutter app"`, `"scaffold new project"`
  - `"add feature <name>"`, `"generate feature <name>"`, `"scaffold clean architecture feature"`
  - `"setup flavors"`, `"configure injectable"`, `"setup routes"`, `"setup localization"`, `"setup offline sync"`
  - `"setup ci/cd"`, `"setup quality gate"`, `"configure lefthook"`, `"check coverage"`
  - `"write unit and widget tests for all files"`
  - `"design responsive screen"`, `"make layout adaptive for tablet/desktop"`, `"apply UI/UX design intelligence"`

---

## 2. 🏛️ Configurable Architecture Profiles

The system provides 4 pre-configured profiles and a fully customizable workflow:

### 🌟 Profile 1: Enterprise Clean Architecture (Default / Recommended)
- **Style**: Feature-First 3-Layer Clean Architecture (`domain`, `data`, `presentation`).
- **State Management**: **Cubit + Freezed/Sealed States**.
- **Dependency Injection**: **GetIt + Injectable** (`service_locator.dart`).
- **Network & Error**: **Retrofit + Dio** with Domain-Isolated `Result<T, Failure>` or `ResultFuture<T> = Future<Either<Failure, T>>`.
- **Navigation & Routing**: **Centralized AppRouter** with 400ms fade transition.
- **Persistence**: **FlutterSecureStorage** (hardware-encrypted) + **SharedPreferences**.
- **Flavors**: Mandatory `DevConfig`, `StagingConfig` (dotenv), and `ProductionConfig` (`--dart-define`).
- **Localization**: Context-Aware AR/EN with zero hardcoded user-facing UI strings.
- **Theme**: Material 3 with strict `CardThemeData`.

### ⚡ Profile 2: Riverpod Enterprise Architecture
- **Style**: Feature-First Clean Architecture.
- **State Management**: **Riverpod 2.x (`AsyncNotifier` / `Notifier`)**.
- **Dependency Injection**: **Riverpod Providers**.
- **Routing**: **GoRouter** (with deep linking, route guards, and web URL synchronization).
- **Network**: **Dio** with interceptors.

### 🔄 Profile 3: Offline-First Enterprise Architecture
- **Style**: Clean Architecture with Local Database & Sync Engine.
- **Local Store**: **Drift (SQLite ORM)** with SQLCipher support.
- **Sync Engine**: Offline Sync Queue, Idempotent Retries (`X-Idempotency-Key`), and Timestamp Conflict Resolution.

### 📦 Profile 4: Minimal Starter
- **Style**: Simplified Feature Architecture with Manual Factory DI.

---

## 3. 📁 Standard Project Directory Tree

```
lib/
├── core/
│   ├── adaptive/                   # Platform-Adaptive Widgets (Cupertino vs Material 3)
│   ├── bloc_observer.dart          # Global Bloc logging and error tracking
│   ├── config/                     # Environment & Flavors Configuration
│   │   ├── app_config.dart         # Central AppConfig facade (@singleton)
│   │   ├── app_flavor.dart         # AppFlavor enum (dev, staging, production)
│   │   ├── dev_config.dart         # DevConfig (.env.dev)
│   │   ├── staging_config.dart     # StagingConfig (.env.staging)
│   │   ├── production_config.dart  # ProductionConfig (--dart-define)
│   │   └── service_locator.dart    # GetIt + Injectable initialization
│   ├── errors/                     # Pure Domain Failure abstractions (Zero Dio dependencies)
│   │   ├── failure.dart            # Sealed Failure hierarchy (ServerFailure, NetworkFailure, etc.)
│   │   └── exceptions.dart         # Data-layer exceptions (ServerException, CacheException)
│   ├── extension/                  # context, theme, l10n, mediaQuery shortcuts
│   ├── network/                    # Enterprise Network Layer (Dio + Retrofit + Result)
│   ├── responsive/                 # Breakpoints & ResponsiveLayout (Phone, Tablet, Desktop)
│   ├── routes/                     # Centralized Navigation & Routing Subsystem
│   ├── services/                   # Hardware Secure Storage & Connectivity
│   ├── theme/                      # AppTheme & Design Tokens
│   ├── utils/                      # IsolateUtils (Background isolates)
│   └── widgets/                    # Separated Core Atoms (AppButton, AppTextField, etc.)
│
├── features/                       # Feature-First Modules
│   └── <feature_name>/
│       ├── data/                   # DataSources, Models (@JsonSerializable), Repos
│       ├── domain/                 # Pure Entities (Equatable), Repo Interfaces, UseCases
│       └── presentation/           # Cubit + Freezed States, Screens, Separated Widgets
│
├── scripts/
│   └── check_coverage.dart         # Code Coverage Quality Gate (Target: 80%)
│
├── .github/
│   └── workflows/
│       ├── auto_pr_to_dev.yml      # Automated PR generation on push
│       └── enterprise_quality_gate_&_ci.yml # Comprehensive CI Quality Gate
│
├── lefthook.yml                    # Local Git Hooks (pre-commit, pre-push)
├── .gitignore                      # Configured for coverage and secrets
└── main.dart                       # Entrypoint
```

---

## 4. 🛡️ DevOps, CI/CD & Quality Gate Infrastructure

When scaffolding a project (`init project`), the agent MUST automatically generate:

### 1. Workflows in `.github/workflows/`
1. **`auto_pr_to_dev.yml`**:
   - Automatically opens a Pull Request to `dev` upon any push to feature/bugfix branches (ignoring `dev`, `main`, `master`).
   - Checks if a PR already exists to avoid duplication.
   - Sets title to the latest commit message and generates markdown summary body.
2. **`enterprise_quality_gate_&_ci.yml`**:
   - Triggers on push and pull requests targeting `dev` and `main`.
   - Runs `dart format` check.
   - Runs `flutter analyze` static analysis.
   - Runs `flutter test --coverage`.
   - Strips generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`) from coverage using `lcov`.
   - Generates visual HTML report (`genhtml`).
   - Runs `dart run scripts/check_coverage.dart` to evaluate Quality Gate.
   - Publishes interactive summary directly into GitHub Actions step summary.
   - Uploads HTML report as artifact with 7-day retention.

### 2. Coverage Quality Gate Script: `scripts/check_coverage.dart`
- Located in `scripts/check_coverage.dart` at the root of the project.
- Parses `coverage/lcov.info` and excludes generated files.
- Calculates effective test coverage.
- **Coverage Target Note**:
  > ℹ️ Default target is: `const double targetCoverage = 80.0;`
  > Users can customize this value directly in `scripts/check_coverage.dart` (e.g., 70.0, 85.0, 90.0).
- Exits with code `1` if format, analysis, or tests fail.

### 3. Local Git Hooks: `lefthook.yml`
- Located at project root.
- **pre-commit**:
  - Runs `dart format {staged_files}` on staged `.dart` files.
  - Runs `flutter analyze` to prevent bad code commits.
- **pre-push**:
  - Runs `flutter test --coverage && dart run scripts/check_coverage.dart` to prevent pushing code that breaks tests or drops coverage below the target.
- **Setup Commands**:
  ```bash
  npm install -g @evilmartians/lefthook
  lefthook install
  ```

### 4. Git Ignore Configuration: `.gitignore`
Must include:
```gitignore
# Coverage reports
/coverage/

# Scripts folder ignore while keeping check_coverage.dart tracked
/scripts/*
!/scripts/check_coverage.dart
```

---

## 5. 🧪 Mandatory Comprehensive Test Suite (Unit & Widget Tests)

Whenever scaffolding a project or feature, the agent MUST generate test files for **EVERY file created**:
1. **Unit Tests** (`test/.../unit/`):
   - Data sources (mocking HTTP/Dio).
   - Models (testing `fromJson`, `toJson`, `copyWith`, and extensions).
   - Repositories (testing online success and offline `NetworkFailure`).
   - Use cases (testing business logic with `mocktail`).
   - Cubits (testing state emission flows with `bloc_test`).
   - Utilities (`isolate_utils_test.dart`, `network_info_test.dart`).
2. **Widget Tests** (`test/.../widget/`):
   - Component-level widget tests for buttons, input fields, loaders, empty states, and dialogs.
   - Screen-level widget tests verifying UI rendering, form submission, and error feedback.
- **Result**: Running `flutter test --coverage` passes 100% and satisfies the Quality Gate threshold from day one!

---

## 6. 🛡️ Domain Error Isolation & Result Pipeline

> [!CRITICAL]
> **Domain Layer MUST NOT depend on HTTP status codes, Dio, or ApiErrorModel!**
> `ApiErrorModel` belongs exclusively to the **Data Layer** as a DTO.

```
DioException (HTTP / Network Error)
          ↓
ApiErrorModel (Data Layer DTO)
          ↓
Data Layer Repository maps to: ServerFailure / NetworkFailure / UnauthorizedFailure
          ↓
Domain Contract / UseCase returns:
  typedef ResultFuture<T> = Future<Either<Failure, T>>;
  (or Result<T, Failure>)
          ↓
Presentation Layer (Cubit maps Failure -> Localized string via context.l10n)
```

---

## 7. ⚡ Performance, Concurrency & Memory Pillars

### 1. Separated Widgets + Meaningful Keys by Usage
- ✅ **ONE WIDGET PER FILE**: Every widget component MUST be an isolated `StatelessWidget` or `StatefulWidget` class in its own dedicated file. **NEVER use function widgets** (`Widget buildButton() => ...`).
- ✅ **Meaningful `Key` Assignment by Usage**:
  - `ValueKey<T>(item.id)`: Mandatory for dynamic items in ListViews, GridViews, and cards.
  - `PageStorageKey<String>('unique_scroll_key')`: Mandatory for scrollable lists/tabs to preserve scroll position.
  - `GlobalKey<FormState>()`: Reserved strictly for Form validation.
  - `ValueKey<String>('feature_action_target')`: For buttons, inputs, and interactive widgets.

### 2. Zero Memory Leaks Guarantee (Lifecycle Discipline)
- ✅ **Mandatory Controller Disposal**: Every `TextEditingController`, `AnimationController`, `ScrollController`, `PageController`, and `FocusNode` created in a `StatefulWidget` MUST be disposed inside `dispose()`:
  ```dart
  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    _streamSubscription?.cancel();
    _timer?.cancel();
    super.dispose();
  }
  ```
- ✅ **Async Context Protection**: ALWAYS check `if (!context.mounted) return;` after any `await` before touching `BuildContext`.
- ✅ **Stream & Timer Management**: All `StreamSubscription` and `Timer` instances must be cancelled upon widget disposal.

### 3. Smart Background Concurrency (`Isolate.run` / `compute`)
- ✅ **Never Block the Main UI Thread**: Keep UI rendering locked at 60/120 FPS.
- ✅ **Offload CPU-Intensive Tasks**:
  - Heavy JSON decoding / large API payload deserialization.
  - Sorting, filtering, or search across large lists (> 500 items).
  - Cryptographic hashing (AES, SHA, RSA, encryption).
  - Image transformations, resizing, or compression.
- ✅ Use `IsolateUtils.run((data) => computeHeavyTask(data), payload)` from `core/utils/isolate_utils.dart`.

### 4. Smart `RepaintBoundary` Optimization
- ✅ **Isolate High-Frequency Repaints**: Wrap elements that trigger constant re-draws in `RepaintBoundary` (loaders, spinners, Lottie, custom canvas painters, live tickers).
- ❌ **Avoid Blind Wrapping**: Do NOT wrap plain static text or basic buttons.

---

## 8. 📱 Platform-Adaptive UI (`material_ui` & `cupertino_ui`)

- 🤖 **Android, Desktop (Windows/Linux) & Web**: Use **`material_ui`** (`package:material_ui/material_ui.dart`) for Material 3 design systems.
- 🍎 **iOS & macOS**: Use **`cupertino_ui`** (`package:cupertino_ui/cupertino_ui.dart`) and `cupertino_icons` for Apple Human Interface Guidelines (HIG).
- 📱 **Multi-Device Breakpoints**:
  - **Phone (< 600dp)**: Standard vertical flow, Bottom Navigation Bar.
  - **Tablet (600dp - 1024dp)**: Multi-pane layout, Navigation Rail, 2-column grid.
  - **Desktop (> 1024dp)**: Full Sidebar Navigation, Master-Detail split layouts.

---

## 9. 🔒 Hardware-Level Security & Privacy Protection

1. **Hardware-Encrypted Secure Storage**:
   ```dart
   final storage = const FlutterSecureStorage(
     aOptions: AndroidOptions(encryptedSharedPreferences: true),
     iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
   );
   ```
2. **App Switcher Privacy Overlay**: Obscures sensitive screens when the app enters `AppLifecycleState.inactive` or `paused`.
3. **Inactivity Auto-Logout**: Detects touch inactivity and logs out users after configurable timeouts.

---

## 10. 🌍 Context-Aware Localization Standard

To avoid excessive or nonsensical abstractions, the AI Agent MUST distinguish between user-facing text and developer/system text:

### 1. User-Facing UI Strings (MUST Be Localized):
- Any text displayed to end users in the UI **MUST NOT** be hardcoded. Always use `context.l10n.<key>`.
- Examples: `Text(context.l10n.loginTitle)`, `context.l10n.invalidEmailError`, `context.l10n.retry`.

### 2. Infrastructure & Developer Strings (DO NOT Localize):
- **Internal Logs & Diagnostics**: `debugPrint('Auth token refreshed')`, `logger.d('...')`.
- **Telemetry & Analytics Events**: `analytics.logEvent(name: 'user_signed_up')`.
- **Developer Asserts & System Errors**: `assert(id.isNotEmpty)`, `ArgumentError('...')`.
- **Data Layer Exception Codes**: `ServerException(code: 'HTTP_504_TIMEOUT')`.

---

## 11. 🎨 UI/UX Pro Max: Category-Driven Design Intelligence

| Category | Visual Style & Archetype | Primary / Accent Colors | Font Pairing |
| :--- | :--- | :--- | :--- |
| 💳 **Fintech & Banking** | High-Trust / Dark Sleek | Deep Navy (`#0F172A`) + Emerald (`#10B981`) | Plus Jakarta Sans |
| 🛍️ **E-Commerce & Retail** | High-Conversion Bento Grid | Clean White (`#FFFFFF`) + Coral (`#FF5722`) | Poppins / Outfit |
| 🏥 **Healthcare & Medical** | Calm Clinical / Soft Borders | Soft Teal (`#0D9488`) + Mint (`#14B8A6`) | DM Sans |
| 🍔 **Food Delivery** | Vibrant High-Energy | Warm Crimson (`#DC2626`) + Amber (`#F59E0B`) | Outfit |
| 📊 **SaaS & Productivity** | Bento Grid High-Density | Jet Black (`#09090B`) + Violet (`#6366F1`) | Inter |
| 🏋️ **Fitness & Wellness** | High-Energy Dark / Neon | Pitch Dark (`#0A0A0A`) + Lime (`#84CC16`) | Plus Jakarta Sans |
| 🎓 **EdTech & Learning** | Gamified & Friendly | Soft Indigo (`#4F46E5`) + Gold (`#FBBF24`) | Nunito |

> [!IMPORTANT]
> **Strict Material 3 ThemeData Rule**:
> In `ThemeData`, **ALWAYS USE `CardThemeData`** for `cardTheme`:
> `cardTheme: const CardThemeData(color: AppColors.lightSurface, elevation: 0, ...)`

---

## 12. 🧙‍♂️ Interactive Initializer Questionnaire & Execution

Whenever the user asks to `"init project"`, the Agent **MUST PRESENT**:
1. **📝 Project Name & Org Domain**
2. **📱 Target Platforms & Form Factors**
3. **🏛️ Architecture Profile Selection [1-5]**
4. **🎨 UI/UX Pro Max Category [1-8]**
5. **🔥 Firebase Services Integration**
6. **🚀 Fastlane & GitHub Actions CI/CD**

### ⚡ Post-Scaffolding Automated Execution:
Immediately after creating all files and folders, the AI Agent executes:
1. `flutter pub get`
2. `dart run build_runner build --delete-conflicting-outputs` (if code generation is configured)
3. `flutter test --coverage && dart run scripts/check_coverage.dart`
4. `flutter analyze`
