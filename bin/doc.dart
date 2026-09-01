import 'dart:io';

void main(List<String> args) async {
  print('============================================================');
  print('📑 Flutter Enterprise Pro Max — Feature PRD & Doc Generator');
  print('10-Year Senior Product Manager & Software Architect Standard');
  print('============================================================\n');

  String featureName = '';
  if (args.isNotEmpty && !args.first.startsWith('-')) {
    featureName = args.first.toLowerCase().replaceAll('-', '_');
  } else {
    stdout.write('📝 Enter Feature Name to Document (e.g. auth, checkout, profile): ');
    final input = stdin.readLineSync()?.trim().toLowerCase().replaceAll('-', '_');
    featureName = (input != null && input.isNotEmpty) ? input : 'auth';
  }

  final pascalName = featureName.split('_').map((w) => w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1)}').join();

  print('\n📄 Generating 10-Year PM Product Requirements Document & Technical Blueprint for: "$pascalName"...');

  final featureDocsDir = Directory('lib/features/$featureName/docs');
  if (!featureDocsDir.existsSync()) {
    featureDocsDir.createSync(recursive: true);
  }

  final dateStr = DateTime.now().toIso8601String().split('T').first;

  // 1. Generate Markdown Content
  final mdContent = '''# 📋 Product Requirements Document (PRD) & Technical Architecture Blueprint
## Feature: $pascalName
**Author**: Principal Product Manager & Lead Flutter Architect (10+ Years Experience)  
**Date**: $dateStr  
**Status**: Approved / Ready for Implementation  
**Version**: 1.0.0  

---

## 1. 🎯 Executive Summary & Product Vision

### 1.1 Problem Statement
In modern enterprise mobile applications, friction in the **$pascalName** experience directly increases user abandonment, elevates support tickets, and hinders conversion. Users require a seamless, intuitive, and highly responsive interface that guarantees data privacy, resilient network handling, and clear feedback across all device form factors.

### 1.2 Value Proposition & Strategic Goals
The **$pascalName** module provides an enterprise-grade experience adhering to strict security, Clean Architecture, and platform-adaptive design. It streamlines the user journey while enforcing zero data leaks and resilient offline caching.

### 1.3 Target Personas
* **Primary Persona**: End Consumer — expects rapid feedback, biometric authentication, localized UI (Arabic & English), and zero latency.
* **Secondary Persona**: Enterprise Admin / Support — requires structured audit logs, verifiable error codes, and strict session integrity.

### 1.4 Core Success Metrics (KPIs)
* ⚡ **Completion Rate**: > 98.5% completion on the primary user path.
* ⏱️ **Interaction Latency**: Time-to-Interactive (TTI) < 600ms on standard 4G networks.
* 🛡️ **Crash-Free Sessions**: 99.9% crash-free rate across iOS and Android.
* 🌍 **Localization Accuracy**: 100% Arabic (RTL) & English (LTR) string coverage with zero hardcoded UI literals.

---

## 2. 👥 User Journeys & Acceptance Criteria (Gherkin Scenarios)

### User Story 1: Happy Path Execution
```gherkin
Feature: $pascalName Primary Flow
  As an authenticated user
  I want to interact with $pascalName
  So that I can accomplish my business task securely and efficiently

  Scenario: Successful submission and state transition
    Given the user opens the $pascalName screen
    When the user fills the required inputs with valid data
    And taps the primary action button
    Then the system displays a loading indicator and disables the button
    And the system executes the $pascalName UseCase in the Domain layer
    And upon receiving a successful response, updates the UI to Success state
    And displays a localized confirmation message
```

### User Story 2: Network Degradation & Offline Failure Path
```gherkin
  Scenario: Network Disconnection or Timeout
    Given the user is on the $pascalName screen
    When the device loses network connectivity or server times out
    And the user attempts an action
    Then the Data Layer maps the DioException to NetworkFailure
    And the Cubit emits the Failure state with a user-friendly localized message
    And the UI displays an AppErrorWidget with a "Retry" CTA
```

---

## 3. 🏛️ Technical Architecture & Code Scheme Breakdown

```
features/$featureName/
├── domain/                      # LAYER 1: Pure Dart Business Logic
│   ├── entities/                # Pure immutable entities extending Equatable
│   │   └── ${featureName}_entity.dart
│   ├── repos/                   # Abstract Repository contract (ResultFuture<T>)
│   │   └── ${featureName}_repository.dart
│   └── usecases/                # Single-responsibility UseCases (@lazySingleton)
│       └── get_${featureName}_details_usecase.dart
│
├── data/                        # LAYER 2: Data Retrieval & Mapping
│   ├── data_sources/            # Retrofit REST API interface (@RestApi())
│   │   └── ${featureName}_remote_data_source.dart
│   ├── models/                  # @JsonSerializable models with copyWith & toEntity()
│   │   └── ${featureName}_model.dart
│   └── repos/                   # Concrete repository implementation (@LazySingleton)
│       └── ${featureName}_repository_impl.dart
│
└── presentation/                # LAYER 3: Reactive State & Adaptive UI
    ├── logic/
    │   └── cubits/              # Cubit with Freezed states (*_cubit.dart, *_state.dart)
    │       ├── ${featureName}_cubit.dart
    │       └── ${featureName}_state.dart
    ├── screens/                 # Screen widget class (ResponsiveLayout)
    │   └── ${featureName}_screen.dart
    └── widgets/                 # Sub-widgets (ONE widget class per file)
        └── ${featureName}_content_widget.dart
```

### 3.1 SOLID Principles Applied
1. **Single Responsibility (SRP)**: Each UseCase handles exactly one action. Widgets are isolated into dedicated single-responsibility classes.
2. **Open/Closed (OCP)**: Data Sources and Repositories are defined as abstract contracts so new local or mock implementations can be added without modifying domain code.
3. **Liskov Substitution (LSP)**: All Repository implementations fulfill the `Future<Result<T, Failure>>` contract.
4. **Interface Segregation (ISP)**: Interfaces are lean and focused on $pascalName operations.
5. **Dependency Inversion (DIP)**: Presentation depends on Domain UseCases; Domain depends on abstract Repositories; dependencies are resolved via `@injectable` and GetIt.

---

## 4. 🌐 API Contracts & Data Schema

### 4.1 Primary Endpoint Contract
* **Endpoint**: `POST /api/v1/$featureName/process`
* **Headers**:
  * `Authorization: Bearer <JWT_ACCESS_TOKEN>`
  * `X-Idempotency-Key: <UUIDv4>`
  * `Content-Type: application/json`

### 4.2 Request JSON Payload
```json
{
  "id": "req_100293",
  "action": "execute",
  "timestamp": "2026-09-01T10:00:00Z"
}
```

### 4.3 Response JSON Payload (200 OK)
```json
{
  "status": "success",
  "code": 200,
  "data": {
    "id": "res_88291",
    "title": "Operation completed successfully",
    "updated_at": "2026-09-01T10:00:01Z"
  }
}
```

---

## 5. 🛡️ Error Handling & Domain Failure Mapping

| Infrastructure / Network Event | Data Layer DTO | Domain Layer Failure | Presentation UI Display (context.l10n) |
| :--- | :--- | :--- | :--- |
| HTTP 401 Unauthorized | `ApiErrorModel(status: 401)` | `UnauthorizedFailure` | Redirect to login with session expired alert |
| HTTP 422 Validation Error | `ApiErrorModel(status: 422)` | `ValidationFailure` | Red inline form error under relevant field |
| HTTP 500 / 503 Server Error | `ApiErrorModel(status: 500)` | `ServerFailure` | `AppErrorWidget` with retry button |
| SocketException / Timeout | `DioExceptionType.connectionTimeout` | `NetworkFailure` | "Please check your internet connection" banner |

---

## 6. 🔒 Non-Functional Requirements & Security

* 🔐 **Token Security**: Tokens are accessed strictly through `FlutterSecureStorage` with hardware-backed encryption (`AndroidOptions(encryptedSharedPreferences: true)`).
* 🙈 **App Switcher Privacy**: Sensitive views are automatically obscured with `PrivacyScreenOverlay` on backgrounding.
* ⚡ **Performance & Frame Rate**: Strict `const` constructors on all leaf nodes, `BlocSelector` rebuild scoping, and 60/120fps smooth animations.
* 🧹 **Zero Memory Leaks**: Mandatory disposal of all controllers, focus nodes, and stream subscriptions in `dispose()`.

---

## 7. 🧪 3-Tier Testing & QA Verification Matrix

| Test Tier | Scope | Framework / Tool | Coverage Target |
| :--- | :--- | :--- | :--- |
| **Unit Tests (Domain & State)** | UseCases, Repositories, Cubit state machines | `flutter_test`, `bloc_test`, `mocktail` | > 90% logic coverage |
| **Widget Tests (UI)** | Screen rendering, phone/tablet viewports, button clicks | `flutter_test`, `WidgetTester` | 100% critical user paths |
| **End-to-End Integration Tests** | Full app execution, form fill to navigation | `integration_test` | Complete Happy Path Flow |

---
''';

  final mdFile = File('${featureDocsDir.path}/${featureName}_prd_and_architecture.md');
  mdFile.writeAsStringSync(mdContent);
  print('✅ Markdown PRD created: ${mdFile.path}');

  // 2. Generate Styled HTML
  final htmlContent = '''<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$pascalName — Product Requirements & Architecture Blueprint</title>
<style>
  @page {
    size: A4;
    margin: 18mm 16mm 18mm 16mm;
  }
  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    color: #1e293b;
    background-color: #ffffff;
    line-height: 1.55;
    font-size: 11.5pt;
    margin: 0;
    padding: 24px;
  }
  h1 {
    color: #0f172a;
    font-size: 22pt;
    margin-bottom: 4px;
    border-bottom: 2px solid #3b82f6;
    padding-bottom: 8px;
  }
  h2 {
    color: #1e3a8a;
    font-size: 14pt;
    margin-top: 24px;
    margin-bottom: 8px;
    border-bottom: 1px solid #e2e8f0;
    padding-bottom: 4px;
    page-break-after: avoid;
  }
  h3 {
    color: #2563eb;
    font-size: 12pt;
    margin-top: 16px;
    margin-bottom: 6px;
    page-break-after: avoid;
  }
  .meta-box {
    background-color: #f8fafc;
    border-left: 4px solid #3b82f6;
    padding: 10px 14px;
    margin-bottom: 20px;
    font-size: 10.5pt;
    color: #475569;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin: 14px 0;
    font-size: 10pt;
    page-break-inside: avoid;
  }
  th, td {
    border: 1px solid #cbd5e1;
    padding: 8px 10px;
    text-align: left;
  }
  th {
    background-color: #f1f5f9;
    font-weight: 600;
    color: #0f172a;
  }
  pre, code {
    font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace;
    font-size: 9.5pt;
  }
  pre {
    background-color: #0f172a;
    color: #f8fafc;
    padding: 12px;
    border-radius: 6px;
    overflow-x: auto;
    page-break-inside: avoid;
  }
  p, li {
    color: #334155;
  }
  .badge {
    display: inline-block;
    padding: 2px 8px;
    border-radius: 4px;
    font-size: 9pt;
    font-weight: bold;
    background-color: #dbeafe;
    color: #1d4ed8;
  }
</style>
</head>
<body>
  <h1>📋 Product Requirements Document (PRD) & Architecture Blueprint</h1>
  <div class="meta-box">
    <strong>Feature</strong>: $pascalName &nbsp;|&nbsp; <strong>Domain</strong>: Enterprise Mobile &nbsp;|&nbsp; <strong>Author</strong>: Senior PM & Principal Architect &nbsp;|&nbsp; <strong>Date</strong>: $dateStr
  </div>

  <h2>1. 🎯 Executive Summary & Product Vision</h2>
  <p><strong>Problem Statement:</strong> In modern enterprise mobile applications, friction in the <strong>$pascalName</strong> experience directly increases user abandonment, elevates support tickets, and hinders conversion. Users require a seamless, intuitive, and highly responsive interface that guarantees data privacy, resilient network handling, and clear feedback across all device form factors.</p>
  <p><strong>Value Proposition:</strong> The $pascalName module provides an enterprise-grade experience adhering to strict security, Clean Architecture, and platform-adaptive design. It streamlines the user journey while enforcing zero data leaks and resilient offline caching.</p>
  <p><strong>Core Success Metrics (KPIs):</strong> Completion Rate > 98.5%, Time-to-Interactive < 600ms, Crash-Free Sessions > 99.9%, 100% Arabic & English coverage.</p>

  <h2>2. 👥 User Journeys & Acceptance Criteria (Gherkin Scenarios)</h2>
  <pre>Feature: $pascalName Primary Flow
  Scenario: Successful submission and state transition
    Given the user opens the $pascalName screen
    When the user fills the required inputs with valid data
    And taps the primary action button
    Then the system displays a loading indicator and disables the button
    And executes the $pascalName UseCase in the Domain layer
    And updates the UI to Success state upon receiving a valid response</pre>

  <h2>3. 🏛️ Technical Architecture & Code Scheme Breakdown</h2>
  <table>
    <tr><th>Layer</th><th>Component</th><th>Responsibility & Pattern</th></tr>
    <tr><td><strong>Domain</strong></td><td><code>${pascalName}Entity</code></td><td>Pure Dart business model extending Equatable. Zero UI / HTTP dependencies.</td></tr>
    <tr><td><strong>Domain</strong></td><td><code>${pascalName}Repository</code></td><td>Abstract contract returning <code>ResultFuture&lt;${pascalName}Entity&gt;</code>.</td></tr>
    <tr><td><strong>Domain</strong></td><td><code>Get${pascalName}DetailsUseCase</code></td><td>Discrete single-responsibility UseCase decorated with <code>@lazySingleton</code>.</td></tr>
    <tr><td><strong>Data</strong></td><td><code>${pascalName}RemoteDataSource</code></td><td>Retrofit interface (<code>@RestApi()</code>) performing Dio network requests.</td></tr>
    <tr><td><strong>Data</strong></td><td><code>${pascalName}Model</code></td><td><code>@JsonSerializable</code> DTO with <code>copyWith</code> and <code>toEntity()</code>.</td></tr>
    <tr><td><strong>Data</strong></td><td><code>${pascalName}RepositoryImpl</code></td><td>Maps <code>DioException</code> to Domain <code>Failure</code> (ServerFailure, NetworkFailure).</td></tr>
    <tr><td><strong>Presentation</strong></td><td><code>${pascalName}Cubit</code></td><td>State machine injecting UseCase; emits Freezed immutable union states.</td></tr>
    <tr><td><strong>Presentation</strong></td><td><code>${pascalName}Screen</code></td><td>ResponsiveLayout supporting Phone, Tablet (Rail), and Desktop (Sidebar).</td></tr>
  </table>

  <h2>4. 🌐 API Contracts & Data Schema</h2>
  <pre>POST /api/v1/$featureName/process
Headers:
  Authorization: Bearer &lt;JWT_TOKEN&gt;
  X-Idempotency-Key: &lt;UUIDv4&gt;

Request:
{
  "id": "req_100293",
  "action": "execute",
  "timestamp": "2026-09-01T10:00:00Z"
}

Response (200 OK):
{
  "status": "success",
  "data": { "id": "res_88291", "title": "Operation completed" }
}</pre>

  <h2>5. 🛡️ Error Handling & Domain Failure Mapping</h2>
  <table>
    <tr><th>HTTP / Infrastructure Error</th><th>Domain Failure</th><th>Presentation UI Display</th></tr>
    <tr><td>401 Unauthorized</td><td><code>UnauthorizedFailure</code></td><td>Session expired dialog with re-login CTA</td></tr>
    <tr><td>422 Validation Error</td><td><code>ValidationFailure</code></td><td>Inline field error text (context.l10n)</td></tr>
    <tr><td>500 / 504 Server Error</td><td><code>ServerFailure</code></td><td>AppErrorWidget with retry CTA</td></tr>
    <tr><td>Network Timeout / SocketException</td><td><code>NetworkFailure</code></td><td>Offline banner with auto-reconnect</td></tr>
  </table>

  <h2>6. 🔒 Non-Functional Requirements & Security</h2>
  <ul>
    <li><strong>Hardware Security</strong>: Tokens stored with <code>FlutterSecureStorage</code> hardware encryption.</li>
    <li><strong>Privacy Overlay</strong>: <code>PrivacyScreenOverlay</code> obscuring sensitive screens in App Switcher.</li>
    <li><strong>Performance</strong>: <code>const</code> constructors, scoped <code>BlocSelector</code> rebuilds, 60/120fps.</li>
    <li><strong>Localization</strong>: Context-Aware AR/EN with zero hardcoded user-facing strings.</li>
  </ul>

  <h2>7. 🧪 3-Tier Testing Matrix</h2>
  <table>
    <tr><th>Tier</th><th>Target</th><th>Tools</th></tr>
    <tr><td><strong>Unit Tests</strong></td><td>UseCases, Repositories, Cubits</td><td><code>bloc_test</code>, <code>mocktail</code></td></tr>
    <tr><td><strong>Widget Tests</strong></td><td>Screens, Form elements, Atoms</td><td><code>WidgetTester</code></td></tr>
    <tr><td><strong>E2E Integration</strong></td><td>Full user journey</td><td><code>integration_test</code></td></tr>
  </table>
</body>
</html>
''';

  final htmlFile = File('${featureDocsDir.path}/${featureName}_prd_and_architecture.html');
  htmlFile.writeAsStringSync(htmlContent);
  print('✅ Printable HTML created: ${htmlFile.path}');

  // 3. Convert to PDF using Headless Edge or Chrome
  final pdfPath = '${featureDocsDir.path}/${featureName}_prd_and_architecture.pdf';
  final absoluteHtmlPath = htmlFile.absolute.path;
  final absolutePdfPath = File(pdfPath).absolute.path;

  print('⚡ Rendering PDF document via headless engine...');

  final browserPaths = [
    r'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe',
    r'C:\Program Files\Microsoft\Edge\Application\msedge.exe',
    r'C:\Program Files\Google\Chrome\Application\chrome.exe',
    r'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe',
    '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    '/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge',
    '/usr/bin/google-chrome',
    '/usr/bin/chromium-browser',
  ];

  String? foundBrowser;
  for (final bPath in browserPaths) {
    if (File(bPath).existsSync()) {
      foundBrowser = bPath;
      break;
    }
  }

  if (foundBrowser != null) {
    try {
      final result = Process.runSync(foundBrowser, [
        '--headless',
        '--disable-gpu',
        '--no-pdf-header-footer',
        '--print-to-pdf=$absolutePdfPath',
        absoluteHtmlPath,
      ]);

      if (result.exitCode == 0 && File(pdfPath).existsSync()) {
        print('🎉 PDF Generated Successfully: $absolutePdfPath');
      } else {
        print('⚠️ Headless PDF generation warning: ${result.stderr}');
      }
    } catch (e) {
      print('⚠️ Could not run headless browser: $e');
    }
  } else {
    print('ℹ️ Note: Headless browser not found. HTML and Markdown documents are ready in ${featureDocsDir.path}');
  }

  print('\n============================================================');
  print('📊 Documentation Generation Summary:');
  print('  - Feature: $pascalName');
  print('  - Markdown PRD: ${mdFile.path}');
  print('  - HTML Document: ${htmlFile.path}');
  if (File(pdfPath).existsSync()) {
    print('  - 📕 PDF Blueprint: $pdfPath');
  }
  print('============================================================\n');
}
