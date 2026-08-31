<div align="center">

# 🚀 Flutter Enterprise Pro Max v2
### Configurable Flutter Engineering System & Architecture Decision Engine for AI Agents
*Engineered by 10+ Year Senior Principal Flutter & Enterprise Software Architects*

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Configurable%20Clean%20%7C%20Riverpod%20%7C%20Offline--First-brightgreen)](https://github.com)
[![SOLID](https://img.shields.io/badge/Principles-SOLID%20%26%20High%20Performance-blue)](https://github.com)
[![Testing](https://img.shields.io/badge/Testing-Unit%20%7C%20Widget%20%7C%20E2E-success)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)

*Turn any AI Agent (Antigravity, Cursor, Claude Code, Windsurf, Copilot) or Terminal into a **Principal Flutter Architect & UI/UX Specialist**.*

</div>

---

## 📑 Table of Contents
1. [What's New in v2](#-whats-new-in-v2)
2. [Architecture Profiles](#-architecture-profiles)
3. [Domain Error Isolation Principle](#-domain-error-isolation-principle)
4. [Feature Generator Engine (`add feature <name>`)](#-feature-generator-engine-add-feature-name)
5. [Testing Strategy (The 3-Tier Pyramid)](#-testing-strategy-the-3-tier-pyramid)
6. [Universal Installation Matrix](#-universal-installation-matrix)
7. [CLI Tools & Commands](#-cli-tools--commands)
8. [Automated Repository Validation](#-automated-repository-validation)
9. [License](#-license)

---

## 🌟 What's New in v2

* **🏛️ Architecture Decision Matrix**: No more static, dogmatic rules. Choose from **Enterprise Clean (Cubit + Injectable)**, **Riverpod Enterprise (AsyncNotifier + GoRouter)**, **Offline-First Enterprise (Drift + Sync Queue)**, or a fully custom profile.
* **🛡️ Domain Error Architecture Isolation**: Pure `Failure` hierarchy (`ServerFailure`, `NetworkFailure`, `UnauthorizedFailure`, `ValidationFailure`). The Domain Layer is 100% isolated from Dio, HTTP status codes, and REST models.
* **⚡ Interactive Feature Generator (`add feature <name>`)**: Automatically asks for specifications/documentation, UI/Figma design links, and generates the 3 clean architecture layers with Unit, Widget, and E2E Integration tests under strict SOLID principles.
* **🔒 Hardware-Level Security & Privacy Screen**: Hardware-encrypted `FlutterSecureStorage` (`AndroidOptions(encryptedSharedPreferences: true)`), and `PrivacyScreenOverlay` on backgrounding.
* **🎨 Core Design System Atoms**: Standardized `AppButton`, `AppTextField`, `AppShimmerLoading`, `AppEmptyState`, and `AppErrorWidget`.
* **🔍 Self-Validating Tooling (`bin/validate.dart`)**: Automated verification ensuring 100% repository consistency.

---

## 🏛️ Architecture Profiles

### 1️⃣ Profile 1: Enterprise Clean Architecture (Default Recommended)
```
lib/
├── core/
│   ├── config/ (app_config, app_flavor, dev_config, staging_config, production_config)
│   ├── errors/ (failure.dart, exceptions.dart)
│   ├── network/ (dio_client, auth_interceptor, api_error_handler, result.dart)
│   ├── routes/ (app_router, routes.dart with 400ms fade transition)
│   ├── services/ (token_storage, connectivity_service)
│   ├── theme/ (theme_manager, app_colors, strict CardThemeData)
│   ├── utils/ (validators.dart, context_extension.dart)
│   └── widgets/ (app_button, app_text_field, app_shimmer, app_empty_state, app_error_widget)
│
├── features/
│   └── <feature_name>/
│       ├── domain/ (entities, repos, usecases)
│       ├── data/ (data_sources, models, repos)
│       └── presentation/ (logic/cubits, screens, widgets)
```

### 2️⃣ Profile 2: Riverpod Enterprise
- **State Management**: `riverpod` 2.x with `AsyncNotifier` & `AsyncValue`.
- **Routing**: `go_router` with deep linking, route guards, and web URL synchronization.

### 3️⃣ Profile 3: Offline-First Enterprise
- **Local Store**: `drift` (SQLite ORM) with SQLCipher support.
- **Sync Engine**: Offline Sync Queue, idempotent retries with `X-Idempotency-Key`, and timestamp conflict resolution.

---

## 🛡️ Domain Error Isolation Principle

```
Remote API Exception (DioException / Server 500)
                    ↓
Data Layer: DataSource (Retrofit / Dio)
                    ↓
Data Layer: Repository Implementation (Maps DioException -> ServerFailure)
                    ↓
Domain Layer: UseCase returns Result<T, Failure> (Pure Dart)
                    ↓
Presentation Layer: Cubit / Notifier maps Failure -> Localized UI Message
```

---

## ⚡ Feature Generator Engine (`add feature <name>`)

When you ask the AI Agent to `add feature <name>` or run `dart bin/generate.dart <name>`:

1. **Intake Flow**:
   - Asks for user stories, requirements, or API documentation.
   - Asks for UI mockups or Figma links.
2. **Generates 3 Layers**:
   - `domain/`: Entities (`Equatable`), abstract Repositories, discrete UseCases.
   - `data/`: Remote Data Sources, `@JsonSerializable` Models + Mappers, Repository Implementations.
   - `presentation/`: Cubit/Notifier, Screen Widget, Sub-widgets.
3. **Generates 3-Tier Tests**:
   - Unit Tests (`test/features/<feature>/...`)
   - Widget Tests (`test/features/<feature>/presentation/...`)
   - Integration E2E Tests (`integration_test/<feature>_flow_test.dart`)

---

## 🧪 Testing Strategy (The 3-Tier Pyramid)

```dart
// Unit Testing Cubit with mocktail & bloc_test
blocTest<LoginCubit, AuthState>(
  'emits [loading, success] when credentials are valid',
  build: () => LoginCubit(mockLoginUseCase),
  setUp: () {
    when(() => mockLoginUseCase(email: 'test@example.com', password: '123'))
        .thenAnswer((_) async => const Success('dummy_token'));
  },
  act: (cubit) => cubit.login(email: 'test@example.com', password: '123'),
  expect: () => [
    const AuthState.loading(),
    const AuthState.success('dummy_token'),
  ],
  verify: (_) {
    verify(() => mockLoginUseCase(email: 'test@example.com', password: '123')).called(1);
  },
);
```

---

## 🤖 Universal Installation Matrix

### 1️⃣ Google Antigravity / Gemini CLI
```bash
# Clone the repository
git clone https://github.com/ahmedMetwaly/flutter-enterprise-pro-max-skill.git

# Link skill directory to your active Gemini/Antigravity plugins
Copy-Item "flutter-enterprise-pro-max-skill\SKILL.md" "$HOME\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md" -Force
```

### 2️⃣ Cursor IDE
Copy `rules/.cursorrules` to your project root `.cursorrules`.

### 3️⃣ Claude Code
Copy `rules/CLAUDE.md` to your project root `CLAUDE.md`.

### 4️⃣ Windsurf / Cascade
Copy `rules/.windsurfrules` to your project root `.windsurfrules`.

### 5️⃣ GitHub Copilot
Copy `rules/copilot-instructions.md` to `.github/copilot-instructions.md`.

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

## 🔍 Automated Repository Validation

To verify that all templates, schema definitions, profiles, rules, and CLI tools are 100% consistent:

```bash
dart bin/validate.dart
```

Output:
```text
============================================================
🔍 Flutter Enterprise Pro Max v2 — Repository Validator
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

## 📄 License
This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
