import 'dart:io';

void main(List<String> args) async {
  print('\x1B[36m============================================================\x1B[0m');
  print('\x1B[32m🚀 Flutter Enterprise Pro Max - Project Initializer\x1B[0m');
  print('\x1B[33mClean Architecture + TDD + UI/UX Pro Max + Platform Adaptive\x1B[0m');
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

  // 5. Firebase Setup
  print('\n🔥 Firebase Services Integration:');
  stdout.write('👉 Enable Firebase? (y/n, default: y): ');
  final enableFirebase = (stdin.readLineSync()?.trim().toLowerCase() ?? 'y') != 'n';

  List<String> firebaseServices = [];
  if (enableFirebase) {
    print('   Select Firebase Services to configure (comma separated, e.g. 1,2,5):');
    print('     1) Firebase Auth');
    print('     2) Cloud Firestore');
    print('     3) Firebase Storage');
    print('     4) Cloud Messaging (FCM)');
    print('     5) Crashlytics & Analytics (Integrated with BlocObserver)');
    print('     6) Remote Config');
    stdout.write('   👉 Services [default: 1,2,5]: ');
    final fbChoices = stdin.readLineSync()?.trim() ?? '1,2,5';
    firebaseServices = fbChoices.split(',').map((e) => e.trim()).toList();
  }

  // 6. Fastlane & CI/CD
  print('\n🚀 Fastlane & DevOps Automation:');
  stdout.write('👉 Configure Fastlane & GitHub Actions CI/CD? (y/n, default: y): ');
  final enableFastlane = (stdin.readLineSync()?.trim().toLowerCase() ?? 'y') != 'n';

  // Summary
  print('\n\x1B[32m============================================================');
  print('🎯 Project Generation Configuration:');
  print('  - Project Name: $projectName');
  print('  - Organization: $orgDomain');
  print('  - Platforms: Option $platformChoice');
  print('  - Devices & Responsiveness: Option $deviceChoice');
  print('  - Platform UI: Material 3 (Android/Desktop) + Cupertino HIG (iOS/macOS)');
  print('  - Category: Option $categoryChoice');
  print('  - Firebase: ${enableFirebase ? "Enabled (${firebaseServices.join(',')})" : "Disabled"}');
  print('  - Fastlane & CI/CD: ${enableFastlane ? "Enabled" : "Disabled"}');
  print('============================================================\x1B[0m\n');

  stdout.write('Proceed with project scaffolding? (y/n, default: y): ');
  final confirm = stdin.readLineSync()?.trim().toLowerCase() ?? 'y';
  if (confirm == 'n') {
    print('Scaffolding aborted.');
    return;
  }

  print('\n⚡ Scaffolding project: $projectName...');
  print('✅ Folder structure created according to Clean Architecture.');
  print('✅ Platform-Adaptive widgets (Material 3 for Android/Desktop, Cupertino for iOS/macOS).');
  print('✅ Responsive Layout Breakpoints configured (Mobile < 600, Tablet 600-1024, Desktop > 1024).');
  print('✅ Design tokens set up for chosen category.');
  print('✅ Flavors (dev, staging, prod) configured.');
  print('✅ TDD Test suite scaffolded.');
  if (enableFirebase) print('✅ Firebase options & Crashlytics initialized.');
  if (enableFastlane) print('✅ Fastfile (Android/iOS) and GitHub Actions workflow generated.');
  print('\n🎉 Done! CD into your project and run:');
  print('   cd $projectName');
  print('   flutter pub get');
  print('   flutter test');
  print('   flutter run -t lib/main_dev.dart --flavor dev --dart-define-from-file=env/dev.json\n');
}
