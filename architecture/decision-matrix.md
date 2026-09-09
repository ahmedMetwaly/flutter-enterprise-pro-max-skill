# 🏛️ Architecture Decision Matrix — Flutter Enterprise Pro Max

This document serves as the master decision matrix for choosing and configuring architectural dimensions in enterprise Flutter applications.

---

## 1. 📊 Architectural Dimensions Overview

| Dimension | Default (Profile 1) | Alternative 1 | Alternative 2 | Alternative 3 |
| :--- | :--- | :--- | :--- | :--- |
| **Architecture Style** | Feature-First Clean (3-Layer) | Modular Clean (Packages) | Simplified Feature-First | Layered Architecture |
| **State Management** | **Cubit + States** | **Riverpod (AsyncNotifier)** | **Bloc (Event-Driven)** | **Signals / Provider** |
| **Dependency Injection** | **GetIt + Injectable** | Riverpod Providers (DI) | Manual Factory Injection | Service Locator |
| **Error & Result** | **Sealed `Result<T, Failure>`** | `Either<Failure, T>` (dartz/fpdart) | Typed Exceptions & Handlers | Monadic Result |
| **Networking** | **Dio + Retrofit** | Direct Dio with Interceptors | HTTP Client Abstraction | GraphQL Client |
| **Navigation & Routing** | **Centralized AppRouter (Custom)** | **GoRouter (Deep Linking/Web)** | AutoRoute (CodeGen) | Beamer |
| **Persistence** | **SecureStorage + SharedPreferences** | Drift (SQLite ORM) | Isar / Hive (NoSQL) | ObjectBox |
| **Offline Strategy** | **Local Cache First** | **Sync Queue + Conflict Resolver** | Offline-First Event Log | None / Online-Only |
| **Observability** | **AppBlocObserver + ZoneGuard** | RiverpodObserver + Telemetry | Structured JSON Logging | Custom Metric Service |
| **Localization** | **AR/EN (l10n with ARB)** | EasyLocalization | Slang | GetX Localization |

---

## 2. 🔄 State Management Decision Matrix

### Option 1: Cubit (Recommended for Enterprise Clean Architecture)
- **Strengths**: Clean separation of UI and business logic, zero boilerplate compared to Bloc, predictable state transitions, direct `bloc_test` integration with `mocktail`, excellent element rebuild scoping via `BlocBuilder` / `BlocSelector`.
- **Ideal For**: Enterprise apps, banking, fintech, healthcare, teams with established Clean Architecture workflows.
- **Testing**: `bloc_test`, `emitsInOrder`, `when` & `verify` with `mocktail`.

### Option 2: Riverpod 2.x (Recommended for Modern / Web / Reactive Apps)
- **Strengths**: Compile-time safe dependency injection, built-in asynchronous state handling (`AsyncValue`), auto-dispose on unmount, seamless family/parameterized providers, great for web and complex reactive trees.
- **Ideal For**: Fast-paced product teams, reactive dashboards, multiplatform apps with complex nested dependencies.
- **Testing**: `ProviderContainer` overrides in unit tests, `container.read`, `container.listen`.

### Option 3: Bloc (Event-Driven)
- **Strengths**: Strict traceability with distinct Event objects, powerful event transformers (debounce, throttle, switchMap).
- **Ideal For**: Complex event streams, real-time tracking, chat applications, gaming/hardware event inputs.

### Option 4: Provider / Signals
- **Strengths**: Low learning curve, lightweight, fine-grained reactivity.
- **Ideal For**: Small-to-medium utilities, MVPs, migration projects.

---

## 3. 🛡️ Error Handling: Domain Isolation Principle

> [!CRITICAL]
> **Domain Layer MUST NOT depend on HTTP status codes, Dio, or REST models!**

```
Remote API Response / Exception
         ↓
Data Layer: DataSource (Retrofit / Dio)
         ↓
Data Layer: Repository Implementation (Maps DioException -> Failure)
         ↓
Domain Layer: UseCase returns Result<T, Failure> or Either<Failure, T>
         ↓
Presentation Layer: Cubit/Notifier maps Failure -> User-Friendly Localized Message
```

### Domain Failure Hierarchy:
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

## 4. 🚦 Routing Decision Matrix

### Centralized AppRouter (`core/routes/`):
- **When to choose**: Mobile-first applications where route transitions are customized (e.g. 400ms fade), simple hierarchical stack navigation, zero external route package dependency.

### GoRouter (`package:go_router`):
- **When to choose**: Web-first applications, deep linking with query parameters, nested bottom navigation with `ShellRoute` / `StatefulShellRoute`, declarative authentication redirects (`redirect: authGuard`).

---

## 5. 💾 Persistence Decision Matrix

| Store | Best Use Case | Security Level | Speed |
| :--- | :--- | :--- | :--- |
| **`FlutterSecureStorage`** | Access & Refresh Tokens, Encryption Keys, PIN hashes | 🔒 Hardware-backed (Keystore / Keychain) | Medium |
| **`SharedPreferences`** | User preferences, theme mode, locale, simple flags | ⚠️ Plaintext XML/Plist | Fast |
| **`Drift` (SQLite)** | Relational data, offline-first sync queue, complex queries | 🛡️ SQLCipher capable | Ultra-Fast |
| **`Isar / Hive`** | Key-value NoSQL objects, fast local document caching | 🛡️ Encrypted boxes | Ultra-Fast |
