<div align="center">

# 🚀 Flutter Enterprise Pro Max Skill
### Universal AI Agent Skill & Enterprise Architecture Toolkit for Flutter
*Modeled after Senior Enterprise Production Architecture*


[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-3--Layer%20Clean%20%2B%20Injectable-brightgreen)](https://github.com)
[![SOLID](https://img.shields.io/badge/Principles-SOLID%20%26%20High%20Performance-blue)](https://github.com)
[![Localization](https://img.shields.io/badge/Localization-Mandatory%20AR%2FEN-green)](https://github.com)
[![Flavors](https://img.shields.io/badge/Flavors-Dev%20%7C%20Staging%20%7C%20Prod-orange)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)

*Turn any AI Agent (Antigravity, Cursor, Claude Code, Windsurf, Copilot) or Terminal into a **10-Year Senior Enterprise Flutter Architect & UI/UX Specialist**.*

</div>

---

## 📑 Table of Contents
1. [Overview](#-overview)
2. [Universal Installation Matrix](#-universal-installation-matrix)
   - [Google Antigravity / Gemini CLI](#1-google-antigravity--gemini-cli)
   - [Cursor IDE](#2-cursor-ide)
   - [Claude Code](#3-claude-code)
   - [Windsurf / Cascade](#4-windsurf--cascade)
   - [GitHub Copilot](#5-github-copilot)
   - [Standalone Terminal CLI](#6-standalone-terminal-cli-no-ai-required)
3. [UI/UX Pro Max: Category Design Tokens](#-uiux-pro-max-category-design-tokens)
4. [Platform-Adaptive & Responsive Architecture](#-platform-adaptive--responsive-architecture)
5. [Project Directory Layout](#-project-directory-layout)
6. [Interactive Prompts & Usage Examples](#-interactive-prompts--usage-examples)
7. [Quickstart Commands](#-quickstart-commands)
8. [Troubleshooting & FAQ](#-troubleshooting--faq)
9. [License](#-license)

---

## 📖 Overview

**Flutter Enterprise Pro Max** is a complete, production-grade AI Agent Skill and scaffolding framework engineered to enforce enterprise engineering standards:
* **🏛️ 3-Layer Clean Architecture & SOLID Principles**: Pure Dart Domain Layer (`entities`, `repositories`, `usecases`), isolated Data Layer (`datasources`, `models`, `repositories`), and Presentation Layer (`cubits`, `screens`, `widgets`).
* **💉 Injectable + GetIt Dependency Injection**: Inversion of control using `@singleton`, `@LazySingleton(as: Interface)`, `@injectable`, and `@module`.
* **🌐 Production Network Subsystem **:
  - `DioClient` with `PrettyDioLogger` and timeout settings.
  - `AuthInterceptor` with thread-safe token refresh mutex (`Completer`), token storage, and automatic retry of queued requests.
  - `ApiErrorHandler` mapping Dio errors to structured `ApiErrorModel`.
  - Generic `ApiResponse<T>` and `PaginatedResponse<T>`.
  - `ResultFuture<T> = Future<Either<ApiErrorModel, T>>` functional error paradigm.
* **🚩 Mandatory Multi-Environment Flavors**:
  - `dev`, `staging`, and `production` with `.env.*` support, `AppFlavor`, `EnvConfig`, and visual ribbon banners on non-production builds.
* **🌍 Mandatory AR/EN Localization**:
  - **STRICT ZERO HARDCODED STRINGS** in UI and error messages.
  - Arabic (RTL) & English (LTR) ready with `AppLocalizations` and context extensions.
* **📦 FVM (Flutter Version Management)**:
  - Interactive prompt to pin a custom SDK version or use machine default.
* **🛡️ Enterprise Validation, Caching & Error Handling**:
  - Composable `Validators` with localized errors.
  - Secure token storage (`FlutterSecureStorage`) & session caching (`SharedPreferences`).
* **📱 Platform-Adaptive UI**: Native **Material 3** for Android/Desktop/Web & Native **Cupertino (HIG)** for iOS/macOS.
* **🖥️ Multi-Device Responsiveness**: Automatic layout adaptation for **Phones** (< 600dp), **Tablets** (600dp - 1024dp with Navigation Rail), and **Desktop / Large Screens** (> 1024dp with Sidebar).
* **🎨 UI/UX Pro Max Design Intelligence**: 7 pre-built psychological design palettes (Fintech, E-Commerce, Healthcare, Food Delivery, SaaS, Fitness, EdTech).
* **🔥 Firebase & Fastlane**: Flavor-aware Firebase setup with Crashlytics plugged into `BlocObserver`, plus Android/iOS Fastlane deployment pipelines.

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
> `"init project"` or `"scaffold clean architecture feature auth"`

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
│   │   ├── env/                         # DevConfig, StagingConfig, ProductionConfig
│   │   ├── service_locator.dart         # GetIt + Injectable initialization
│   │   └── service_locator.config.dart  # Generated by injectable_generator
│   │
│   ├── errors/                          # Failures & Exceptions
│   │   ├── exceptions.dart              # ServerException, CacheException
│   │   └── failure.dart                 # Failure, ServerFailure
│   │
│   ├── extension/                       # Extensions (context, l10n, string)
│   │   └── context_extension.dart
│   │
│   ├── network/                         # Enterprise Network Layer
│   │   ├── api_error_handler.dart       # DioException -> ApiErrorModel handler
│   │   ├── api_error_model.dart         # @JsonSerializable error model
│   │   ├── api_response.dart            # Generic ApiResponse<T> wrapper
│   │   ├── paginated_response.dart      # Generic PaginatedResponse<T>
│   │   ├── auth_interceptor.dart        # 401 refresh lock, token injection & retry
│   │   ├── dio_client.dart              # Configured Dio factory with PrettyDioLogger
│   │   └── endpoints/                   # Static endpoint constants per feature
│   │
│   ├── services/                        # Service wrappers
│   │   ├── register_module.dart         # Injectable @module (Dio, SecureStorage, etc.)
│   │   ├── token_storage.dart           # Secure token storage
│   │   └── secure_storage_service.dart
│   │
│   ├── theme/                           # Light/Dark Theme & Design Tokens
│   │   ├── app_colors.dart
│   │   └── theme_manager.dart
│   │
│   ├── utils/                           # Utils & Typedefs
│   │   ├── either.dart                  # Pure Dart Left/Right sealed class
│   │   ├── typedef.dart                 # ResultFuture<T> = Future<Either<ApiErrorModel, T>>
│   │   ├── responsive_layout.dart       # Breakpoint builder (Mobile, Tablet, Desktop)
│   │   └── validators.dart              # Composable Form Validators
│   │
│   └── widgets/                         # Core Reusable UI Component Classes
│       ├── adaptive_scaffold.dart
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       ├── custom_card.dart
│       ├── custom_badge.dart
│       ├── custom_avatar.dart
│       ├── loading_indicator.dart
│       ├── empty_state_widget.dart
│       └── error_state_widget.dart
│
├── features/ (or src/)                  # Feature-First Modules
│   └── feature_name/
│       ├── data/                        # DATA LAYER
│       │   ├── datasources/             # Retrofit Remote DataSources (*_datasource.dart)
│       │   ├── models/                  # @JsonSerializable + copyWith + Mappers
│       │   └── repositories/            # *_repo_impl.dart (@LazySingleton(as: *Repo))
│       │
│       ├── domain/                      # DOMAIN LAYER (Pure Business Logic)
│       │   ├── entities/                # Pure Dart Business Entities (Equatable)
│       │   ├── repositories/            # Abstract Repository contracts (*_repo.dart)
│       │   └── usecases/                # Business UseCases
│       │
│       └── presentation/                # PRESENTATION LAYER
│           ├── logic/                   # Cubit ONLY + Freezed States
│           ├── screens/                 # Screen Widget Classes
│           └── widgets/                 # Sub-widgets (1 class per file)
│
├── l10n/                                # LOCALIZATION
│   ├── intl_en.arb                      # English
│   └── intl_ar.arb                      # Arabic (RTL)
│
├── main.dart                            # Shared bootstrap(EnvConfig) runner
├── main_dev.dart                        # Dev Flavor Entrypoint
├── main_staging.dart                    # Staging Flavor Entrypoint
└── main_production.dart                 # Production Flavor Entrypoint
```

---

## ⚡ Interactive Prompts & Usage Examples

### 1. Initialize a Project
Ask your AI Agent:
> `"init project"`

The wizard will guide you through:
1. 📝 Project Name & Org Domain.
2. 📦 FVM Setup (Custom version or Machine default).
3. 📱 Target Platforms (Mobile, Web, Desktop, All).
4. 🖥️ Device Types (Phones, Tablets, Desktops).
5. 🎨 UI/UX Pro Max Category (Fintech, E-Commerce, Healthcare, SaaS, etc.).
6. 🔥 Firebase Services (Auth, Firestore, Storage, Messaging, Crashlytics).
7. 🚀 Fastlane & CI/CD Pipelines.

### 2. Scaffold a New Feature
Ask your AI Agent:
> `"Scaffold a Clean Architecture feature named 'auth' with 3 layers following enterprise standards."`


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

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

