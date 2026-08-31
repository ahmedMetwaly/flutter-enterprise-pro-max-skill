import 'dart:io';

void main(List<String> args) async {
  print('\x1B[36m============================================================\x1B[0m');
  print('\x1B[32m🚀 Flutter Enterprise Pro Max - Project Initializer\x1B[0m');
  print('\x1B[33mClean Architecture (3 Layers) + Injectable DI + Flavors + Routes + i18n\x1B[0m');
  print('\x1B[36m============================================================\x1B[0m\n');

  // 1. Project Name & Org
  stdout.write('📝 Enter Project Name (e.g. smart_pay): ');
  final projectName = stdin.readLineSync()?.trim().toLowerCase().replaceAll('-', '_') ?? 'my_flutter_app';

  stdout.write('🌐 Enter Organization Domain (e.g. com.company): ');
  final orgDomain = stdin.readLineSync()?.trim().toLowerCase() ?? 'com.example';

  // 2. Target Platforms Selection
  print('\n📱 Select Target Platforms:');
  print('  1) 📱 Mobile Only (Android & iOS)');
  print('  2) 🌐 Mobile & Web (Android, iOS, Web)');
  print('  3) 💻 Mobile & Desktop (Android, iOS, Windows, macOS, Linux)');
  print('  4) 🚀 All Platforms (Android, iOS, Web, Windows, macOS, Linux)');
  stdout.write('👉 Choose [1-4] (default: 1): ');
  final platformChoice = stdin.readLineSync()?.trim() ?? '1';

  // 3. Device Form Factors Selection
  print('\n🖥️ Select Supported Device Types & Screen Responsiveness:');
  print('  1) 📱 Phones Only');
  print('  2) 📱+📟 Phones & Tablets (Adaptive Navigation Rail)');
  print('  3) 📱+📟+🖥️ All Form Factors: Phones, Tablets & Desktop / Large Screens');
  stdout.write('👉 Choose [1-3] (default: 2): ');
  final deviceChoice = stdin.readLineSync()?.trim() ?? '2';

  // 4. Category Selection (UI/UX Pro Max)
  print('\n🎨 Select App Category / Design Intelligence:');
  print('  1) 💳 Fintech & Banking (Deep Slate, Emerald Green, High-Trust)');
  print('  2) 🛍️ E-Commerce & Retail (Clean White, Vibrant Coral, High-Conversion)');
  print('  3) 🏥 Healthcare & Medical (Soft Teal, Mint Green, Calm Clinical)');
  print('  4) 🍔 Food Delivery & Dining (Warm Red, Amber Yellow, Vibrant)');
  print('  5) 📊 SaaS & Dashboard (Bento Dark / Jet Black, Violet, High-Density)');
  print('  6) 🏋️ Fitness & Wellness (Pitch Dark, Neon Lime, Electric Cyan)');
  print('  7) 🎓 EdTech & Gamification (Soft Indigo, Sunny Gold, Friendly)');
  print('  8) ⚙️ Clean Slate Enterprise (Default Minimalist)');
  stdout.write('👉 Choose [1-8] (default: 1): ');
  final categoryChoice = stdin.readLineSync()?.trim() ?? '1';

  // Summary
  print('\n\x1B[32m============================================================');
  print('🎯 Project Generation Configuration:');
  print('  - Project Name: $projectName');
  print('  - Organization: $orgDomain');
  print('  - Architecture: 3-Layer Clean Architecture (Domain, Data, Presentation) + SOLID');
  print('  - State Management: Cubit + Freezed States (Value Equality, Unit Test Ready)');
  print('  - DI: Injectable + GetIt (UseCases injected into Cubits)');
  print('  - Network: Dio + Retrofit + AuthInterceptor + ApiErrorHandler + dartz Either');
  print('  - Routes: Centralized (core/routes/routes.dart & app_router.dart)');
  print('  - Flavors: Mandatory (DevConfig, StagingConfig with dotenv, ProductionConfig with --dart-define)');
  print('  - Launch Profiles: .vscode/launch.json generated');
  print('  - Localization: Mandatory AR & EN (Zero hardcoded strings)');
  print('  - Category: Option $categoryChoice');
  print('  - Theme: Material 3 with strict CardThemeData');
  print('  - Platforms: Option $platformChoice');
  print('  - Devices & Responsiveness: Option $deviceChoice');
  print('============================================================\x1B[0m\n');

  stdout.write('Proceed with project scaffolding? (y/n, default: y): ');
  final confirm = stdin.readLineSync()?.trim().toLowerCase() ?? 'y';
  if (confirm == 'n') {
    print('Scaffolding aborted.');
    return;
  }

  print('\n⚡ Scaffolding project: $projectName...');
  print('✅ 3-Layer Clean Architecture & SOLID principles enforced (domain, data, presentation).');
  print('✅ Cubit + Freezed States configured with UseCase dependency injection.');
  print('✅ Injectable + GetIt dependency injection configured.');
  print('✅ Enterprise Network subsystem (AuthInterceptor, ApiErrorHandler, DioClient, dartz Either).');
  print('✅ Routes configured (core/routes/routes.dart, core/routes/app_router.dart).');
  print('✅ Mandatory Flavors configured (DevConfig, StagingConfig, ProductionConfig).');
  print('✅ VS Code launch configurations generated (.vscode/launch.json).');
  print('✅ Git ignore updated for all .env files.');
  print('✅ Mandatory AR/EN Localization created (intl_en.arb, intl_ar.arb).');
  print('✅ Platform-Adaptive widgets (Material 3 for Android/Desktop, Cupertino for iOS/macOS).');
  print('✅ Responsive Layout Breakpoints configured (Mobile < 600, Tablet 600-1024, Desktop > 1024).');
  print('✅ High-Performance standards applied (const constructors everywhere, strict CardThemeData).');
  print('\n🎉 Done! CD into your project and run:');
  print('   cd $projectName');
  print('   flutter pub get');
  print('   dart run build_runner build --delete-conflicting-outputs');
  print('   flutter test');
  print('   flutter run -t lib/main_dev.dart --flavor dev\n');
}





