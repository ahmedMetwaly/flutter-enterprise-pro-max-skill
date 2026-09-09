# ⚡ Enterprise Feature Generation Engine (`add feature <name>`)

This guide specifies the interactive, enterprise-grade feature generation workflow for AI Agents and the CLI (`bin/generate.dart`).

---

## 1. 🎯 Interactive Intake Flow

Whenever the user or agent triggers `add feature <name>` or `generate feature`:

The Agent **MUST NOT** write code blindly. It **MUST** ask the following 4 structured inputs:

```
============================================================
🚀 Enterprise Feature Generator: [feature_name]
============================================================

1. 📄 Feature Specification / Requirements:
   - Provide user stories, API contracts, acceptance criteria, or upload documentation.

2. 🎨 UI / Design Assets:
   - Do you have Figma link(s), screenshot mockups, or design tokens? (Paste link / upload images).

3. 🔄 Architectural Confirmation:
   - Confirming project profile: [e.g. Clean Architecture + Cubit + Injectable + Result<T, Failure>].

4. 🧪 Test Suite Generation:
   - Generating Unit Tests (Domain & State), Widget Tests (UI Components), and E2E Integration Tests.
```

---

## 2. 🏛️ Strict 3-Layer Feature Scaffolding

Every feature generated follows the project's configured architecture profile:

```
features/<feature_name>/
├── domain/                         # Layer 1: Pure Dart Business Logic
│   ├── entities/                   # Pure immutable classes (Equatable / const)
│   │   └── <feature>_entity.dart
│   ├── repos/                      # Abstract contract returning Result<T, Failure>
│   │   └── <feature>_repository.dart
│   └── usecases/                   # Single-responsibility UseCases (@lazySingleton)
│       └── <action>_usecase.dart
│
├── data/                           # Layer 2: Data Retrieval & Mapping
│   ├── data_sources/               # Remote (Retrofit) & Local sources
│   │   └── <feature>_remote_data_source.dart
│   ├── models/                     # @JsonSerializable + copyWith + toEntity()
│   │   └── <feature>_model.dart
│   └── repos/                      # Concrete repo implementation (@LazySingleton)
│       └── <feature>_repository_impl.dart
│
└── presentation/                   # Layer 3: Reactive State & Responsive UI
    ├── logic/
    │   └── cubits/ (or notifiers/) # Cubit with Freezed / Equatable States
    │       ├── <feature>_cubit.dart
    │       └── <feature>_state.dart
    ├── screens/                    # Screen widget classes (ResponsiveLayout)
    │   └── <feature>_screen.dart
    └── widgets/                    # Cohesive sub-widgets (ONE widget class per file)
        ├── <feature>_header_widget.dart
        └── <feature>_item_card.dart
```

---

## 3. 💎 SOLID Principles & High Performance Enforcement

1. **Single Responsibility (SRP)**:
   - Each UseCase handles exactly ONE action (e.g. `LoginUseCase`, `GetProfileUseCase`).
   - Each widget class resides in its own separate file with ONE visual responsibility.
2. **Open/Closed (OCP)**:
   - Repositories and DataSources are defined as abstract contracts so new data providers can be plugged in without modifying domain code.
3. **Liskov Substitution (LSP)**:
   - Repository implementations strictly fulfill the return contract `Future<Result<T, Failure>>`.
4. **Interface Segregation (ISP)**:
   - Separate distinct capabilities into dedicated interfaces rather than giant fat repositories.
5. **Dependency Inversion (DIP)**:
   - Cubits/Notifiers inject abstract UseCases; UseCases inject abstract Repositories; dependencies are registered via `@injectable` / `@lazySingleton`.
6. **⚡ Performance & Memory**:
   - `const` constructors on all States, Entities, Widgets, and layout tokens.
   - Granular `BlocBuilder` / `BlocSelector` scoped to exact leaf nodes.
   - All `TextEditingController`s, `ScrollController`s, and `StreamSubscription`s disposed properly.

---

## 4. 🧪 3-Tier Automated Test Generation

Every generated feature **MUST** include 3 test suites:

### 1. Unit Tests (`test/features/<feature>/...`)
- **UseCase Test**: Test execution with mock Repository returning Success / Failure.
- **Repository Implementation Test**: Test remote call and mapping `DioException` -> `Failure`.
- **Cubit / Notifier Test**: Using `bloc_test` & `mocktail` testing `initialState`, `happyPath`, and `errorPath` with `verify().called(1)`.

### 2. Widget Tests (`test/features/<feature>/presentation/...`)
- Verify rendering of screen components in phone & tablet viewports.
- Verify text input, button clicks, loading spinner visibility, and error banner display.

### 3. End-to-End Integration Test (`integration_test/<feature>_flow_test.dart`)
- Test full user journey: launch -> fill form -> tap action -> verify success state / navigation.
