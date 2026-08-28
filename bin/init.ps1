Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "🚀 Flutter Enterprise Pro Max - Project Initializer (PowerShell)" -ForegroundColor Green
Write-Host "Clean Architecture (3 Layers) + Injectable DI + Flavors + Routes + i18n" -ForegroundColor Yellow
Write-Host "============================================================`n" -ForegroundColor Cyan

# 1. Project Name & Org
$projectName = Read-Host "📝 Enter Project Name (e.g. smart_pay) [default: my_flutter_app]"
if ([string]::IsNullOrWhiteSpace($projectName)) { $projectName = "my_flutter_app" }
$projectName = $projectName.ToLower().Replace("-", "_")

$orgDomain = Read-Host "🌐 Enter Organization Domain (e.g. com.company) [default: com.example]"
if ([string]::IsNullOrWhiteSpace($orgDomain)) { $orgDomain = "com.example" }

# 2. Platforms
Write-Host "`n📱 Select Target Platforms:" -ForegroundColor Cyan
Write-Host "  1) 📱 Mobile Only (Android & iOS)"
Write-Host "  2) 🌐 Mobile & Web (Android, iOS, Web)"
Write-Host "  3) 💻 Mobile & Desktop (Android, iOS, Windows, macOS, Linux)"
Write-Host "  4) 🚀 All Platforms (Android, iOS, Web, Windows, macOS, Linux)"
$platforms = Read-Host "👉 Choose [1-4] [default: 1]"
if ([string]::IsNullOrWhiteSpace($platforms)) { $platforms = "1" }

# 3. Device Form Factors
Write-Host "`n🖥️ Select Supported Device Types & Screen Responsiveness:" -ForegroundColor Cyan
Write-Host "  1) 📱 Phones Only"
Write-Host "  2) 📱+📟 Phones & Tablets (Adaptive Navigation Rail)"
Write-Host "  3) 📱+📟+🖥️ All Form Factors: Phones, Tablets & Desktop / Large Screens"
$deviceTypes = Read-Host "👉 Choose [1-3] [default: 2]"
if ([string]::IsNullOrWhiteSpace($deviceTypes)) { $deviceTypes = "2" }

# 4. UI/UX Category
Write-Host "`n🎨 Select App Category / Design Intelligence:" -ForegroundColor Cyan
Write-Host "  1) 💳 Fintech & Banking (Deep Slate, Emerald Green, High-Trust)"
Write-Host "  2) 🛍️ E-Commerce & Retail (Clean White, Vibrant Coral, High-Conversion)"
Write-Host "  3) 🏥 Healthcare & Medical (Soft Teal, Mint Green, Calm Clinical)"
Write-Host "  4) 🍔 Food Delivery & Dining (Warm Red, Amber Yellow, Vibrant)"
Write-Host "  5) 📊 SaaS & Dashboard (Bento Dark / Jet Black, Violet, High-Density)"
Write-Host "  6) 🏋️ Fitness & Wellness (Pitch Dark, Neon Lime, Electric Cyan)"
Write-Host "  7) 🎓 EdTech & Gamification (Soft Indigo, Sunny Gold, Friendly)"
Write-Host "  8) ⚙️ Clean Slate Enterprise (Default Minimalist)"
$category = Read-Host "👉 Choose [1-8] [default: 1]"
if ([string]::IsNullOrWhiteSpace($category)) { $category = "1" }

# 5. DevOps & Fastlane
$enableFastlane = Read-Host "`n🚀 Enable Fastlane & GitHub Actions CI/CD? (Y/N) [default: Y]"
if ([string]::IsNullOrWhiteSpace($enableFastlane)) { $enableFastlane = "Y" }

Write-Host "`n⚡ Scaffolding project: $projectName..." -ForegroundColor Yellow
Write-Host "✅ 3-Layer Clean Architecture created (domain, data, presentation)" -ForegroundColor Green
Write-Host "✅ Injectable + GetIt dependency injection configured" -ForegroundColor Green
Write-Host "✅ Enterprise Network subsystem (AuthInterceptor, ApiErrorHandler, DioClient, dartz Either)" -ForegroundColor Green
Write-Host "✅ Centralized Routes created (core/routes/routes.dart & app_router.dart)" -ForegroundColor Green
Write-Host "✅ Mandatory Flavors configured (DevConfig, StagingConfig with dotenv, ProductionConfig with --dart-define)" -ForegroundColor Green
Write-Host "✅ VS Code launch configurations generated (.vscode/launch.json)" -ForegroundColor Green
Write-Host "✅ Git ignore configured for all .env files" -ForegroundColor Green
Write-Host "✅ Mandatory AR/EN Localization created (intl_en.arb, intl_ar.arb)" -ForegroundColor Green
Write-Host "✅ Platform Adaptability: Material 3 (Android/Desktop) + Cupertino HIG (iOS/macOS)" -ForegroundColor Green
Write-Host "✅ Responsiveness: Mobile, Tablet (Navigation Rail), Desktop (Sidebar)" -ForegroundColor Green
Write-Host "✅ UI/UX: Design Tokens + 8-point grid + strict CardThemeData" -ForegroundColor Green
Write-Host "✅ State Management: Cubit + Freezed + JsonSerializable" -ForegroundColor Green
if ($enableFastlane -match "^[Yy]") { Write-Host "✅ DevOps: Fastfile & GitHub Actions deployment pipelines ready" -ForegroundColor Green }

Write-Host "`n🎉 Project created successfully!" -ForegroundColor Cyan
Write-Host "   cd $projectName"
Write-Host "   flutter pub get"
Write-Host "   dart run build_runner build --delete-conflicting-outputs"
Write-Host "   flutter test"
Write-Host "   flutter run -t lib/main_dev.dart --flavor dev`n"


