<div align="center">

# 🚀 Flutter Enterprise Pro Max Skill
### Universal AI Agent Skill & Enterprise Architecture Toolkit for Flutter

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2B%20TDD-brightgreen)](https://github.com)
[![SOLID](https://img.shields.io/badge/Principles-SOLID%20%26%20High%20Performance-blue)](https://github.com)
[![UI/UX](https://img.shields.io/badge/Design-UI%2FUX%20Pro%20Max-ff69b4)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)

*Turn any AI Agent (Antigravity, Cursor, Claude Code, Windsurf, Copilot) or Terminal into a **10-Year Senior Flutter Architect & UI/UX Specialist**.*

</div>

---

## 📖 Overview

**Flutter Enterprise Pro Max** is a production-grade AI Skill and interactive project generator that combines:
1. **🏛️ Enterprise Clean Architecture & SOLID Principles**: Feature-First organization (`data`, `domain`, `presentation`).
2. **🧪 Test-Driven Development (TDD)**: Mocktail & BlocTest unit testing suite.
3. **🎨 UI/UX Pro Max Design Intelligence**: Category-driven design psychology, 8-point grid, Bento Grids, Glassmorphism, and dynamic micro-interactions.
4. **🌐 Multi-Environment Flavors & FVM**: Out-of-the-box `dev`, `staging`, and `prod` configurations.
5. **🔥 Firebase Services & Crashlytics Integration**: Flavor-aware Firebase with automatic Crashlytics logging via `BlocObserver`.
6. **🚀 DevOps & CI/CD**: Android/iOS Fastlane pipelines and GitHub Actions workflows.

---

## 🤖 Universal AI Agent Installation Guide

This skill is designed to work seamlessly across **all AI tools and coding environments**. Choose your tool below:

### 1️⃣ Google Antigravity / Gemini CLI
Copy the `SKILL.md` file to your Antigravity skills directory:
```bash
# Windows
Copy-Item "SKILL.md" "$env:USERPROFILE\.gemini\antigravity\skills\flutter-enterprise-pro-max\SKILL.md" -Force

# macOS / Linux
mkdir -p ~/.gemini/antigravity/skills/flutter-enterprise-pro-max
cp SKILL.md ~/.gemini/antigravity/skills/flutter-enterprise-pro-max/
```
*Now simply type `init project` or `scaffold feature auth` in your Antigravity chat!*

---

### 2️⃣ Cursor IDE
1. Copy `rules/.cursorrules` to the root of your workspace:
   ```bash
   cp rules/.cursorrules .cursorrules
   ```
2. In Cursor Chat / Composer, type:
   > `"Follow .cursorrules and initialize a new Flutter project for a Fintech app."`

---

### 3️⃣ Claude Code
1. Copy `rules/CLAUDE.md` to your workspace root:
   ```bash
   cp rules/CLAUDE.md CLAUDE.md
   ```
2. Prompt Claude Code:
   > `"Read CLAUDE.md and scaffold a Clean Architecture Flutter project named smart_pay."`

---

### 4️⃣ Windsurf / Cascade
1. Copy `rules/.windsurfrules` into your workspace root:
   ```bash
   cp rules/.windsurfrules .windsurfrules
   ```
2. Prompt Cascade:
   > `"Initialize the project according to .windsurfrules standards."`

---

### 5️⃣ GitHub Copilot
1. Copy `rules/copilot-instructions.md` into your `.github/` folder:
   ```bash
   mkdir -p .github
   cp rules/copilot-instructions.md .github/copilot-instructions.md
   ```

---

### 6️⃣ Standalone Terminal (CLI Wizard)
Run the interactive CLI generator without an AI tool:

```bash
# Using Dart
dart run bin/init.dart

# Using Windows PowerShell
.\bin\init.ps1
```

---

## 🎨 UI/UX Pro Max: Category-Driven Design Intelligence

When initializing a project or designing UI, the skill adapts colors, typography, and layout archetypes based on your **App Category**:

| Category | Visual Archetype | Color Harmony | Default Font |
| :--- | :--- | :--- | :--- |
| 💳 **Fintech & Banking** | High-Trust / Dark Sleek | Deep Navy (`#0F172A`) + Emerald (`#10B981`) | Plus Jakarta Sans |
| 🛍️ **E-Commerce & Retail** | High-Conversion Bento Grid | Clean White (`#FFFFFF`) + Coral (`#FF5722`) | Poppins / Outfit |
| 🏥 **Healthcare & Medical** | Calm Clinical / Soft Borders | Soft Teal (`#0D9488`) + Mint (`#14B8A6`) | DM Sans |
| 🍔 **Food Delivery** | Vibrant High-Energy | Warm Crimson (`#DC2626`) + Amber (`#F59E0B`) | Outfit |
| 📊 **SaaS & Productivity** | Bento Grid High-Density | Jet Black (`#09090B`) + Violet (`#6366F1`) | Inter |
| 🏋️ **Fitness & Wellness** | High-Energy Dark / Neon | Pitch Dark (`#0A0A0A`) + Lime (`#84CC16`) | Plus Jakarta Sans |
| 🎓 **EdTech & Learning** | Gamified & Friendly | Soft Indigo (`#4F46E5`) + Gold (`#FBBF24`) | Nunito |

---

## 📁 Architecture & Directory Structure

```
lib/
├── core/                                # Shared infrastructure
│   ├── config/                          # AppConfig & EnvironmentType
│   ├── constants/                       # ApiConstants & Routes
│   ├── di/                              # Dependency Injection (GetIt)
│   ├── enums/                           # Rich Enums (displayName, color, icon, json)
│   ├── errors/                          # Failures, Exceptions & ErrorHandler
│   ├── network/                         # DioFactory, Interceptors, NetworkInfo
│   ├── routing/                         # GoRouter configuration
│   ├── theme/                           # AppTheme, Design Tokens & Typography
│   ├── usecases/                        # BaseUseCase<Type, Params>
│   └── widgets/                         # Shared Custom Widgets (One widget per file)
│
├── features/                            # Feature-First Modules
│   └── feature_name/
│       ├── data/
│       │   ├── data_sources/            # Retrofit Remote/Local DataSources
│       │   ├── models/                  # @JsonSerializable + copyWith + Extensions
│       │   └── repos/                   # Repository Implementations
│       ├── domain/
│       │   ├── entities/                # Pure Dart Business Entities (Equatable)
│       │   ├── repos/                   # Repository Interfaces
│       │   └── usecases/                # Business UseCases
│       └── presentation/
│           ├── logic/                   # Cubit ONLY + Freezed States
│           ├── screens/                 # Screen Widget Classes
│           └── widgets/                 # Sub-widgets
│
├── main_dev.dart                        # Dev Flavor Entrypoint
├── main_staging.dart                    # Staging Flavor Entrypoint
└── main_prod.dart                       # Production Flavor Entrypoint
```

---

## ⚡ Quickstart Commands

```bash
# 1. Install dependencies
flutter pub get

# 2. Run Code Generation (Freezed, Retrofit, JsonSerializable)
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run Automated TDD Test Suite
flutter test

# 4. Run Specific Flavor with Environment Variables
flutter run -t lib/main_dev.dart --flavor dev --dart-define-from-file=env/dev.json
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com).

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
