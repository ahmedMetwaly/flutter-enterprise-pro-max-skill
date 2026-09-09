# Claude Code Project Guidelines - Flutter Enterprise Pro Max

## Architecture & Standards
- Framework: Flutter with Clean Architecture (Domain, Data, Presentation).
- Quality Gates & Workflows:
  - Generate `.github/workflows/auto_pr_to_dev.yml` and `.github/workflows/enterprise_quality_gate_&_ci.yml`.
  - Generate `scripts/check_coverage.dart` (targetCoverage = 80.0%, configurable).
  - Generate `lefthook.yml` (pre-commit format & analyze, pre-push tests & coverage).
  - Set up `.gitignore` (/coverage/, /scripts/*, !/scripts/check_coverage.dart).
- Tests: Generate Unit and Widget tests for ALL files to achieve >=80% coverage immediately.
- Separated Widgets: One widget class per file. Never use helper functions returning Widgets.
- Keys: Explicit keys based on usage (ValueKey, PageStorageKey, GlobalKey).
- Zero Memory Leaks: Always dispose TextEditingController, AnimationController, ScrollController, FocusNode, and cancel subscriptions/timers in dispose(). Check context.mounted.
- Smart Isolates: Use Isolate.run() for heavy JSON parsing, list sorting, and cryptography to keep 60/120 FPS.
- Smart RepaintBoundary: Wrap animated spinners, loaders, and canvas painters in RepaintBoundary.
- Packages: material_ui for Android/Desktop/Web, cupertino_ui for iOS/macOS.
- State Management: Cubit with Freezed for States.
