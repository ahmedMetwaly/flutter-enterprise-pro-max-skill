<div align="center">

# 🚀 Flutter Enterprise Pro Max Skill
### The Universal AI Agent Skill & Enterprise Architecture Toolkit for Flutter

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2B%20TDD-brightgreen)](https://github.com)
[![SOLID](https://img.shields.io/badge/Principles-SOLID%20%26%20Zero%20Leaks-blue)](https://github.com)
[![Platform](https://img.shields.io/badge/Packages-material__ui%20%7C%20cupertino__ui-orange)](https://github.com)
[![UI/UX](https://img.shields.io/badge/Design-UI%2FUX%20Pro%20Max-ff69b4)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)

*Turn any AI Agent (Antigravity, Cursor, Claude Code, Windsurf, Copilot) or Terminal into a **10-Year Senior Flutter Architect & UI/UX Specialist**.*

</div>

---

## 📑 Table of Contents
1. [Overview](#-overview)
2. [Core Engineering & Performance Pillars](#-core-engineering--performance-pillars)
   - [Separated Widgets & Meaningful Keys](#1-separated-widgets--meaningful-keys-by-usage)
   - [Zero Memory Leaks Guarantee](#2-zero-memory-leaks-guarantee)
   - [Smart Background Concurrency (Isolates)](#3-smart-background-concurrency-isolates)
   - [Smart RepaintBoundary Optimization](#4-smart-repaintboundary-optimization)
   - [Packages: material_ui & cupertino_ui](#5-platform-packages-material_ui--cupertino_ui)
3. [Universal Installation Matrix](#-universal-installation-matrix)
   - [Google Antigravity / Gemini CLI](#1-google-antigravity--gemini-cli)
   - [Cursor IDE](#2-cursor-ide)
   - [Claude Code](#3-claude-code)
   - [Windsurf / Cascade](#4-windsurf--cascade)
   - [GitHub Copilot](#5-github-copilot)
   - [Standalone Terminal CLI](#6-standalone-terminal-cli-no-ai-required)
4. [UI/UX Pro Max: Category Design Tokens](#-uiux-pro-max-category-design-tokens)
5. [Platform-Adaptive & Responsive Architecture](#-platform-adaptive--responsive-architecture)
6. [Project Directory Layout](#-project-directory-layout)
7. [Troubleshooting & FAQ](#-troubleshooting--faq)
8. [License](#-license)

---

## 📖 Overview

**Flutter Enterprise Pro Max** is an enterprise-grade AI Agent Skill and scaffolding framework engineered to enforce the highest industry standards:
* **🏛️ Clean Architecture & SOLID Principles**: Pure Dart Domain Layer, isolated Data Layer (Retrofit + JsonSerializable), and Cubit/Freezed Presentation Layer.
* **📦 Enterprise UI Packages**: Utilizes **`material_ui`** for Android/Desktop/Web and **`cupertino_ui`** for iOS/macOS.
* **🧩 Separated Widgets with Explicit Keys**: Every widget in its own file as a class with purposeful keys (`ValueKey`, `PageStorageKey`, `GlobalKey`).
* **🛡️ Zero Memory Leaks Guarantee**: Strict lifecycle management and disposal for controllers, nodes, subscriptions, and timers.
* **⚡ Smart Concurrency & Isolates**: Heavy computations offloaded to background threads using `IsolateUtils.run()` to maintain 60/120 FPS.
* **🎯 Smart RepaintBoundary Optimization**: High-frequency repainting animations and loaders isolated to prevent cascading redraws.
* **📱 Multi-Device Responsiveness**: Smart layout adaptation for **Phones** (< 600dp), **Tablets** (600dp - 1024dp with Navigation Rail), and **Desktop / Large Screens** (> 1024dp with Sidebar).
* **🧪 Test-Driven Development (TDD)**: Unit testing suite with `mocktail` and `bloc_test`.
* **🎨 UI/UX Pro Max Design Intelligence**: 7 pre-built psychological design palettes.

---

## ⚡ Core Engineering & Performance Pillars

### 1. Separated Widgets & Meaningful Keys by Usage
- **One Widget Per File**: Every UI component is built as a separate `StatelessWidget` or `StatefulWidget` class. **Zero function widgets** (`Widget myButton() => ...`).
- **Targeted Keys**:
  - `ValueKey<T>(item.id)`: Mandatory for dynamic list/grid items.
  - `PageStorageKey<String>('scroll_key')`: Mandatory for scrollable lists/tabs to preserve scroll position across tab switches.
  - `GlobalKey<FormState>()`: Reserved strictly for Form validation.
  - `ValueKey<String>('feature_action')`: For buttons and interactive inputs for automated testing and element reconciliation.

### 2. Zero Memory Leaks Guarantee
- **Mandatory Controller Disposal**: Every `TextEditingController`, `AnimationController`, `ScrollController`, `PageController`, and `FocusNode` created in a `StatefulWidget` is disposed inside `dispose()`.
- **Stream & Timer Management**: All `StreamSubscription` and `Timer` instances are cancelled in `dispose()`.
- **Async Context Protection**: Always verify `if (!context.mounted) return;` across async gaps before using `BuildContext`.

### 3. Smart Background Concurrency (Isolates)
- **UI Thread Protection**: The main isolate is kept free of CPU-heavy workloads to prevent dropped frames (guaranteeing 60/120 FPS).
- **Automated Isolate Offloading**: Heavy JSON parsing, cryptographic operations, image processing, and large list filtering are run via `IsolateUtils.run()`:
  ```dart
  final filteredData = await IsolateUtils.run(
    (items) => items.where((e) => e.matches(query)).toList(),
    largeItemList,
  );
  ```

### 4. Smart RepaintBoundary Optimization
- **Isolate Animations**: Elements that tick or repaint frequently (rotating spinners, Lottie animations, custom painters, video feeds) are isolated with `RepaintBoundary` so they do not trigger repainting of the parent screen:
  ```dart
  RepaintBoundary(
    child: CircularProgressIndicator(...),
  )
  ```
- **Selective Application**: Plain static widgets are not wrapped to avoid texture allocation overhead.

### 5. Platform Packages: `material_ui` & `cupertino_ui`
- **Android, Desktop & Web**: Powered by `package:material_ui/material_ui.dart`.
- **iOS & macOS**: Powered by `package:cupertino_ui/cupertino_ui.dart` and `cupertino_icons`.

---

## 🤖 Universal Installation Matrix

---

### 1️⃣ Google Antigravity / Gemini CLI

#### 🔹 Using Windows PowerShell
```powershell
if (!(Test-Path "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max")) { 
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max" | Out-Null 
}
Copy-Item "SKILL.md" "$env:USERPROFILE\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md" -Force
```

#### 🔹 Using Windows Command Prompt (CMD)
```cmd
if not exist "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max" mkdir "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max"
copy "SKILL.md" "%USERPROFILE%\.gemini\config\plugins\flutter\skills\flutter-enterprise-pro-max\SKILL.md"
```

#### 🔹 Using macOS / Linux
```bash
mkdir -p ~/.gemini/config/plugins/flutter/skills/flutter-enterprise-pro-max
cp SKILL.md ~/.gemini/config/plugins/flutter/skills/flutter-enterprise-pro-max/SKILL.md
```

#### 💡 How to Use in Antigravity:
Type in your chat:
> `"init project"` or `"scaffold clean architecture feature cart"`

---

### 2️⃣ Cursor IDE
Copy `rules/.cursorrules` to your project root:
```powershell
Copy-Item "rules\.cursorrules" ".cursorrules" -Force
```
*Prompt Cursor Composer/Chat:*
> `"Follow .cursorrules and initialize a new Flutter project named smart_wallet for Fintech."`

---

### 3️⃣ Claude Code
Copy `rules/CLAUDE.md` to your workspace root:
```powershell
Copy-Item "rules\CLAUDE.md" "CLAUDE.md" -Force
```
*Run:*
```bash
claude "Read CLAUDE.md and scaffold a Clean Architecture Flutter project named mega_store."
```

---

### 4️⃣ Windsurf / Cascade
Copy `rules/.windsurfrules` into your workspace root:
```powershell
Copy-Item "rules\.windsurfrules" ".windsurfrules" -Force
```

---

### 5️⃣ GitHub Copilot
Copy `rules/copilot-instructions.md` into your `.github/` folder:
```powershell
if (!(Test-Path ".github")) { New-Item -ItemType Directory -Force -Path ".github" | Out-Null }
Copy-Item "rules\copilot-instructions.md" ".github\copilot-instructions.md" -Force
```

---

### 6️⃣ Standalone Terminal CLI (No AI Required)

```bash
# Cross-Platform Dart
dart run bin/init.dart

# Windows PowerShell
powershell -ExecutionPolicy Bypass -File .\bin\init.ps1
```

---

## 🎨 UI/UX Pro Max: Category Design Tokens

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

* **Breakpoints**: Phone (< 600dp), Tablet (600dp - 1024dp with Navigation Rail), Desktop (> 1024dp with Sidebar).
* **Adaptive Widgets**: Automatically switch between `material_ui` and `cupertino_ui` based on target OS.

---

## ❓ Troubleshooting & FAQ

#### Q1: Error `'Copy-Item' is not recognized as an internal or external command`?
* **Cause**: You ran a PowerShell command inside Windows **Command Prompt (CMD)**.
* **Fix**: Use the CMD copy syntax or switch to PowerShell.

#### Q2: Error `File init.ps1 cannot be loaded because running scripts is disabled`?
* **Fix**: Run PowerShell with execution policy bypass:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .\bin\init.ps1
  ```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
