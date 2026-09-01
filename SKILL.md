---
name: flutter-enterprise-pro-max
description: Universal enterprise Flutter architect, system designer, and UI/UX intelligence skill. Use when creating new Flutter projects ("init project", "create flutter app", "scaffold clean architecture"), creating features ("add feature <name>"), setting up 3-layer Clean Architecture (domain, data, presentation), configuring state management (Cubit/Bloc, Riverpod, Provider, Signals), Injectable + GetIt or Riverpod DI, sealed Result or dartz Either error handling with pure Domain Failures, routing (AppRouter or GoRouter), Mandatory Flavors (.vscode/launch.json, DevConfig, StagingConfig, ProductionConfig with --dart-define), Hardware Security, Privacy Screen, Core Design Atoms, Context-Aware AR/EN Localization, Device responsiveness, or crafting high-end UI/UX designs.
---

# 🚀 Flutter Enterprise Pro Max — AI Agent Skill

This skill turns any AI Agent into a **Principal Flutter Architect, Enterprise Software Architect & UI/UX Specialist (10+ years experience)**. It enforces a configurable, production-grade **Flutter Enterprise Engineering System**.

---

## 0. ⚖️ Rule Priority Hierarchy

When architectural rules or trade-offs conflict, the AI Agent MUST strictly adhere to this priority order:

```
P0 — Security & Correctness   (Hardware secure storage, domain isolation, zero memory leaks)
        ↓
P1 — Architecture & SOLID     (Clean layer separation, single-responsibility UseCases, DI inversion)
        ↓
P2 — Maintainability & Tests  (3-tier testing pyramid: Unit, Widget, E2E; Context-Aware Localization)
        ↓
P3 — Performance              (Bounded rebuild scopes, list virtualization, isolate offloading)
        ↓
P4 — Style & Convention       (Widget classes in separate files, strict CardThemeData, snake_case)
```

> **Rule Override**: Project-specific configuration in `enterprise_flutter.yaml` overrides generic defaults.

---

## 1. 🎯 When to Activate This Skill

- When user asks to:
  - `"init project"`, `"create flutter app"`, `"scaffold new project"`
  - `"add feature <name>"`, `"generate feature <name>"`, `"scaffold clean architecture feature"`
  - `"document feature <name>"`, `"generate PRD for <name>"`, `"اعملى documentation <name>"`
  - `"setup flavors"`, `"configure injectable"`, `"setup routes"`, `"setup localization"`, `"setup offline sync"`
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

## 3. 📁 Standard Project Directory Tree (Profile 1 Default)

```
lib/
├── core/
│   ├── bloc_observer.dart          # Global Bloc logging and error tracking
│   ├── config/                     # Environment & Flavors Configuration
│   │   ├── app_config.dart         # Central AppConfig facade (@singleton)
│   │   ├── app_flavor.dart         # AppFlavor enum (dev, staging, production)
│   │   ├── env_config.dart         # Abstract EnvConfig contract
│   │   ├── env_config_factory.dart # Flavor factory
│   │   ├── dev_config.dart         # DevConfig reading from .env.dev via dotenv
│   │   ├── staging_config.dart     # StagingConfig reading from .env.staging via dotenv
│   │   ├── production_config.dart  # ProductionConfig reading from --dart-define
│   │   ├── service_locator.dart    # GetIt + Injectable initialization
│   │   └── service_locator.config.dart # Generated by injectable_generator
│   │
│   ├── errors/                     # Pure Domain Failure abstractions (Zero Dio dependencies)
│   │   ├── failure.dart            # Sealed Failure hierarchy (ServerFailure, NetworkFailure, etc.)
│   │   └── exceptions.dart         # Data-layer exceptions (ServerException, CacheException)
│   │
│   ├── extension/                  # Context, String, Number, DateTime extensions
│   │   └── context_extension.dart  # theme, l10n, mediaQuery shortcuts
│   │
│   ├── network/                    # Enterprise Network Layer (Dio + Retrofit + Result)
│   │   ├── typedef.dart            # typedef ResultFuture<T> = Future<Either<Failure, T>>;
│   │   ├── result.dart             # Sealed Result<T, E> & Either definitions
│   │   ├── api_error_handler.dart  # Maps DioException -> ServerFailure
│   │   ├── api_error_model.dart    # @JsonSerializable error DTO (Data layer only)
│   │   ├── auth_interceptor.dart   # Token injection, 401 refresh mutex & retry
│   │   └── dio_client.dart         # Configured Dio factory with PrettyDioLogger
│   │
│   ├── routes/                     # Centralized Navigation & Routing Subsystem
│   │   ├── routes.dart             # Static route name constants (Routes.splash, Routes.login)
│   │   └── app_router.dart         # AppRouter with PageRouteBuilder fade transitions
│   │
│   ├── services/                   # Low-level & 3rd party service wrappers
│   │   ├── register_module.dart    # Injectable @module (Dio, SecureStorage, SharedPreferences)
│   │   ├── token_storage.dart      # Hardware-encrypted access/refresh token storage
│   │   └── connectivity_service.dart # Connectivity listener via connectivity_plus
│   │
│   ├── theme/                      # Light/Dark Theme & Color tokens
│   │   ├── app_colors.dart
│   │   └── theme_manager.dart      # Material 3 ThemeData with strict CardThemeData
│   │
│   ├── utils/                      # Validators & helper utilities
│   │   └── validators.dart         # Localized Form validation rules
│   │
│   └── widgets/                    # Core Design System Atoms
│       ├── app_button.dart         # Responsive button with built-in loading spinner
│       ├── app_text_field.dart     # Localized text field with focus borders & obscure toggle
│       ├── app_shimmer.dart        # Skeleton loading card wrapper
│       ├── app_empty_state.dart    # Empty list illustration & action button
│       ├── app_error_widget.dart   # Error state view with retry callback
│       ├── privacy_screen_overlay.dart # App Switcher screenshot protection
│       └── pagination_scroll_listener.dart # Reusable 80% scroll listener
│
├── features/                       # Feature-First 3-Layer Clean Architecture Modules
│   └── <feature_name>/
│       ├── domain/                 # Layer 1: Pure Dart Business Logic (Zero UI)
│       │   ├── entities/           # Pure data models extending Equatable
│       │   ├── repos/              # Abstract Repository contracts returning ResultFuture<T>
│       │   └── usecases/           # Single-responsibility UseCase classes (@lazySingleton)
│       │
│       ├── data/                   # Layer 2: Data Retrieval, Serialization & Mapping
│       │   ├── data_sources/       # Retrofit RestApi interfaces (@RestApi)
│       │   ├── models/             # @JsonSerializable models with manual copyWith & Mappers
│       │   └── repos/              # Concrete Repository implementations (@LazySingleton(as: *Repo))
│       │
│       └── presentation/           # Layer 3: Reactive State & Adaptive UI
│           ├── logic/
│           │   └── cubits/         # Cubit ONLY with Freezed States (*_cubit.dart, *_state.dart)
│           ├── screens/            # Screen Widget Classes (ResponsiveLayout)
│           └── widgets/            # Sub-widget Classes (Strictly ONE widget class per file)
│
├── l10n/                           # Mandatory Localization files
│   ├── intl_en.arb                 # English (LTR)
│   └── intl_ar.arb                 # Arabic (RTL)
│
├── .vscode/
│   └── launch.json                 # Launch configurations for Dev, Staging, Production flavors
│
├── .env.dev                        # Local development variables (in .gitignore)
├── .env.staging                    # Staging variables (in .gitignore)
├── .env.example                    # Template file for environment variables
├── .gitignore                      # Configured to ignore all .env files
├── l10n.yaml                       # Flutter l10n generator config
├── pubspec.yaml
├── analysis_options.yaml           # Strict enterprise linter rules
├── enterprise_flutter.yaml         # Project Architecture Profile
└── main.dart                       # Shared bootstrap and app widget
```

---

## 4. 🛡️ Domain Error Isolation & Result Pipeline

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

## 5. ⚡ Feature Generator Engine (`add feature <name>`)

Whenever the user asks to add or generate a feature:

1. **Intake Flow**:
   - Ask for feature requirements/documentation and API specifications.
   - Ask if they have a Figma URL or image mockups.
   - Confirm the project's architecture profile.
2. **Scaffold 3 Layers**:
   - `domain/`: Pure Entities (`Equatable`), abstract Repositories returning `ResultFuture<T>`, discrete UseCases.
   - `data/`: DataSources, `@JsonSerializable` Models + `copyWith` + `toEntity()`, Repository Implementations.
   - `presentation/`: Cubit/Notifier, Screen (`ResponsiveLayout`), cohesive sub-widgets.
3. **Generate 3-Tier Testing Suite**:
   - **Unit Tests**: Domain UseCases & Cubits (`test/features/<feature>/...`) using `mocktail` & `bloc_test`.
   - **Widget Tests**: Component and screen rendering tests (`test/features/<feature>/presentation/...`).
   - **Integration E2E Tests**: Full user flow tests (`integration_test/<feature>_flow_test.dart`).

## 6. 📑 Senior Product Manager (10+ Yrs) Feature Documentation & PDF Engine

Whenever the user asks to `"document feature <name>"`, `"generate PRD for <name>"`, or `"اعملى documentation <name>"`:

The AI Agent acts as a **10-Year Senior Product Manager + Principal Software Architect**, generating an executive Product Requirements Document (PRD) & Technical Architecture Blueprint following the project's exact scheme:

1. **Executive Summary & Business KPIs**: Problem statement, target personas, conversion and TTI benchmarks.
2. **Gherkin User Stories**: Given / When / Then acceptance criteria covering happy path and failure/offline scenarios.
3. **3-Layer Code Architecture Walkthrough**: Domain (Entities, UseCases, Repos), Data (DataSources, Models, Mappers, Repos), Presentation (Cubits, Freezed States, Atoms).
4. **API Contracts & Schema**: Endpoint URLs, Headers (`AuthInterceptor`, `X-Idempotency-Key`), JSON Request & Response contracts.
5. **Domain Failure Mapping Table**: Mapping HTTP status codes & network exceptions to pure domain `Failure`s and `context.l10n` strings.
6. **Non-Functional Requirements**: Hardware secure storage, privacy screen overlay, 60/120fps rendering, zero memory leaks.
7. **3-Tier Testing Matrix**: Unit, Widget, and E2E integration test breakdown.

### Storage & Automatic PDF Generation:
* **Markdown PRD**: Saved in `lib/features/<feature_name>/docs/<feature_name>_prd_and_architecture.md`.
* **Printable HTML**: Saved in `lib/features/<feature_name>/docs/<feature_name>_prd_and_architecture.html`.
* **PDF Blueprint**: Exported to `lib/features/<feature_name>/docs/<feature_name>_prd_and_architecture.pdf` via `dart bin/doc.dart <feature_name>`.

---

## 7. 🧪 Comprehensive Unit Testing Standard


```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_app/core/network/result.dart';
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
            .thenAnswer((_) async => const Success(tToken));
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
            .thenAnswer((_) async => const Error(ServerFailure(message: 'Login failed')));
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

## 8. 🔒 Hardware-Level Security & Privacy Protection

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

## 9. 🌍 Context-Aware Localization Standard

To avoid excessive or nonsensical abstractions, the AI Agent MUST distinguish between user-facing text and developer/system text:

### 1. User-Facing UI Strings (MUST Be Localized):
- Any text displayed to end users in the UI **MUST NOT** be hardcoded. Always use `context.l10n.<key>`.
- Examples:
  - `Text(context.l10n.loginTitle)`
  - Form validation messages shown in UI (`context.l10n.invalidEmailError`)
  - User-facing dialog titles, body text, and buttons (`context.l10n.retry`, `context.l10n.confirm`)
  - SnackBar / Toast user notifications

### 2. Infrastructure & Developer Strings (DO NOT Localize):
- **Internal Logs & Diagnostics**: `debugPrint('Auth token refreshed')`, `logger.d('...')`, `AppBlocObserver`.
- **Telemetry & Analytics Events**: `analytics.logEvent(name: 'user_signed_up', parameters: {'plan': 'free'})`.
- **Developer Asserts & System Errors**: `assert(id.isNotEmpty, 'ID must not be empty')`, `ArgumentError('...')`.
- **Data Layer Exception Codes**: `ServerException(code: 'HTTP_504_TIMEOUT')`.

---

## 10. 🎨 UI/UX Pro Max & Strict Theme Standards

> [!IMPORTANT]
> **Strict Material 3 ThemeData Rule**:
> - **ALWAYS USE `CardThemeData`** for `cardTheme`:
>   ```dart
>   cardTheme: const CardThemeData(
>     color: AppColors.lightSurface,
>     elevation: 0,
>     shape: RoundedRectangleBorder(
>       borderRadius: BorderRadius.all(Radius.circular(16)),
>       side: BorderSide(color: AppColors.lightBorder, width: 1),
>     ),
>     margin: EdgeInsets.zero,
>   ),
>   ```
> - Always use component data classes: `appBarTheme: const AppBarTheme(...)`, `elevatedButtonTheme: ElevatedButtonThemeData(...)`, `inputDecorationTheme: InputDecorationTheme(...)`.

---

## 11. 🧙‍♂️ Interactive Initializer Questionnaire (MANDATORY)


Whenever the user asks to `"init project"` or initialize an app, the Agent **MUST STOP AND PRESENT** the questionnaire:

1. **📝 Project Name & Org Domain**: (e.g. `smart_clinic`, `com.company`).
2. **📱 Target Platforms & Form Factors**:
   - Platforms: Mobile (Android/iOS), Web, Desktop (Windows/macOS/Linux).
   - Form Factors: Phones, Tablets, Desktop.
3. **🏛️ Architecture Profile**:
   - 1) 🌟 Enterprise Clean Architecture (Feature-First + Cubit + Injectable + Centralized Routes) [Default]
   - 2) ⚡ Riverpod Enterprise (Feature-First + AsyncNotifier + GoRouter)
   - 3) 🔄 Offline-First Enterprise (Clean Arch + Drift DB + Sync Queue)
   - 4) 📦 Minimal Starter
   - 5) 🛠️ Custom Architecture
4. **🎨 UI/UX Pro Max Category [1-8]**:
   - 💳 Fintech, 🛍️ E-Commerce, 🏥 Healthcare, 🍔 Food, 📊 SaaS, 🏋️ Fitness, 🎓 EdTech, ⚙️ Minimal.

---

### ⚡ Post-Scaffolding Automated Execution (MANDATORY)

Immediately after creating all files and folders, the AI Agent **MUST AUTOMATICALLY EXECUTE**:
1. `flutter pub get`
2. `dart run build_runner build --delete-conflicting-outputs` (if code generation is configured)
3. `flutter analyze` (ensuring 0 errors / 0 warnings)
