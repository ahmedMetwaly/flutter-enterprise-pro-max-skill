<div align="center">

# 🚀 Flutter Enterprise Pro Max
### Universal AI Agent Skill & Enterprise Architecture Decision System for Flutter
*Engineered by 10+ Year Senior Principal Flutter & Enterprise Software Architects*

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Configurable%20Clean%20%7C%20Riverpod%20%7C%20Offline--First-brightgreen)](https://github.com)
[![SOLID](https://img.shields.io/badge/Principles-SOLID%20%26%20High%20Performance-blue)](https://github.com)
[![Localization](https://img.shields.io/badge/Localization-Context--Aware%20AR%2FEN-green)](https://github.com)
[![Testing](https://img.shields.io/badge/Testing-Unit%20%7C%20Widget%20%7C%20E2E-success)](https://github.com)
[![Flavors](https://img.shields.io/badge/Flavors-Dev%20%7C%20Staging%20%7C%20Prod-orange)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)

*Turn any AI Agent (Antigravity, Cursor, Claude Code, Windsurf, Copilot) or Terminal into a **10-Year Senior Principal Flutter Architect & UI/UX Specialist**.*

</div>

---

## 📑 Table of Contents
1. [Overview & Core Architecture](#-overview--core-architecture)
2. [Configurable Architecture Profiles](#-configurable-architecture-profiles)
3. [Domain Error Isolation Principle](#-domain-error-isolation-principle)
4. [Context-Aware Localization Standard](#-context-aware-localization-standard)
5. [Feature Generator Engine (`add feature <name>`)](#-feature-generator-engine-add-feature-name)
6. [3-Tier Testing Pyramid & Standard](#-3-tier-testing-pyramid--standard)
7. [Universal Installation Matrix](#-universal-installation-matrix)
   - [Google Antigravity / Gemini CLI](#1-google-antigravity--gemini-cli)
   - [Cursor IDE](#2-cursor-ide)
   - [Claude Code](#3-claude-code)
   - [Windsurf / Cascade](#4-windsurf--cascade)
   - [GitHub Copilot](#5-github-copilot)
   - [Standalone Terminal CLI](#6-standalone-terminal-cli-no-ai-required)
8. [UI/UX Pro Max: Category Design Tokens](#-uiux-pro-max-category-design-tokens)
9. [Platform-Adaptive & Responsive Architecture](#-platform-adaptive--responsive-architecture)
10. [Project Directory Layout](#-project-directory-layout)
11. [Interactive Prompts & Usage Examples](#-interactive-prompts--usage-examples)
12. [CLI Tools & Commands](#-cli-tools--commands)
13. [Automated Repository Validation](#-automated-repository-validation)
14. [Troubleshooting & FAQ](#-troubleshooting--faq)
15. [License](#-license)

---

## 📖 Overview & Core Architecture

**Flutter Enterprise Pro Max** is a complete, production-grade AI Agent Skill and scaffolding framework engineered to enforce enterprise engineering standards:

* **🏛️ 3-Layer Clean Architecture & Strict SOLID Principles**:
  - **Pure Dart Domain Layer**: Entities extending `Equatable` with `const` constructors, abstract Repository contracts returning `ResultFuture<T>`, and discrete single-responsibility UseCases. Zero UI and zero HTTP/Dio dependencies.
  - **Isolated Data Layer**: Retrofit DataSources (`*_datasource.dart`), `@JsonSerializable` Models with manual `copyWith` + Mappers, and Repository implementations (`@LazySingleton(as: *Repo)`).
  - **High-Performance Presentation Layer**: Cubits with immutable states, Responsive Screens, and cohesive sub-widgets (strictly ONE widget class per file).
* **🔄 Cubit + Freezed States (Value Equality & Unit Test Ready)**:
  - Clean `@freezed class FeatureState with _$FeatureState` union states (`initial`, `loading`, `success`, `failure`).
  - Immutable value equality out-of-the-box for effortless testing with `bloc_test` and `emitsInOrder`.
  - Cubits strictly inject single-responsibility UseCases (`LoginCubit(this.loginUseCase)`).
* **🧪 Standardized Unit Testing with `mocktail` & `bloc_test`**:
  - Mock UseCases (`class MockLoginUseCase extends Mock implements LoginUseCase {}`), test initial state, happy path, and error path with `verify(...).called(1)`.
* **🛰️ Global Observability & Zone Guard**:
  - `AppBlocObserver` logging bloc creation, state changes, errors, and close events with environment switches.
  - Global `runZonedGuarded` and `FlutterError.onError` handler in `main_common.dart`.
* **📜 Standardized Infinite Pagination**:
  - `PaginatedListState<T>` with Freezed and reusable `PaginationScrollListener` triggering at 80% scroll depth.
* **🌐 Centralized Connectivity & Offline Handling**:
  - `ConnectivityService` via `connectivity_plus` with broadcast streams for real-time network state monitoring.
* **🔒 Enterprise Hardware-Level Storage & Privacy**:
  - `FlutterSecureStorage` with `AndroidOptions(encryptedSharedPreferences: true)` and `IOSOptions(accessibility: KeychainAccessibility.first_unlock)`.
  - `PrivacyScreenOverlay` obscuring sensitive screens in the App Switcher when backgrounded.
* **🎨 Core Design System Atoms (`core/widgets/`)**:
  - Ready-to-use production UI atoms: `AppButton` (with built-in loading indicator), `AppTextField` (with validation and password toggle), `AppShimmerLoading`, `AppEmptyState`, `AppErrorWidget` (with retry).
* **💉 Injectable + GetIt Dependency Injection**: Inversion of control using `@singleton`, `@LazySingleton(as: Interface)`, `@lazySingleton`, `@injectable`, and `@module`.
* **🌐 Production Network Subsystem with Functional Either**:
  - `DioClient` with `PrettyDioLogger` and timeout settings.
  - `AuthInterceptor` with thread-safe token refresh mutex (`Completer`), token storage, and automatic retry of queued requests.
  - `ApiErrorHandler` mapping Dio errors to structured `ApiErrorModel`.
  - `ResultFuture<T> = Future<Either<Failure, T>>` functional error paradigm powered by `package:dartz` and pure domain `Failure` abstractions.
* **🚦 Centralized Navigation & Routing**:
  - `core/routes/routes.dart` (static string constants) and `core/routes/app_router.dart` (`PageRouteBuilder` with 400ms fade transition) or `go_router`.
* **🚩 Mandatory Multi-Environment Flavors & Launch Profiles**:
  - `dev`, `staging`, and `production` with `DevConfig`, `StagingConfig` (dotenv), and `ProductionConfig` (`--dart-define`).
  - `.vscode/launch.json` generated for 1-click debugging.
  - All `.env` files automatically ignored in `.gitignore`.
* **🌍 Context-Aware Localization (AR/EN)**:
  - Strict separation between user-facing text (localized via `context.l10n.<key>`) and infrastructure/developer strings (plain English literals).
  - Arabic (RTL) & English (LTR) ready with `AppLocalizations` and context extensions.
* **⚡ High-Performance Engineering & Strict ThemeData**:
  - `const` constructors enforced on all States, Entities, Widgets, and layout tokens to maximize Flutter element reuse.
  - Granular rebuild scopes with `BlocSelector` / `BlocBuilder`.
  - Mandatory controller disposal (`TextEditingController`, `ScrollController`) in `dispose()`.
  - Strict Material 3 `ThemeData` enforcing `CardThemeData` (`cardTheme: const CardThemeData(...)`).
  - Strict `analysis_options.yaml` enforcing zero lint compromises.
* **📱 Platform-Adaptive UI**: Native **Material 3** for Android/Desktop/Web & Native **Cupertino (HIG)** for iOS/macOS.
* **🖥️ Multi-Device Responsiveness**: Automatic layout adaptation for **Phones** (< 600dp), **Tablets** (600dp - 1024dp with Navigation Rail), and **Desktop / Large Screens** (> 1024dp with Sidebar).
* **🎨 UI/UX Pro Max Design Intelligence**: 7 pre-built psychological design palettes (Fintech, E-Commerce, Healthcare, Food Delivery, SaaS, Fitness, EdTech).

---

## 🏛️ Configurable Architecture Profiles

Rather than locking your team into a single dogmatic stack, **Flutter Enterprise Pro Max** introduces a configurable Architecture Decision System with 4 pre-configured enterprise profiles and a custom configuration engine:

| Profile | Architecture Style | State Management | DI Engine | Routing | Networking & Result | Persistence |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **1. Enterprise Clean (Default)** | Feature-First Clean (3-Layer) | Cubit + States | Injectable + GetIt | Centralized AppRouter | Retrofit + Dio + ResultFuture | SecureStorage + SharedPreferences |
| **2. Riverpod Enterprise** | Feature-First Clean | Riverpod (AsyncNotifier) | Riverpod Providers | GoRouter | Dio + Sealed Result | SecureStorage + SharedPreferences |
| **3. Offline-First Enterprise** | Clean Architecture | Cubit + States | Injectable + GetIt | Centralized AppRouter | Dio + Sync Queue Engine | Drift (SQLite) + SQLCipher |
| **4. Minimal Starter** | Simplified Feature | Cubit + States | Manual Factory | Centralized AppRouter | Dio + Sealed Result | SecureStorage + SharedPreferences |
| **5. Custom Profile** | Configured via `enterprise_flutter.yaml` or step-by-step interactive CLI wizard |

---

### 1️⃣ Profile 1: Enterprise Clean Architecture (Default Recommended)
Designed for enterprise, banking, fintech, healthcare, and mission-critical applications:
* **Architecture Style**: Feature-First 3-Layer Clean Architecture (`domain`, `data`, `presentation`).
* **State Management**: **Cubit + Freezed/Sealed States** with value equality and single-responsibility UseCase injection.
* **Dependency Injection**: **GetIt + Injectable** with `@singleton`, `@LazySingleton(as: Interface)`, and `@injectable`.
* **Networking & Error**: **Retrofit + Dio** with thread-safe `AuthInterceptor` 401 refresh mutex and `typedef ResultFuture<T> = Future<Either<Failure, T>>`.
* **Navigation & Routing**: **Centralized AppRouter** (`PageRouteBuilder` with 400ms fade transition).
* **Persistence**: Hardware-encrypted **FlutterSecureStorage** + **SharedPreferences**.
* **Flavors**: Mandatory `DevConfig`, `StagingConfig` (dotenv), and `ProductionConfig` (`--dart-define`).
* **Localization**: Context-Aware AR/EN with zero hardcoded user-facing UI strings.

---

### 2️⃣ Profile 2: Riverpod Enterprise Architecture
Designed for modern reactive applications, SaaS dashboards, and multiplatform web/desktop targets:
* **Architecture Style**: Feature-First Clean Architecture.
* **State Management**: **Riverpod 2.x (`AsyncNotifier` / `Notifier`)** with `AsyncValue` lifecycle handling.
* **Dependency Injection**: Compile-time safe **Riverpod Providers** with test override capabilities (`ProviderContainer`).
* **Navigation & Routing**: **GoRouter** with deep linking, route guards, `ShellRoute`, and web URL synchronization.
* **Networking & Error**: **Dio** with interceptors and Dart 3 Sealed `Result<T, Failure>`.

---

### 3️⃣ Profile 3: Offline-First Enterprise Architecture
Designed for logistics, field operations, POS, and healthcare apps requiring 100% offline functionality:
* **Architecture Style**: Clean Architecture with Local Database & Asynchronous Sync Engine.
* **Local Database**: **Drift (SQLite ORM)** with SQLCipher hardware encryption support.
* **Offline Sync Engine**:
  - Offline mutation queue stored in SQLite.
  - Idempotent background retries (`X-Idempotency-Key`).
  - Automatic connectivity listener (`ConnectivityService`).
  - Conflict resolution strategies (Client-Wins, Server-Wins, Timestamp-Based).

---

### 4️⃣ Profile 4: Minimal Starter Architecture
Designed for MVPs, rapid prototyping, and lightweight utilities:
* **Architecture Style**: Simplified Feature-First Architecture.
* **State Management**: **Cubit + States**.
* **Dependency Injection**: Manual Factory Injection (Zero code generation).
* **Networking**: Direct **Dio** client with Sealed `Result<T, Failure>`.

---

### 5️⃣ Profile 5: Custom Architecture Wizard
Configure any dimension interactively via `dart bin/init.dart` or declaratively via `enterprise_flutter.yaml`:
* Mix and match State Management (Cubit, Riverpod, Provider, Signals), DI (Injectable, Riverpod, Manual), Routing (AppRouter, GoRouter), and Persistence (SecureStorage, Drift, Isar, Hive).


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
Data Layer Repository Implementation (Maps DioException / ApiErrorModel -> Domain Failure)
          ↓
Domain Contract / UseCase returns:
typedef ResultFuture<T> = Future<Either<Failure, T>>;
(or Result<T, Failure>)
          ↓
Presentation Layer (Cubit maps Failure -> Localized UI string via context.l10n)
```

### Pure Domain Failure Hierarchy (`core/errors/failure.dart`):
```dart
sealed class Failure {
  final String message;
  final String? code;
  const Failure({required this.message, this.code});
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({required super.message, super.code, this.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message, super.code});
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.code});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}
```

---

## 🌍 Context-Aware Localization Standard

To avoid excessive or nonsensical abstractions, the skill strictly distinguishes between user-facing text and developer/system text:

| Category | Localization Required? | Examples |
| :--- | :---: | :--- |
| **User-Facing UI Strings** | ✅ **YES (`context.l10n.<key>`)** | `Text(context.l10n.submit)`, Dialog titles & bodies, Form validation errors, SnackBar alerts |
| **Internal Logging** | ❌ **NO (English literal)** | `debugPrint('Auth token refreshed')`, `logger.e('...')`, `AppBlocObserver` |
| **Telemetry & Analytics** | ❌ **NO (English literal)** | `analytics.logEvent(name: 'checkout_step_1', parameters: {'plan': 'pro'})` |
| **Developer Asserts & System Errors** | ❌ **NO (English literal)** | `assert(token.isNotEmpty, 'Token required')`, `ArgumentError('...')` |
| **Data Layer Exception Codes** | ❌ **NO (English literal)** | `ServerException(code: 'HTTP_504_TIMEOUT')` |

---

## ⚡ Feature Generator Engine (`add feature <name>`)

When you ask the AI Agent to `add feature <name>` or run `dart bin/generate.dart <name>`:

1. **Intake Flow**:
   - Asks for user stories, requirements, or API documentation.
   - Asks for UI mockups or Figma links.
   - Confirms the project's architecture profile.
2. **Generates 3 Layers adhering to SOLID & High Performance**:
   - `domain/`: Pure Entities (`Equatable`), abstract Repositories returning `ResultFuture<T>`, discrete UseCases.
   - `data/`: Remote Data Sources, `@JsonSerializable` Models + Mappers, Repository Implementations.
   - `presentation/`: Cubit/Notifier, Screen (`ResponsiveLayout`), cohesive sub-widgets.
3. **Generates Full 3-Tier Tests**:
   - **Unit Tests**: `test/features/<feature>/domain/...` & `test/features/<feature>/presentation/...`
   - **Widget Tests**: `test/features/<feature>/presentation/widgets/...`
   - **Integration E2E Tests**: `integration_test/<feature>_flow_test.dart`

---

## 🧪 3-Tier Testing Pyramid & Standard

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:your_app/core/errors/failure.dart';
import 'package:your_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:your_app/features/auth/presentation/logic/cubits/auth_state.dart';
import 'package:your_app/features/auth/presentation/logic/cubits/login_cubit.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginCubit loginCubit;

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  const tToken = 'sample_jwt_token_123';

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginCubit = LoginCubit(mockLoginUseCase);
  });

  tearDown(() {
    loginCubit.close();
  });

  test('initial state should be AuthState.initial', () {
    expect(loginCubit.state, equals(const AuthState.initial()));
  });

  group('login', () {
    blocTest<LoginCubit, AuthState>(
      'should emit [AuthState.loading, AuthState.success] when login succeeds',
      build: () => LoginCubit(mockLoginUseCase),
      setUp: () {
        when(() => mockLoginUseCase(email: tEmail, password: tPassword))
            .thenAnswer((_) async => const Right(tToken));
      },
      act: (cubit) => cubit.login(email: tEmail, password: tPassword),
      expect: () => [
        const AuthState.loading(),
        const AuthState.success(tToken),
      ],
      verify: (_) {
        verify(() => mockLoginUseCase(email: tEmail, password: tPassword)).called(1);
      },
    );

    blocTest<LoginCubit, AuthState>(
      'should emit [AuthState.loading, AuthState.failure] when login fails',
      build: () => LoginCubit(mockLoginUseCase),
      setUp: () {
        when(() => mockLoginUseCase(email: tEmail, password: tPassword))
            .thenAnswer((_) async => const Left(ServerFailure(message: 'Login failed')));
      },
      act: (cubit) => cubit.login(email: tEmail, password: tPassword),
      expect: () => [
        const AuthState.loading(),
        const AuthState.failure('Login failed'),
      ],
      verify: (_) {
        verify(() => mockLoginUseCase(email: tEmail, password: tPassword)).called(1);
      },
    );
  });
}
```

---

## 🤖 Universal Installation Matrix

Install this skill once, and use it across any AI Assistant, Terminal, or IDE.

---

### 1️⃣ Google Antigravity / Gemini CLI

#### 🔹 Option A: Using Windows PowerShell
```powershell
if (!(Test-Path "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max")) { 
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max" | Out-Null 
}
Copy-Item "SKILL.md" "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md" -Force
```

#### 🔹 Option B: Using Windows Command Prompt (CMD)
```cmd
if not exist "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max" mkdir "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max"
copy "SKILL.md" "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md"
```

#### 🔹 Option C: Using macOS / Linux
```bash
mkdir -p ~/.gemini/antigravity/skills/flutter-enterprise-pro-max
cp SKILL.md ~/.gemini/antigravity/skills/flutter-enterprise-pro-max/SKILL.md
```

#### 💡 How to Use in Antigravity:
Simply type in your chat:
> `"init project"` or `"add feature auth"`

---

### 2️⃣ Cursor IDE

#### 🔹 In PowerShell (Windows):
```powershell
Copy-Item "rules\.cursorrules" ".cursorrules" -Force
```

#### 🔹 In CMD (Windows):
```cmd
copy "rules\.cursorrules" ".cursorrules"
```

#### 🔹 In macOS / Linux:
```bash
cp rules/.cursorrules .cursorrules
```

#### 💡 How to Use in Cursor:
Open **Composer** (`Ctrl+I` / `Cmd+I`) or **Chat** (`Ctrl+L` / `Cmd+L`) and type:
> `"Read .cursorrules and initialize a new Flutter project named smart_wallet for Fintech."`

---

### 3️⃣ Claude Code

#### 🔹 In PowerShell (Windows):
```powershell
Copy-Item "rules\CLAUDE.md" "CLAUDE.md" -Force
```

#### 🔹 In CMD (Windows):
```cmd
copy "rules\CLAUDE.md" "CLAUDE.md"
```

#### 🔹 In macOS / Linux:
```bash
cp rules/CLAUDE.md CLAUDE.md
```

#### 💡 How to Use in Claude Code:
Run in your terminal:
```bash
claude "Read CLAUDE.md and scaffold a Clean Architecture Flutter project named mega_store."
```

---

### 4️⃣ Windsurf / Cascade

#### 🔹 In PowerShell (Windows):
```powershell
Copy-Item "rules\.windsurfrules" ".windsurfrules" -Force
```

#### 🔹 In CMD (Windows):
```cmd
copy "rules\.windsurfrules" ".windsurfrules"
```

#### 🔹 In macOS / Linux:
```bash
cp rules/.windsurfrules .windsurfrules
```

#### 💡 How to Use in Windsurf:
In the **Cascade** chat panel, type:
> `"Follow .windsurfrules and build a responsive authentication screen."`

---

### 5️⃣ GitHub Copilot

#### 🔹 In PowerShell (Windows):
```powershell
if (!(Test-Path ".github")) { New-Item -ItemType Directory -Force -Path ".github" | Out-Null }
Copy-Item "rules\copilot-instructions.md" ".github\copilot-instructions.md" -Force
```

#### 🔹 In CMD (Windows):
```cmd
if not exist ".github" mkdir ".github"
copy "rules\copilot-instructions.md" ".github\copilot-instructions.md"
```

#### 🔹 In macOS / Linux:
```bash
mkdir -p .github
cp rules/copilot-instructions.md .github/copilot-instructions.md
```

---

### 6️⃣ Standalone Terminal CLI (No AI Required)

You can run the built-in interactive wizard directly from your terminal:

#### 🔹 Cross-Platform (Dart):
```bash
dart run bin/init.dart
```

#### 🔹 Windows PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File .\bin\init.ps1
```

---

## 🎨 UI/UX Pro Max: Category Design Tokens

The generator embeds custom psychological color harmonies, typography pairings, and layout structures according to the chosen category:

| Category | Visual Archetype | Primary / Accent Colors | Font Pairing | Key Components |
| :--- | :--- | :--- | :--- | :--- |
| 💳 **Fintech & Banking** | High-Trust / Dark Sleek | Deep Navy (`#0F172A`) + Emerald (`#10B981`) | Plus Jakarta Sans | Balance Card, Biometrics, Interactive Charts |
| 🛍️ **E-Commerce & Retail** | High-Conversion Bento Grid | Clean White (`#FFFFFF`) + Coral (`#FF5722`) | Poppins / Outfit | Product Cards, Floating Buy Bar, Skeleton Loading |
| 🏥 **Healthcare & Medical** | Calm Clinical / Soft Borders | Soft Teal (`#0D9488`) + Mint (`#14B8A6`) | DM Sans | High-contrast data, Appointment Cards |
| 🍔 **Food Delivery** | Vibrant High-Energy | Warm Crimson (`#DC2626`) + Amber (`#F59E0B`) | Outfit | Order Tracker Timeline, Floating Location Bar |
| 📊 **SaaS & Productivity** | Bento Grid High-Density | Jet Black (`#09090B`) + Violet (`#6366F1`) | Inter | High-Density Tables, Sidebar Navigation |
| 🏋️ **Fitness & Wellness** | High-Energy Dark / Neon | Pitch Dark (`#0A0A0A`) + Lime (`#84CC16`) | Plus Jakarta Sans | Progress Rings, Bold Stats Cards |
| 🎓 **EdTech & Learning** | Gamified & Friendly | Soft Indigo (`#4F46E5`) + Gold (`#FBBF24`) | Nunito | Lesson Progress, Gamification Badges |

---

## 📱 Platform-Adaptive & Responsive Architecture

### 1. Platform-Adaptive Core
* **iOS & macOS**: Automatic fallback to native Cupertino widgets (`CupertinoButton`, `CupertinoTextField`, `CupertinoActivityIndicator`, `cupertino_icons`).
* **Android & Desktop & Web**: Automatic fallback to Material 3 widgets (`ElevatedButton`, `FilledButton`, `TextField`, Material icons).

### 2. Multi-Device Screen Breakpoints
```dart
ResponsiveLayout(
  mobile: MobilePhoneLayout(),    // < 600dp (Bottom Navigation Bar)
  tablet: TabletRailLayout(),     // 600dp - 1024dp (Navigation Rail & 2-Col Grid)
  desktop: DesktopSidebarLayout(), // > 1024dp (Full Sidebar & Master-Detail)
)
```

---

## 📁 Project Directory Layout

```
lib/
├── core/                                # Shared infrastructure
│   ├── bloc_observer.dart               # Global Bloc logging and error tracking
│   ├── config/                          # Environment & Flavors Configuration
│   │   ├── app_config.dart              # Central AppConfig facade (@singleton)
│   │   ├── app_flavor.dart              # AppFlavor enum (dev, staging, production)
│   │   ├── env_config.dart              # Abstract EnvConfig contract
│   │   ├── env_config_factory.dart      # Flavor factory
│   │   ├── dev_config.dart              # DevConfig reading from .env.dev via dotenv
│   │   ├── staging_config.dart          # StagingConfig reading from .env.staging via dotenv
│   │   ├── production_config.dart       # ProductionConfig reading from --dart-define
│   │   ├── service_locator.dart         # GetIt + Injectable initialization
│   │   └── service_locator.config.dart  # Generated by injectable_generator
│   │
│   ├── errors/                          # Pure Domain Failures & Exceptions
│   │   ├── failure.dart                 # Sealed Failure hierarchy (ServerFailure, NetworkFailure, etc.)
│   │   └── exceptions.dart              # Data-layer exceptions (ServerException, CacheException)
│   │
│   ├── extension/                       # Extensions (context, l10n, string)
│   │   └── context_extension.dart
│   │
│   ├── network/                         # Enterprise Network Layer
│   │   ├── typedef.dart                 # typedef ResultFuture<T> = Future<Either<Failure, T>>;
│   │   ├── result.dart                  # Sealed Result<T, E> & Either definitions
│   │   ├── api_error_handler.dart       # Maps DioException -> ServerFailure
│   │   ├── api_error_model.dart         # @JsonSerializable error DTO (Data layer only)
│   │   ├── auth_interceptor.dart        # 401 refresh lock mutex, token injection & retry
│   │   └── dio_client.dart              # Configured Dio factory with PrettyDioLogger
│   │
│   ├── routes/                          # Centralized Navigation & Routing Subsystem
│   │   ├── routes.dart                  # Static route name constants
│   │   └── app_router.dart              # AppRouter with 400ms fade PageRouteBuilder
│   │
│   ├── services/                        # Service wrappers
│   │   ├── register_module.dart         # Injectable @module (Dio, SecureStorage, SharedPreferences)
│   │   ├── token_storage.dart           # Hardware-encrypted secure storage
│   │   └── connectivity_service.dart    # Connectivity listener via connectivity_plus
│   │
│   ├── theme/                           # Light/Dark Theme & Design Tokens
│   │   ├── app_colors.dart
│   │   └── theme_manager.dart           # Strict CardThemeData enforcement
│   │
│   ├── utils/                           # Validators & utilities
│   │   └── validators.dart              # Composable Form Validators
│   │
│   └── widgets/                         # Core Reusable UI Component Atoms
│       ├── app_button.dart              # Responsive button with loading spinner
│       ├── app_text_field.dart          # Localized text field with focus borders
│       ├── app_shimmer.dart             # Skeleton loading wrapper
│       ├── app_empty_state.dart         # Empty list illustration & action button
│       ├── app_error_widget.dart        # Error state view with retry callback
│       ├── privacy_screen_overlay.dart  # App Switcher screenshot protection
│       └── pagination_scroll_listener.dart # Reusable 80% scroll listener
│
├── features/                            # Feature-First Modules
│   └── feature_name/
│       ├── domain/                      # DOMAIN LAYER (Pure Business Logic)
│       │   ├── entities/                # Pure Dart Business Entities (Equatable)
│       │   ├── repos/                   # Abstract Repository contracts (*_repository.dart)
│       │   └── usecases/                # Business UseCases (@lazySingleton)
│       │
│       ├── data/                        # DATA LAYER
│       │   ├── data_sources/            # Retrofit Remote DataSources (*_data_source.dart)
│       │   ├── models/                  # @JsonSerializable + copyWith + Mappers
│       │   └── repos/                   # Concrete Repository Implementations (@LazySingleton)
│       │
│       └── presentation/                # PRESENTATION LAYER
│           ├── logic/                   # Cubit ONLY + Freezed States
│           ├── screens/                 # Screen Widget Classes (ResponsiveLayout)
│           └── widgets/                 # Sub-widgets (Strictly 1 class per file)
│
├── l10n/                                # LOCALIZATION
│   ├── intl_en.arb                      # English
│   └── intl_ar.arb                      # Arabic (RTL)
│
├── main.dart                            # Shared bootstrap entrypoint
├── main_dev.dart                        # Dev Flavor Entrypoint
├── main_staging.dart                    # Staging Flavor Entrypoint
├── main_production.dart                 # Production Flavor Entrypoint
├── enterprise_flutter.yaml              # Project Architecture Profile
└── analysis_options.yaml                # Strict Enterprise Linter Rules
```

---

## ⚡ Interactive Prompts & Usage Examples

### 1. Initialize a Project
Ask your AI Agent:
> `"init project"`

The wizard will guide you through:
1. 📝 Project Name & Org Domain.
2. 📱 Target Platforms (Mobile, Web, Desktop, All).
3. 🖥️ Device Types (Phones, Tablets, Desktops).
4. 🏛️ Architecture Profile (Clean Arch, Riverpod, Offline-First, Minimal, Custom).
5. 🎨 UI/UX Pro Max Category (Fintech, E-Commerce, Healthcare, SaaS, etc.).

### 2. Scaffold a New Feature with Tests & UI
Ask your AI Agent:
> `"add feature auth"`

The generator will:
1. 📄 Intake user stories, requirements, or API contracts.
2. 🎨 Intake Figma links or image mockups.
3. 🏛️ Scaffold Domain, Data, and Presentation layers under strict SOLID & performance principles.
4. 🧪 Generate Unit Tests (`bloc_test` + `mocktail`), Widget Tests, and Integration E2E Tests.

---

## 🛠️ CLI Tools & Commands

```bash
# 1. Initialize a new configurable enterprise project
dart bin/init.dart

# Or via PowerShell on Windows
.\bin\init.ps1

# 2. Generate a new Clean Architecture feature with tests
dart bin/generate.dart auth

# 3. Run automated repository validation
dart bin/validate.dart
```

---

## ⚡ Quickstart Commands

```bash
# 1. Install dependencies
flutter pub get

# 2. Run Code Generation (Injectable, Freezed, Retrofit, JsonSerializable)
dart run build_runner build --delete-conflicting-outputs

# 3. Run Automated Tests
flutter test

# 4. Run Specific Flavor
flutter run -t lib/main_dev.dart --flavor dev
```

---

## 🔍 Automated Repository Validation

To verify that all templates, schema definitions, profiles, rules, and CLI tools are 100% consistent:

```bash
dart bin/validate.dart
```

Output:
```text
============================================================
🔍 Flutter Enterprise Pro Max — Repository Validator
============================================================
  ✅ [PASS] SKILL.md exists
  ✅ [PASS] README.md exists
  ✅ [PASS] Schema exists
  ✅ [PASS] Architecture Guides exist
  ✅ [PASS] Pre-configured Profiles exist
  ✅ [PASS] Multi-IDE Rule Files exist
  ✅ [PASS] Core Templates exist
  ✅ [PASS] CLI Tools exist
============================================================
📊 Total Checks: 38 | Passed: 38 | Failed: 0
🎉 ALL CHECKS PASSED! Repository is 100% consistent.
```

---

## ❓ Troubleshooting & FAQ

#### Q1: Error `'Copy-Item' is not recognized as an internal or external command`?
* **Fix**: Run inside Windows PowerShell, or use CMD command syntax:
  ```cmd
  if not exist "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max" mkdir "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max"
  copy "SKILL.md" "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md"
  ```

#### Q2: Error `File init.ps1 cannot be loaded because running scripts is disabled`?
* **Fix**: Run PowerShell with the ExecutionPolicy bypass flag:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .\bin\init.ps1
  ```

#### Q3: How do I run code generation for Injectable & Freezed?
* **Fix**: Run:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  ```

#### Q4: How does Error Handling isolate the Domain Layer?
* **Answer**: The Domain Layer never imports Dio or `ApiErrorModel`. It only uses pure `Failure` classes (`ServerFailure`, `NetworkFailure`). The Data Layer Repository implementation is responsible for catching `DioException` and mapping `ApiErrorModel` into a `Failure` instance before returning `ResultFuture<T> = Future<Either<Failure, T>>`.

#### Q5: When should I localize strings?
* **Answer**: Only user-facing UI strings (`Text(...)`, dialogs, SnackBar messages, form validation) are localized via `context.l10n.<key>`. Internal logging (`debugPrint`), telemetry event names, developer asserts, and exception codes remain in plain English string literals.

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
