<div align="center">

# 🚀 Flutter Enterprise Pro Max
### Universal AI Agent Skill & Enterprise Architecture Decision System for Flutter
*Engineered by 10+ Year Senior Principal Flutter & Enterprise Software Architects*

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Configurable%20Clean%20%7C%20Riverpod%20%7C%20Offline--First-brightgreen)](https://github.com)
[![Quality Gate](https://img.shields.io/badge/CI%2FCD-Quality%20Gate%20%26%20Auto%20PR-blueviolet)](https://github.com)
[![Lefthook](https://img.shields.io/badge/Git%20Hooks-Lefthook-red)](https://github.com)
[![SOLID](https://img.shields.io/badge/Principles-SOLID%20%26%20Zero%20Leaks-blue)](https://github.com)
[![Platform](https://img.shields.io/badge/Packages-material__ui%20%7C%20cupertino__ui-orange)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)

*Turn any AI Agent (Antigravity, Cursor, Claude Code, Windsurf, Copilot) or Terminal into a **10-Year Senior Principal Flutter Architect & UI/UX Specialist**.*

</div>

---

## 📑 Table of Contents
1. [Overview & Core Architecture](#-overview--core-architecture)
2. [CI/CD, Quality Gate & Git Hooks](#-cicd-quality-gate--git-hooks)
   - [Automated GitHub Workflows](#1-automated-github-workflows)
   - [Code Coverage Quality Gate (check_coverage.dart)](#2-code-coverage-quality-gate-check_coveragedart)
   - [Unified Local Quality Gate (lefthook.yml)](#3-unified-local-quality-gate-lefthookyml)
   - [Git Ignore Configuration](#4-git-ignore-configuration)
3. [Mandatory Comprehensive Testing (Unit & Widget Tests)](#-mandatory-comprehensive-testing-unit--widget-tests)
4. [Configurable Architecture Profiles](#-configurable-architecture-profiles)
5. [Domain Error Isolation Principle](#-domain-error-isolation-principle)
6. [Core Engineering, Concurrency & Performance Pillars](#-core-engineering-concurrency--performance-pillars)
   - [Separated Widgets & Meaningful Keys](#1-separated-widgets--meaningful-keys-by-usage)
   - [Zero Memory Leaks Guarantee](#2-zero-memory-leaks-guarantee)
   - [Smart Background Concurrency (Isolates)](#3-smart-background-concurrency-isolates)
   - [Smart RepaintBoundary Optimization](#4-smart-repaintboundary-optimization)
   - [Platform Packages: material_ui & cupertino_ui](#5-platform-packages-material_ui--cupertino_ui)
7. [Context-Aware Localization Standard](#-context-aware-localization-standard)
8. [Feature Generator Engine (`add feature <name>`)](#-feature-generator-engine-add-feature-name)
9. [Hardware-Level Security & Privacy Protection](#-hardware-level-security--privacy-protection)
10. [Universal Installation Matrix](#-universal-installation-matrix)
    - [Google Antigravity / Gemini CLI](#1-google-antigravity--gemini-cli)
    - [Cursor IDE](#2-cursor-ide)
    - [Claude Code](#3-claude-code)
    - [Windsurf / Cascade](#4-windsurf--cascade)
    - [GitHub Copilot](#5-github-copilot)
    - [Standalone Terminal CLI](#6-standalone-terminal-cli-no-ai-required)
11. [UI/UX Pro Max: Category Design Tokens](#-uiux-pro-max-category-design-tokens)
12. [Platform-Adaptive & Responsive Architecture](#-platform-adaptive--responsive-architecture)
13. [Project Directory Tree Layout](#-project-directory-tree-layout)
14. [Troubleshooting & FAQ](#-troubleshooting--faq)
15. [License](#-license)

---

## 📖 Overview & Core Architecture

**Flutter Enterprise Pro Max** is an enterprise-grade AI Agent Skill and scaffolding framework engineered to enforce the highest industry standards:
* **🏛️ Clean Architecture & SOLID Principles**: Pure Dart Domain Layer, isolated Data Layer (Retrofit + JsonSerializable), and Cubit/Freezed Presentation Layer.
* **🛡️ Quality Gate & Automated CI/CD**: Auto-PR generation to `dev`, static analysis, test execution, LCOV report generation, and interactive GitHub Actions summary.
* **🪝 Local Git Hooks with Lefthook**: Enforces formatting and analysis before commit, and executes tests with coverage before push.
* **🧪 100% Comprehensive Tests**: Unit and Widget tests for every created file right from the start.
* **📦 Enterprise UI Packages**: Utilizes **`material_ui`** for Android/Desktop/Web and **`cupertino_ui`** for iOS/macOS.
* **🧩 Separated Widgets with Explicit Keys**: Every widget in its own file as a class with purposeful keys (`ValueKey`, `PageStorageKey`, `GlobalKey`).
* **🛡️ Zero Memory Leaks Guarantee**: Strict lifecycle management and disposal for controllers, nodes, subscriptions, and timers.
* **⚡ Smart Concurrency & Isolates**: Heavy computations offloaded to background threads using `IsolateUtils.run()` to maintain 60/120 FPS.
* **🎯 Smart RepaintBoundary Optimization**: High-frequency repainting animations and loaders isolated to prevent cascading redraws.

---

## 🛡️ CI/CD, Quality Gate & Git Hooks

### 1. Automated GitHub Workflows

When scaffolding a project, two enterprise GitHub Workflows are automatically placed in `.github/workflows/`:

#### 🚀 `auto_pr_to_dev.yml`
* Automatically opens a Pull Request to `dev` upon any `git push` to feature or bugfix branches (ignoring `dev`, `main`, `master`).
* Checks if a PR already exists for the branch to avoid duplicate PR spam.
* Generates PR title from the latest commit message and injects markdown summary details.

#### 🛡️ `enterprise_quality_gate_&_ci.yml`
* Runs on push and PR targeting `dev` and `main`.
* Checks `dart format`.
* Runs `flutter analyze`.
* Runs `flutter test --coverage`.
* Filters generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`) from coverage using `lcov`.
* Generates interactive visual HTML report (`genhtml`).
* Runs `dart run scripts/check_coverage.dart` to verify that coverage meets the Quality Gate threshold.
* Publishes interactive summary table into the GitHub Actions step summary and archives the HTML report for 7 days.

---

### 2. Code Coverage Quality Gate (`scripts/check_coverage.dart`)

Located at `scripts/check_coverage.dart`. Parses `coverage/lcov.info`, excludes generated files, and evaluates the project against the coverage threshold.

> [!NOTE]
> **Customizing Coverage Threshold:**
> Inside `scripts/check_coverage.dart`, the target coverage is defined as:
> ```dart
> const double targetCoverage = 80.0;
> ```
> You can easily adjust this value (e.g. `70.0`, `85.0`, `90.0`) according to your team's quality standards.

---

### 3. Unified Local Quality Gate (`lefthook.yml`)

Placed at the root of the project to guard against bad commits and broken pushes before code reaches GitHub:

```yaml
pre-commit:
  parallel: false
  commands:
    1_formatting:
      glob: "*.dart"
      run: dart format {staged_files}
      stage_fixed: true

    2_analyzer:
      run: flutter analyze
      fail_text: "❌ Static analysis failed! Fix all warnings and errors before committing."

pre-push:
  parallel: false
  commands:
    tests_and_coverage:
      run: flutter test --coverage && dart run scripts/check_coverage.dart
      fail_text: "❌ Tests failed or Code Coverage check did not pass!"
```

#### ⚙️ Setting Up Lefthook on Your Machine
If you have `npm` (Node.js installed):
```bash
# 1. Install Lefthook globally (one-time setup)
npm install -g @evilmartians/lefthook

# 2. Inside your Flutter project directory, activate Git hooks:
lefthook install
```
*Note: `lefthook install` is run only once per project.*

---

### 4. Git Ignore Configuration

The `.gitignore` template is pre-configured to ignore coverage outputs and scripts while ensuring the CI coverage script remains tracked:
```gitignore
# Coverage reports
/coverage/

# Scripts folder ignore while keeping check_coverage.dart tracked
/scripts/*
!/scripts/check_coverage.dart
```

---

## 🧪 Mandatory Comprehensive Testing (Unit & Widget Tests)

Whenever scaffolding a project or adding a feature, the agent automatically creates test files for **ALL created files**:
* **Unit Tests** (`test/.../unit/`):
  - Data sources (mocking HTTP/Dio).
  - Models (verifying `fromJson`, `toJson`, `copyWith`, and extensions).
  - Repositories (testing online success and offline handling).
  - Use cases (testing business logic with `mocktail`).
  - Cubits (testing state transitions with `bloc_test`).
  - Utilities (`isolate_utils_test.dart`, `network_info_test.dart`).
* **Widget Tests** (`test/.../widget/`):
  - Component-level widget tests for buttons, input fields, loaders, empty states, and dialogs.
  - Screen-level widget tests verifying UI rendering, form submission, and error handling.

---

## 🏛️ Configurable Architecture Profiles

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

## 🛡️ Domain Error Isolation Principle

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

## ⚡ Core Engineering, Concurrency & Performance Pillars

### 1. Separated Widgets & Meaningful Keys by Usage
- **One Widget Per File**: Every UI component is built as a separate `StatelessWidget` or `StatefulWidget` class. **Zero function widgets** (`Widget myButton() => ...`).
- **Targeted Keys**:
  - `ValueKey<T>(item.id)`: Mandatory for dynamic list/grid items.
  - `PageStorageKey<String>('scroll_key')`: Mandatory for scrollable lists/tabs to preserve scroll position across tab switches.
  - `GlobalKey<FormState>()`: Reserved strictly for Form validation.
  - `ValueKey<String>('feature_action')`: For buttons and interactive inputs for automated testing and element reconciliation.

### 2. Zero Memory Leaks Guarantee
- **Mandatory Controller Disposal**: Every `TextEditingController`, `AnimationController`, `ScrollController`, `PageController`, and `FocusNode` created in a `StatefulWidget` is disposed inside `dispose()`.
- **Stream & Timer Management**: All `StreamSubscription` and `Timer` instances are cancelled in `dispose()`.
- **Async Context Protection**: Always verify `if (!context.mounted) return;` across async gaps before using `BuildContext`.

### 3. Smart Background Concurrency (Isolates)
- **UI Thread Protection**: The main isolate is kept free of CPU-heavy workloads to prevent dropped frames (guaranteeing 60/120 FPS).
- **Automated Isolate Offloading**: Heavy JSON parsing, cryptographic operations, image processing, and large list filtering are run via `IsolateUtils.run()`.

### 4. Smart RepaintBoundary Optimization
- **Isolate Animations**: Elements that tick or repaint frequently (rotating spinners, Lottie animations, custom painters, video feeds) are isolated with `RepaintBoundary` so they do not trigger repainting of the parent screen.

### 5. Platform Packages: `material_ui` & `cupertino_ui`
- **Android, Desktop & Web**: Powered by `package:material_ui/material_ui.dart`.
- **iOS & macOS**: Powered by `package:cupertino_ui/cupertino_ui.dart` and `cupertino_icons`.

---

## 🌍 Context-Aware Localization Standard

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

## ⚡ Feature Generator Engine (`add feature <name>`)

When user asks to add or generate a feature:
1. **Intake Flow**: Prompts for requirements, data contract, and UI mockup.
2. **Scaffold 3 Layers**:
   - `domain/`: Pure Entities (`Equatable`), abstract Repositories (`ResultFuture<T>`), discrete UseCases.
   - `data/`: DataSources, `@JsonSerializable` Models + `copyWith` + `toEntity()`, Repository Implementations.
   - `presentation/`: Cubit/Notifier, Screen (`ResponsiveLayout`), cohesive sub-widgets.
3. **Generate Tests**: Unit tests (Domain & Cubits) + Widget tests (Components & Screen).

---

## 🔒 Hardware-Level Security & Privacy Protection

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

## 🤖 Universal Installation Matrix

### 1️⃣ Google Antigravity / Gemini CLI

#### 🔹 Using Windows PowerShell
```powershell
if (!(Test-Path "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max")) { 
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max" | Out-Null 
}
Copy-Item "SKILL.md" "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md" -Force
```

#### 🔹 Using Windows Command Prompt (CMD)
```cmd
if not exist "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max" mkdir "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max"
copy "SKILL.md" "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md"
```

#### 🔹 Using macOS / Linux
```bash
mkdir -p ~/.gemini/config/plugins/flutter/skills/flutter-enterprise-pro-max
cp SKILL.md ~/.gemini/config/plugins/flutter/skills/flutter-enterprise-pro-max/SKILL.md
```

---

### 2️⃣ Cursor IDE
Copy `rules/.cursorrules` to your project root:
```powershell
Copy-Item "rules\.cursorrules" ".cursorrules" -Force
```

---

### 3️⃣ Claude Code
Copy `rules/CLAUDE.md` to your workspace root:
```powershell
Copy-Item "rules\CLAUDE.md" "CLAUDE.md" -Force
```

---

### 4️⃣ Windsurf / Cascade
Copy `rules/.windsurfrules` into your workspace root:
```powershell
Copy-Item "rules\.windsurfrules" ".windsurfrules" -Force
```

---

### 5️⃣ GitHub Copilot
Copy `rules/copilot-instructions.md` into your `.github/` folder:
```powershell
if (!(Test-Path ".github")) { New-Item -ItemType Directory -Force -Path ".github" | Out-Null }
Copy-Item "rules\copilot-instructions.md" ".github\copilot-instructions.md" -Force
```

---

### 6️⃣ Standalone Terminal CLI (No AI Required)
```bash
# Cross-Platform Dart
dart run bin/init.dart

# Windows PowerShell
powershell -ExecutionPolicy Bypass -File .\bin\init.ps1
```

---

## 🎨 UI/UX Pro Max: Category Design Tokens

| Category | Visual Archetype | Primary / Accent Colors | Font Pairing | Key Components |
| :--- | :--- | :--- | :--- | :--- |
| 💳 **Fintech & Banking** | High-Trust / Dark Sleek | Deep Navy (`#0F172A`) + Emerald (`#10B981`) | Plus Jakarta Sans | Balance Card, Biometrics, Interactive Charts |
| 🛍️ **E-Commerce & Retail** | High-Conversion Bento Grid | Clean White (`#FFFFFF`) + Coral (`#FF5722`) | Poppins / Outfit | Product Cards, Floating Buy Bar, Skeleton Loading |
| 🏥 **Healthcare & Medical** | Calm Clinical / Soft Borders | Soft Teal (`#0D9488`) + Mint (`#14B8A6`) | DM Sans | High-contrast data, Appointment Cards |
| 🍔 **Food Delivery** | Vibrant High-Energy | Warm Crimson (`#DC2626`) + Amber (`#F59E0B`) | Outfit | Order Tracker Timeline, Floating Location Bar |
| 📊 **SaaS & Productivity** | Bento Grid High-Density | Jet Black (`#09090B`) + Violet (`#6366F1`) | Inter | High-Density Tables, Sidebar Navigation |
| 🏋️ **Fitness & Wellness** | High-Energy Dark / Neon | Pitch Dark (`#0A0A0A`) + Lime (`#84CC16`) | Plus Jakarta Sans | Progress Rings, Bold Stats Cards |
| 🎓 **EdTech & Learning** | Gamified & Friendly | Soft Indigo (`#4F46E5`) + Gold (`#FBBF24`) | Nunito | Lesson Progress, Gamification Badges |

> [!IMPORTANT]
> **Strict Material 3 ThemeData Rule**:
> In `ThemeData`, **ALWAYS USE `CardThemeData`** for `cardTheme`:
> `cardTheme: const CardThemeData(color: AppColors.lightSurface, elevation: 0, ...)`

---

## 📱 Platform-Adaptive & Responsive Architecture

* **Breakpoints**: Phone (< 600dp), Tablet (600dp - 1024dp with Navigation Rail), Desktop (> 1024dp with Sidebar).
* **Adaptive Widgets**: Automatically switch between `material_ui` and `cupertino_ui` based on target OS.

---

## 📁 Project Directory Tree Layout

```
lib/
├── core/                                # Shared infrastructure
│   ├── adaptive/                        # Platform-Adaptive Widgets (Cupertino vs Material 3)
│   ├── config/                          # AppConfig & EnvironmentType (dev, staging, prod)
│   ├── constants/                       # ApiConstants & route paths
│   ├── di/                              # Dependency Injection (GetIt)
│   ├── enums/                           # Rich Enums (displayName, color, icon, json)
│   ├── errors/                          # Failures, Exceptions & ErrorHandler
│   ├── network/                         # DioFactory, Interceptors, NetworkInfo
│   ├── responsive/                      # Breakpoints & ResponsiveLayout (Phone, Tablet, Desktop)
│   ├── routing/                         # GoRouter configuration
│   ├── theme/                           # AppTheme, Design Tokens & Typography
│   ├── usecases/                        # BaseUseCase<Type, Params> & NoParams
│   ├── utils/                           # IsolateUtils, AppLogger
│   └── widgets/                         # Shared Custom Widgets (One widget per file)
│
├── features/                            # Feature-First Modules
│   └── auth/
│       ├── data/                        # Retrofit DataSources, Models, Repos
│       ├── domain/                      # Entities, Repo Interfaces, UseCases
│       └── presentation/                # Cubit + Freezed States, Screens, Widgets
│
├── scripts/
│   └── check_coverage.dart              # Code Coverage Quality Gate (Target: 80%)
│
├── .github/
│   └── workflows/
│       ├── auto_pr_to_dev.yml           # Automated PR generation on push
│       └── enterprise_quality_gate_&_ci.yml # Comprehensive CI Quality Gate
│
├── lefthook.yml                         # Local Git Hooks (pre-commit, pre-push)
├── .gitignore                           # Ignores coverage, env secrets, scripts cache
├── main_dev.dart                        # Dev Flavor Entrypoint
├── main_staging.dart                    # Staging Flavor Entrypoint
└── main_prod.dart                       # Production Flavor Entrypoint
```

---

## ❓ Troubleshooting & FAQ

#### Q1: Error `'Copy-Item' is not recognized as an internal or external command`?
* **Cause**: You ran a PowerShell command inside Windows **Command Prompt (CMD)**.
* **Fix**: Use the CMD copy syntax or switch to PowerShell.

#### Q2: Error `File init.ps1 cannot be loaded because running scripts is disabled`?
* **Fix**: Run PowerShell with execution policy bypass:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .\bin\init.ps1
  ```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
