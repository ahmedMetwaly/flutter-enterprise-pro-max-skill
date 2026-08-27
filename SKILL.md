---
name: flutter-enterprise-pro-max
description: Universal enterprise Flutter architect and UI/UX design intelligence skill. Use when creating new Flutter projects ("init project", "create flutter app", "scaffold clean architecture"), creating features ("add feature <name>"), setting up Clean Architecture with TDD, Flavors, FVM, Firebase, Fastlane, or crafting high-end UI/UX designs.
---

# 🚀 Flutter Enterprise Pro Max - AI Agent Skill

This skill turns any AI Agent into a **Senior Flutter Architect & UI/UX Design Specialist (10+ years experience)** capable of scaffolding production-grade Flutter applications adhering to **Clean Architecture**, **SOLID Principles**, **Test-Driven Development (TDD)**, **UI/UX Pro Max Design Intelligence**, **Multi-Environment Flavors**, **FVM**, **Firebase**, and **Fastlane**.

---

## 🎯 When to Activate This Skill
- When user asks to:
  - `"init project"`, `"create flutter app"`, `"scaffold new project"`
  - `"add feature <name>"`, `"generate clean architecture feature"`
  - `"setup flavors"`, `"configure firebase"`, `"setup fastlane"`
  - `"design a high-end screen"`, `"apply UI/UX design intelligence"`

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

### 2. Strict Coding Standards
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
2. **Select App Category** [1-8] for UI/UX Pro Max tokens.
3. **Ask for Firebase Services** (Auth, Firestore, Storage, Messaging, Crashlytics, Remote Config).
4. **Ask for Fastlane & CI/CD** (Android / iOS Fastfile, GitHub Actions).
5. **Scaffold the project and run verification tests.**

---

## 🧪 TDD Strategy
Always implement tests alongside code in `test/`:
- **Domain**: Pure unit tests for UseCases with `mocktail`.
- **Data**: JSON serialization tests for Models + Offline/Online handling in Repositories.
- **Presentation**: State flow testing with `bloc_test`.
