# GitHub Copilot Custom Instructions for Flutter Enterprise Pro Max

- Architecture: Clean Architecture + Feature-First.
- Always generate auto_pr_to_dev.yml, enterprise_quality_gate_&_ci.yml, scripts/check_coverage.dart, and lefthook.yml.
- Ensure targetCoverage = 80.0% is documented and customizable in check_coverage.dart.
- Ensure complete Unit and Widget tests are written for all created files.
- .gitignore must ignore /coverage/ and /scripts/* while tracking !/scripts/check_coverage.dart.
- One widget per file as a class. Never generate widget helper methods.
- Assign meaningful Keys (ValueKey for dynamic items, PageStorageKey for scrollables, GlobalKey for forms).
- Zero memory leaks: Always dispose all controllers/nodes and cancel streams/timers in dispose(). Check if (!context.mounted) return;
- Concurrency: Offload heavy computation to Isolate.run() to prevent UI jank.
- Performance: Use RepaintBoundary on animations, loaders, and custom painters.
- Packages: Use material_ui for Android/Desktop/Web and cupertino_ui for iOS/macOS.
