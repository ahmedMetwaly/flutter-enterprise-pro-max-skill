---
name: flutter-enterprise-pro-max
description: Universal enterprise Flutter architect and UI/UX design intelligence skill. Use when creating new Flutter projects ("init project", "create flutter app", "scaffold clean architecture"), creating features ("add feature <name>"), setting up Clean Architecture with TDD, Flavors, FVM, Firebase, Fastlane, Multi-Platform targeting (Mobile, Web, Desktop), Device responsiveness (Phones, Tablets, Desktops), zero memory leaks, smart background isolates (compute/Isolate.run), smart RepaintBoundary optimization, and material_ui / cupertino_ui packages.
---

# 🚀 Flutter Enterprise Pro Max - AI Agent Skill

This skill turns any AI Agent into a **Senior Flutter Architect & UI/UX Design Specialist (10+ years experience)** capable of scaffolding production-grade Flutter applications adhering to **Clean Architecture**, **SOLID Principles**, **Test-Driven Development (TDD)**, **Platform-Adaptive UI** (`material_ui` on Android/Desktop/Web, `cupertino_ui` on iOS/macOS), **Multi-Device Responsiveness** (Phones, Tablets, Desktops), **Zero Memory Leaks**, **Smart Background Isolates**, and **Smart RepaintBoundary Optimization**.

---

## 🎯 When to Activate This Skill
- When user asks to:
  - `"init project"`, `"create flutter app"`, `"scaffold new project"`
  - `"add feature <name>"`, `"generate clean architecture feature"`
  - `"setup flavors"`, `"configure firebase"`, `"setup fastlane"`
  - `"design responsive screen"`, `"make layout adaptive for tablet/desktop"`
  - `"prevent memory leaks"`, `"run heavy task in isolate"`, `"optimize repaints"`

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
7. **Scaffold the project with zero memory leaks, smart isolates, and RepaintBoundary optimization.**
