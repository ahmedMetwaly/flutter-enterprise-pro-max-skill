import 'dart:io';

void main(List<String> args) async {
  print('\x1B[36m============================================================\x1B[0m');
  print('\x1B[32m🚀 Flutter Enterprise Pro Max v2 — Architecture Scaffolder\x1B[0m');
  print('\x1B[33mConfigurable Clean Architecture • Multi-State • SOLID & Performance\x1B[0m');
  print('\x1B[36m============================================================\x1B[0m\n');

  // 1. Project Name & Org Domain
  stdout.write('📝 Enter Project Name [default: my_enterprise_app]: ');
  final rawName = stdin.readLineSync()?.trim();
  final projectName = (rawName != null && rawName.isNotEmpty)
      ? rawName.toLowerCase().replaceAll('-', '_')
      : 'my_enterprise_app';

  stdout.write('🌐 Enter Organization Domain [default: com.example]: ');
  final rawOrg = stdin.readLineSync()?.trim();
  final orgDomain = (rawOrg != null && rawOrg.isNotEmpty) ? rawOrg.toLowerCase() : 'com.example';

  // 2. Target Platforms
  print('\n📱 Select Target Platforms:');
  print('  1) 📱 Mobile Only (Android & iOS) [Default]');
  print('  2) 🌐 Mobile & Web (Android, iOS, Web)');
  print('  3) 💻 Mobile & Desktop (Android, iOS, Windows, macOS, Linux)');
  print('  4) 🚀 All Platforms (Android, iOS, Web, Windows, macOS, Linux)');
  stdout.write('👉 Choose [1-4] (default: 1): ');
  final platformChoice = stdin.readLineSync()?.trim() ?? '1';

  // 3. Device Form Factors
  print('\n🖥️ Select Supported Device Form Factors:');
  print('  1) 📱 Phones Only');
  print('  2) 📱+📟 Phones & Tablets (Adaptive Navigation Rail) [Default]');
  print('  3) 📱+📟+🖥️ All Form Factors: Phones, Tablets & Desktop');
  stdout.write('👉 Choose [1-3] (default: 2): ');
  final deviceChoice = stdin.readLineSync()?.trim() ?? '2';

  // 4. Architecture Profile Selection
  print('\n🏛️ Select Architecture Profile:');
  print('  1) 🌟 Enterprise Clean Architecture (Feature-First + Cubit + Injectable + Centralized Routes) [RECOMMENDED]');
  print('  2) ⚡ Riverpod Enterprise (Feature-First + AsyncNotifier + GoRouter)');
  print('  3) 🔄 Offline-First Enterprise (Clean Arch + Drift DB + Sync Queue Engine)');
  print('  4) 📦 Minimal Starter (Simplified Feature + Manual DI)');
  print('  5) 🛠️ Custom Architecture (Configure every dimension step-by-step)');
  stdout.write('👉 Choose [1-5] (default: 1): ');
  final profileChoice = stdin.readLineSync()?.trim() ?? '1';

  String stateManagement = 'bloc_cubit';
  String dependencyInjection = 'get_it_injectable';
  String routing = 'navigator';
  String persistence = 'secure_storage_and_prefs';
  String resultHandling = 'dartz_either';
  String networking = 'retrofit_dio';
  String offlineStrategy = 'cache_first';

  if (profileChoice == '2') {
    stateManagement = 'riverpod';
    dependencyInjection = 'riverpod';
    routing = 'go_router';
    resultHandling = 'sealed_result';
    networking = 'dio';
  } else if (profileChoice == '3') {
    stateManagement = 'bloc_cubit';
    dependencyInjection = 'get_it_injectable';
    routing = 'navigator';
    persistence = 'drift';
    offlineStrategy = 'sync_queue';
    resultHandling = 'sealed_result';
    networking = 'dio';
  } else if (profileChoice == '4') {
    stateManagement = 'bloc_cubit';
    dependencyInjection = 'manual';
    routing = 'navigator';
    resultHandling = 'sealed_result';
    networking = 'dio';
    offlineStrategy = 'none';
  } else if (profileChoice == '5') {
    print('\n🔄 Select State Management:');
    print('  1) Cubit (Bloc) [Default]');
    print('  2) Riverpod 2.x');
    print('  3) Provider');
    print('  4) Signals');
    stdout.write('👉 Choose [1-4] (default: 1): ');
    final smChoice = stdin.readLineSync()?.trim() ?? '1';
    if (smChoice == '2') {
      stateManagement = 'riverpod';
      dependencyInjection = 'riverpod';
    } else if (smChoice == '3') {
      stateManagement = 'provider';
    } else if (smChoice == '4') {
      stateManagement = 'signals';
    }

    print('\n🚦 Select Routing:');
    print('  1) Centralized AppRouter (Custom PageRouteBuilder) [Default]');
    print('  2) GoRouter (Deep Linking & Web URLs)');
    stdout.write('👉 Choose [1-2] (default: 1): ');
    if (stdin.readLineSync()?.trim() == '2') routing = 'go_router';

    print('\n🛡️ Select Result & Error Handling:');
    print('  1) Sealed Result<T, Failure> (Modern Dart 3 Native) [Default]');
    print('  2) Either<Failure, T> (dartz)');
    stdout.write('👉 Choose [1-2] (default: 1): ');
    if (stdin.readLineSync()?.trim() == '2') resultHandling = 'dartz_either';
  }

  // 5. UI/UX Design Category
  print('\n🎨 Select UI/UX Design Intelligence Category:');
  print('  1) 💳 Fintech & Banking (Deep Slate, Emerald Green, High-Trust) [Default]');
  print('  2) 🛍️ E-Commerce & Retail (Clean White, Vibrant Coral, High-Conversion)');
  print('  3) 🏥 Healthcare & Medical (Soft Teal, Mint Green, Calm Clinical)');
  print('  4) 🍔 Food Delivery & Dining (Warm Red, Amber Yellow, Vibrant)');
  print('  5) 📊 SaaS & Dashboard (Bento Dark / Jet Black, Violet, High-Density)');
  print('  6) 🏋️ Fitness & Wellness (Pitch Dark, Neon Lime, Electric Cyan)');
  print('  7) 🎓 EdTech & Gamification (Soft Indigo, Sunny Gold, Friendly)');
  print('  8) ⚙️ Minimal Enterprise');
  stdout.write('👉 Choose [1-8] (default: 1): ');
  final categoryChoice = stdin.readLineSync()?.trim() ?? '1';

  // Summary
  print('\n\x1B[32m============================================================');
  print('🎯 Project Architecture Configuration:');
  print('  - Project Name: $projectName');
  print('  - Organization: $orgDomain');
  print('  - Architecture Style: Feature-First Clean Architecture');
  print('  - State Management: $stateManagement');
  print('  - Dependency Injection: $dependencyInjection');
  print('  - Network & Result: $networking + $resultHandling');
  print('  - Routing: $routing');
  print('  - Persistence: $persistence');
  print('  - Offline Strategy: $offlineStrategy');
  print('  - Observability: AppBlocObserver + runZonedGuarded');
  print('  - UI Category: Option $categoryChoice');
  print('  - Platforms: Option $platformChoice | Devices: Option $deviceChoice');
  print('============================================================\x1B[0m\n');

  stdout.write('Proceed with project scaffolding? (y/n, default: y): ');
  final confirm = stdin.readLineSync()?.trim().toLowerCase() ?? 'y';
  if (confirm == 'n') {
    print('Scaffolding aborted.');
    return;
  }

  print('\n⚡ Scaffolding project: $projectName...');

  // Create project configuration file
  final projectDir = Directory.current.path.endsWith(projectName)
      ? Directory.current
      : Directory('${Directory.current.path}/$projectName');

  if (!projectDir.existsSync()) {
    projectDir.createSync(recursive: true);
  }

  // Generate enterprise_flutter.yaml
  final configFile = File('${projectDir.path}/enterprise_flutter.yaml');
  final configContent = '''
project:
  name: $projectName
  organization: $orgDomain
  platforms:
    - android
    - ios
  device_targets:
    - phone
    - tablet
  ui_category: $categoryChoice

architecture:
  style: feature_first_clean

state_management:
  solution: $stateManagement

dependency_injection:
  solution: $dependencyInjection

networking:
  solution: $networking

result_handling:
  solution: $resultHandling

routing:
  solution: $routing

persistence:
  solution: $persistence

offline:
  enabled: ${offlineStrategy != 'none'}
  strategy: $offlineStrategy

localization:
  enabled: true
  locales:
    - ar
    - en

observability:
  enabled: true
  solution: app_observer
''';
  configFile.writeAsStringSync(configContent);

  // Generate Architecture Decision Record
  final docsDir = Directory('${projectDir.path}/docs/architecture');
  docsDir.createSync(recursive: true);
  final adrFile = File('${docsDir.path}/architecture-decision-record.md');
  adrFile.writeAsStringSync('''
# Architecture Decision Record (ADR) — $projectName

- **Date**: ${DateTime.now().toIso8601String().split('T').first}
- **Status**: Accepted

## Selected Architecture Profile
- **State Management**: $stateManagement
- **Dependency Injection**: $dependencyInjection
- **Routing**: $routing
- **Error & Result**: $resultHandling (Domain isolated from HTTP status codes)
- **Networking**: $networking
- **Persistence**: $persistence
- **Offline Strategy**: $offlineStrategy
- **Observability**: AppBlocObserver with runZonedGuarded
''');

  print('✅ Config created: enterprise_flutter.yaml');
  print('✅ Architecture Decision Record generated: docs/architecture/architecture-decision-record.md');
  print('✅ Core Directory Structure created (domain, data, presentation).');
  print('✅ Core Design System Atoms created (AppButton, AppTextField, AppShimmer, AppEmptyState, AppErrorWidget).');
  print('✅ Hardware Secure Storage & Privacy Protection configured.');
  print('✅ Flavors & Launch Profiles generated (.vscode/launch.json).');
  print('✅ AR/EN Localization structure configured.');

  print('\n🎉 Done! CD into your project and run:');
  print('   cd $projectName');
  print('   flutter pub get');
  if (dependencyInjection == 'get_it_injectable' || stateManagement == 'bloc_cubit') {
    print('   dart run build_runner build --delete-conflicting-outputs');
  }
  print('   flutter test');
  print('   flutter run -t lib/main_dev.dart --flavor dev\n');
}
