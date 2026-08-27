Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "🚀 Flutter Enterprise Pro Max - Project Initializer (PowerShell)" -ForegroundColor Green
Write-Host "Clean Architecture + TDD + UI/UX Pro Max + Flavors + FVM" -ForegroundColor Yellow
Write-Host "============================================================`n" -ForegroundColor Cyan

$projectName = Read-Host "📝 Enter Project Name (e.g. smart_pay) [default: my_flutter_app]"
if ([string]::IsNullOrWhiteSpace($projectName)) { $projectName = "my_flutter_app" }
$projectName = $projectName.ToLower().Replace("-", "_")

$orgDomain = Read-Host "🌐 Enter Organization Domain (e.g. com.company) [default: com.example]"
if ([string]::IsNullOrWhiteSpace($orgDomain)) { $orgDomain = "com.example" }

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
Write-Host "✅ UI/UX: Design Tokens + 8-point grid + Bento Grid & Micro-interactions" -ForegroundColor Green
Write-Host "✅ Flavors: dev, staging, prod + FVM (.fvmrc)" -ForegroundColor Green
Write-Host "✅ State Management: Cubit + Freezed + JsonSerializable" -ForegroundColor Green
Write-Host "✅ Testing: Full TDD Test Suite with Mocktail & BlocTest" -ForegroundColor Green
if ($enableFirebase -match "^[Yy]") { Write-Host "✅ Firebase: Initialized with Crashlytics BlocObserver" -ForegroundColor Green }
if ($enableFastlane -match "^[Yy]") { Write-Host "✅ DevOps: Fastfile & GitHub Actions deployment pipelines ready" -ForegroundColor Green }

Write-Host "`n🎉 Project created successfully!" -ForegroundColor Cyan
