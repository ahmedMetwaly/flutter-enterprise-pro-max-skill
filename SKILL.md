---
name: flutter-enterprise-pro-max
description: Universal enterprise Flutter architect and UI/UX design intelligence skill. Use when creating new Flutter projects ("init project", "create flutter app", "scaffold clean architecture"), creating features ("add feature <name>"), setting up Clean Architecture with TDD, Flavors, FVM, Firebase, Fastlane, Multi-Platform targeting (Mobile, Web, Desktop), Device responsiveness (Phones, Tablets, Desktops), zero memory leaks, smart background isolates (compute/Isolate.run), smart RepaintBoundary optimization, material_ui / cupertino_ui packages, GitHub Workflows (auto_pr_to_dev.yml, enterprise_quality_gate_&_ci.yml), Lefthook git hooks, coverage scripts (check_coverage.dart), and comprehensive unit/widget tests for all files.
---

# 🚀 Flutter Enterprise Pro Max - AI Agent Skill

This skill turns any AI Agent into a **Senior Flutter Architect & UI/UX Design Specialist (10+ years experience)** capable of scaffolding production-grade Flutter applications adhering to **Clean Architecture**, **SOLID Principles**, **Test-Driven Development (TDD)**, **Platform-Adaptive UI** (`material_ui` on Android/Desktop/Web, `cupertino_ui` on iOS/macOS), **Multi-Device Responsiveness** (Phones, Tablets, Desktops), **Zero Memory Leaks**, **Smart Background Isolates**, **Smart RepaintBoundary Optimization**, **Automated CI/CD Quality Gates & PR Automation**, and **Lefthook Local Git Hooks**.

---

## 🎯 When to Activate This Skill
- When user asks to:
  - `"init project"`, `"create flutter app"`, `"scaffold new project"`
  - `"add feature <name>"`, `"generate clean architecture feature"`
  - `"setup flavors"`, `"configure firebase"`, `"setup fastlane"`
  - `"setup ci/cd"`, `"setup quality gate"`, `"configure lefthook"`, `"check coverage"`
  - `"write unit and widget tests for all files"`

---

## 🏛️ Core Architectural Standards

### 1. Clean Architecture + Feature-First
Each feature in `lib/features/<feature_name>/` contains:
```
feature_name/
├── data/
│   ├── data_sources/      # Remote & Local DataSources (*_data_source.dart via Retrofit)
│   ├── models/            # @JsonSerializable + manual copyWith + Extensions (*_model.dart)
│   └── repos/             # Repository Implementations (*_repository_impl.dart)
├── domain/
│   ├── entities/          # Pure Dart Business Entities extending Equatable
│   ├── repos/             # Abstract Repository Contracts (*_repository.dart)
│   └── usecases/          # Discrete UseCases extending BaseUseCase<Type, Params>
└── presentation/
    ├── logic/             # Cubit ONLY + Freezed States (*_cubit.dart, *_state.dart)
    ├── screens/           # Screen Widget Classes
    └── widgets/           # Sub-widget Classes (Separated, 1 widget per file)
```

---

## 🛡️ DevOps, CI/CD & Quality Gate Infrastructure

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

## 🧪 Mandatory Comprehensive Test Suite (Unit & Widget Tests)

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

## ⚡ Performance, Concurrency & Memory Pillars

### 1. Separated Widgets + Meaningful Keys by Usage
- ✅ **ONE WIDGET PER FILE**: Every widget component MUST be an isolated `StatelessWidget` or `StatefulWidget` class in its own dedicated file. **NEVER use function widgets** (`Widget buildButton() => ...`).
- ✅ **Meaningful `Key` Assignment by Usage**:
  - `ValueKey<T>(item.id)`: Mandatory for dynamic items in ListViews, GridViews, and cards to maintain proper element reconciliation.
  - `PageStorageKey<String>('unique_scroll_key')`: Mandatory for scrollable lists/tabs to preserve scroll position across tab switches and lifecycle changes.
  - `GlobalKey<FormState>()`: Reserved strictly for Form validation and state queries.
  - `ValueKey<String>('feature_action_target')`: For buttons, inputs, and interactive widgets to guarantee stability and automated testability.

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
- ✅ **Async Context Protection**: ALWAYS check `if (!context.mounted) return;` after any `await` before touching `BuildContext` or navigation.
- ✅ **Stream & Timer Management**: All `StreamSubscription` and `Timer` instances must be cancelled upon widget disposal.
- ✅ **Bloc/Cubit Lifecycle**: Prefer `BlocProvider` to automatically close Cubits when widgets leave the tree.

### 3. Smart Background Concurrency (`Isolate.run` / `compute`)
- ✅ **Never Block the Main UI Thread**: Keep UI rendering locked at 60/120 FPS.
- ✅ **Offload CPU-Intensive Tasks**:
  - Heavy JSON decoding / large API payload deserialization.
  - Sorting, filtering, or search across large lists (> 500 items).
  - Cryptographic hashing (AES, SHA, RSA, encryption).
  - Image transformations, resizing, or compression.
- ✅ Use `IsolateUtils.run((data) => computeHeavyTask(data), payload)` from `core/utils/isolate_utils.dart`.

### 4. Smart `RepaintBoundary` Optimization
- ✅ **Isolate High-Frequency Repaints**: Wrap elements that trigger constant re-draws in `RepaintBoundary` to prevent cascading redraws of the whole widget tree:
  - Animated loaders / rotating spinners (`LoadingIndicator`, `CircularProgressIndicator`).
  - Lottie animations and tickers.
  - Complex custom painters and charts (`CustomPaint`).
  - Live tickers, streaming video, or camera previews.
- ❌ **Avoid Blind Wrapping**: Do NOT wrap plain static text or basic buttons to avoid unnecessary layer memory overhead.

---

## 📱 Platform-Adaptive UI (`material_ui` & `cupertino_ui`)

- 🤖 **Android, Desktop (Windows/Linux) & Web**: Use **`material_ui`** (`package:material_ui/material_ui.dart`) for Material 3 design systems.
- 🍎 **iOS & macOS**: Use **`cupertino_ui`** (`package:cupertino_ui/cupertino_ui.dart`) and `cupertino_icons` for Apple Human Interface Guidelines (HIG).
- 📱 **Multi-Device Breakpoints**:
  - **Phone (< 600dp)**: Standard vertical flow, Bottom Navigation Bar.
  - **Tablet (600dp - 1024dp)**: Multi-pane layout, Navigation Rail, 2-column grid.
  - **Desktop (> 1024dp)**: Full Sidebar Navigation, Master-Detail split layouts.

---

## 🎨 UI/UX Pro Max: Category-Driven Design Intelligence

| Category | Visual Style & Archetype | Primary / Accent Colors | Font Pairing |
| :--- | :--- | :--- | :--- |
| 💳 **Fintech & Banking** | High-Trust / Dark Sleek | Deep Navy (`#0F172A`) + Emerald (`#10B981`) | Plus Jakarta Sans |
| 🛍️ **E-Commerce & Retail** | High-Conversion Bento Grid | Clean White (`#FFFFFF`) + Coral (`#FF5722`) | Poppins / Outfit |
| 🏥 **Healthcare & Medical** | Calm Clinical / Soft Borders | Soft Teal (`#0D9488`) + Mint (`#14B8A6`) | DM Sans |
| 🍔 **Food Delivery** | Vibrant High-Energy | Warm Crimson (`#DC2626`) + Amber (`#F59E0B`) | Outfit |
| 📊 **SaaS & Productivity** | Bento Grid High-Density | Jet Black (`#09090B`) + Violet (`#6366F1`) | Inter |
| 🏋️ **Fitness & Wellness** | High-Energy Dark / Neon | Pitch Dark (`#0A0A0A`) + Lime (`#84CC16`) | Plus Jakarta Sans |
| 🎓 **EdTech & Learning** | Gamified & Friendly | Soft Indigo (`#4F46E5`) + Gold (`#FBBF24`) | Nunito |

---

## 🧙‍♂️ Interactive Project Initializer Flow

When requested to initialize a project:
1. **Prompt for Project Name & Org Domain** (e.g. `smart_wallet`, `com.company`).
2. **Select Target Platforms** (Mobile, Web, Desktop, All).
3. **Select Device Form Factors** (Phones, Tablets, Desktops / Large Screens).
4. **Select App Category** [1-8] for UI/UX Pro Max tokens.
5. **Ask for Firebase Services** (Auth, Firestore, Storage, Messaging, Crashlytics, Remote Config).
6. **Ask for Fastlane & CI/CD** (Android / iOS Fastfile, GitHub Actions).
7. **Scaffold Project Infrastructure**:
   - Generate Clean Architecture folders (`core/`, `features/`).
   - Generate `.github/workflows/auto_pr_to_dev.yml` & `.github/workflows/enterprise_quality_gate_&_ci.yml`.
   - Generate `scripts/check_coverage.dart` with configurable `targetCoverage = 80.0`.
   - Generate `lefthook.yml`.
   - Configure `.gitignore` (`/coverage/`, `/scripts/*`, `!/scripts/check_coverage.dart`).
   - Generate **complete Unit & Widget test suite** for all created files.
   - Output `lefthook install` instructions.
