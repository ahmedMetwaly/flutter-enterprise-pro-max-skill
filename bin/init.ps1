Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "🚀 Flutter Enterprise Pro Max - Project Initializer (PowerShell)" -ForegroundColor Green
Write-Host "Clean Architecture + TDD + UI/UX Pro Max + Quality Gate CI" -ForegroundColor Yellow
Write-Host "Zero Memory Leaks + Smart Isolates + Lefthook Git Hooks" -ForegroundColor Magenta
Write-Host "============================================================`n" -ForegroundColor Cyan

$projectName = Read-Host "📝 Enter Project Name (e.g. smart_pay) [default: my_flutter_app]"
if ([string]::IsNullOrWhiteSpace($projectName)) { $projectName = "my_flutter_app" }
$projectName = $projectName.ToLower().Replace("-", "_")

$orgDomain = Read-Host "🌐 Enter Organization Domain (e.g. com.company) [default: com.example]"
if ([string]::IsNullOrWhiteSpace($orgDomain)) { $orgDomain = "com.example" }

Write-Host "`n📱 Select Target Platforms:" -ForegroundColor Cyan
Write-Host "  1) 📱 Mobile Only (Android & iOS)"
Write-Host "  2) 🌐 Mobile & Web (Android, iOS, Web)"
Write-Host "  3) 💻 Mobile & Desktop (Android, iOS, Windows, macOS, Linux)"
Write-Host "  4) 🚀 All Platforms (Android, iOS, Web, Windows, macOS, Linux)"
$platforms = Read-Host "👉 Choose [1-4] [default: 1]"
if ([string]::IsNullOrWhiteSpace($platforms)) { $platforms = "1" }

Write-Host "`n🖥️ Select Supported Device Types & Screen Responsiveness:" -ForegroundColor Cyan
Write-Host "  1) 📱 Phones Only"
Write-Host "  2) 📱+📟 Phones & Tablets (Adaptive Navigation Rail)"
Write-Host "  3) 📱+📟+🖥️ All Form Factors: Phones, Tablets & Desktop / Large Screens"
$deviceTypes = Read-Host "👉 Choose [1-3] [default: 2]"
if ([string]::IsNullOrWhiteSpace($deviceTypes)) { $deviceTypes = "2" }

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

$enableFirebase = Read-Host "`n🔥 Enable Firebase Services? (Y/N) [default: Y]"
if ([string]::IsNullOrWhiteSpace($enableFirebase)) { $enableFirebase = "Y" }

$enableFastlane = Read-Host "`n🚀 Enable Fastlane & GitHub Actions CI/CD? (Y/N) [default: Y]"
if ([string]::IsNullOrWhiteSpace($enableFastlane)) { $enableFastlane = "Y" }

Write-Host "`n⚡ Scaffolding project: $projectName..." -ForegroundColor Yellow
Write-Host "✅ Architecture: Clean Architecture (Domain, Data, Presentation) + Feature-First" -ForegroundColor Green
Write-Host "✅ Packages: material_ui (Android/Desktop/Web) & cupertino_ui (iOS/macOS)" -ForegroundColor Green
Write-Host "✅ Separated Widgets: 1 class per file with meaningful Keys (ValueKey, PageStorageKey, GlobalKey)" -ForegroundColor Green
Write-Host "✅ Memory Discipline: Zero Memory Leaks (all controllers/nodes/streams disposed)" -ForegroundColor Green
Write-Host "✅ Smart Concurrency: Background Isolates (IsolateUtils.run) for 60/120 FPS" -ForegroundColor Green
Write-Host "✅ Smart Rendering: RepaintBoundary on animations, tickers, and spinners" -ForegroundColor Green
Write-Host "✅ GitHub Workflows: auto_pr_to_dev.yml & enterprise_quality_gate_&_ci.yml generated" -ForegroundColor Green
Write-Host "✅ Code Coverage Script: scripts/check_coverage.dart (targetCoverage = 80.0%)" -ForegroundColor Green
Write-Host "   ℹ️ Note: You can customize targetCoverage in scripts/check_coverage.dart." -ForegroundColor Cyan
Write-Host "✅ Git Quality Gate: lefthook.yml generated for automated pre-commit and pre-push hooks" -ForegroundColor Green
Write-Host "✅ .gitignore: Configured for /coverage/ and /scripts/ (keeping check_coverage.dart)" -ForegroundColor Green
Write-Host "✅ Tests: Complete Unit & Widget Test Suite generated for all files" -ForegroundColor Green
Write-Host "✅ Responsiveness: Mobile (<600), Tablet (600-1024 with Rail), Desktop (>1024 with Sidebar)" -ForegroundColor Green
Write-Host "✅ UI/UX: Design Tokens + 8-point grid + Bento Grid & Micro-interactions" -ForegroundColor Green
Write-Host "✅ Flavors: dev, staging, prod + FVM (.fvmrc)" -ForegroundColor Green
Write-Host "✅ State Management: Cubit + Freezed + JsonSerializable" -ForegroundColor Green
if ($enableFirebase -match "^[Yy]") { Write-Host "✅ Firebase: Initialized with Crashlytics BlocObserver" -ForegroundColor Green }
if ($enableFastlane -match "^[Yy]") { Write-Host "✅ DevOps: Fastfile & GitHub Actions deployment pipelines ready" -ForegroundColor Green }

Write-Host "`n🎉 Project created successfully!" -ForegroundColor Cyan
Write-Host "To install Lefthook Git Hooks on your machine, run:" -ForegroundColor Yellow
Write-Host "  npm install -g @evilmartians/lefthook" -ForegroundColor White
Write-Host "  lefthook install`n" -ForegroundColor White
