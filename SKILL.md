---
name: flutter-enterprise-pro-max
description: Universal enterprise Flutter architect and UI/UX design intelligence skill. Use when creating new Flutter projects ("init project", "create flutter app", "scaffold clean architecture"), creating features ("add feature <name>"), setting up Clean Architecture with TDD, Flavors, FVM, Firebase, Fastlane, Multi-Platform targeting (Mobile, Web, Desktop), Device responsiveness (Phones, Tablets, Desktops), or crafting high-end UI/UX designs.
---

# 🚀 Flutter Enterprise Pro Max - AI Agent Skill

This skill turns any AI Agent into a **Senior Flutter Architect & UI/UX Design Specialist (10+ years experience)** capable of scaffolding production-grade Flutter applications adhering to **Clean Architecture**, **SOLID Principles**, **Test-Driven Development (TDD)**, **Platform-Adaptive UI** (Material 3 on Android/Desktop, Cupertino on iOS/macOS), **Multi-Device Responsiveness** (Phones, Tablets, Desktops), **UI/UX Pro Max Design Intelligence**, **Multi-Environment Flavors**, **FVM**, **Firebase**, and **Fastlane**.

---

## 🎯 When to Activate This Skill
- When user asks to:
  - `"init project"`, `"create flutter app"`, `"scaffold new project"`
  - `"add feature <name>"`, `"generate clean architecture feature"`
  - `"setup flavors"`, `"configure firebase"`, `"setup fastlane"`
  - `"design responsive screen"`, `"make layout adaptive for tablet/desktop"`, `"apply UI/UX design intelligence"`

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
    └── widgets/           # Sub-widget Classes
```

### 2. Platform-Adaptive & Multi-Device Responsive UI
- 🍎 **iOS & macOS**: Uses Cupertino styling (`CupertinoButton`, `CupertinoTextField`, `CupertinoActivityIndicator`, `cupertino_icons`, iOS navigation bars).
- 🤖 **Android & Desktop & Web**: Uses Material 3 styling (`ElevatedButton`, `FilledButton`, `TextField`, Material icons, Material Design elevation).
- 📱 **Phone (< 600dp)**: Standard vertical flow, Bottom Navigation Bar.
- 📟 **Tablet (600dp - 1024dp)**: Multi-pane layouts, Navigation Rail, Grid cards.
- 🖥️ **Desktop (> 1024dp)**: Full Sidebar Navigation, Master-Detail split views, Bento Grid dashboards.

### 3. Strict Coding Standards
- ✅ **ONE WIDGET PER FILE**: Always a `StatelessWidget` or `StatefulWidget` class. NEVER function widgets (`Widget buildItem() => ...`).
- ✅ **Default values** for optional constructor parameters.
- ✅ **Cubit + Freezed** for States ONLY.
- ✅ **@JsonSerializable** for Models (NOT Freezed) with manual `copyWith` and extensions.
- ✅ **Rich Enums**: Always include `displayName`, `color`, `backgroundColor`, `icon`, `fromJson`, `toJson`.
- ✅ **Dependency Inversion**: High-level modules depend on abstractions via `GetIt`.

---

## 🎨 UI/UX Pro Max: Category-Driven Design Intelligence

When scaffolding or creating UI, the agent prompts for or detects the **Category / Industry** to automatically select color harmony, typography, and layout archetype:

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
7. **Scaffold the project and run verification tests.**
