# 📋 Enterprise Feature Documentation & PM PRD Guide

This guide establishes the standard for generating **10-Year Senior Product Manager + Principal Software Architect** documentation for any feature in the Flutter Enterprise Pro Max framework.

Whenever a user requests `"document feature <name>"`, `"generate PRD for <name>"`, or `"اعملى documentation <feature_name>"`, the AI Agent must follow this comprehensive schema and save both Markdown and PDF files in `lib/features/<feature_name>/docs/`.

---

## 1. 🎯 Documentation Architecture & Scheme

Every feature documentation document combines **Product Strategy (Product Manager Perspective)** with **Technical Excellence (Enterprise Software Architect Perspective)**:

```
lib/features/<feature_name>/docs/
├── <feature_name>_prd_and_architecture.md   # Executive PRD & Technical Blueprint
├── <feature_name>_prd_and_architecture.html # Formatted Printable HTML with styling
└── <feature_name>_prd_and_architecture.pdf  # Auto-generated PDF Document
```

---

## 2. 📑 Required Document Structure (The 7 Sections)

### Section 1: Executive Summary & Product Vision
- **Feature Name & Domain Area**: (e.g. `Authentication & Biometric Authorization` in `Fintech`).
- **Problem Statement**: What friction or user pain point does this feature solve?
- **Value Proposition**: Business justification and strategic goals.
- **Target Personas**: Detailed user archetypes (e.g. Retail customer, Corporate admin).
- **Core Success Metrics (KPIs)**: Quantifiable outcomes (e.g. Conversion rate +15%, Login latency < 800ms, Auth drop-off < 1%).

### Section 2: User Journeys & Acceptance Criteria (Gherkin Syntax)
- **User Stories**: `As a [user], I want to [action], so that [business value]`.
- **Gherkin Scenarios**:
  ```gherkin
  Scenario: Successful Login with Valid Credentials
    Given the user is on the Login Screen
    When the user enters a valid email and password
    And taps the "Login" button
    Then the system displays the loading indicator
    And securely stores the access and refresh tokens in Hardware Secure Storage
    And navigates the user to the Dashboard Screen
  ```
- **Edge Cases & Failure Scenarios**:
  - Invalid credentials, network disconnection, account lockout, expired session.

### Section 3: Technical Architecture & Code Scheme Breakdown
Detailed walkthrough of the feature's 3 Clean Architecture layers:
1. **Domain Layer (Pure Dart Business Logic)**:
   - `entities/<feature>_entity.dart`: Pure immutable data classes extending `Equatable`.
   - `repos/<feature>_repository.dart`: Abstract contract returning `ResultFuture<T> = Future<Either<Failure, T>>`.
   - `usecases/<action>_usecase.dart`: Discrete single-responsibility UseCases decorated with `@lazySingleton`.
2. **Data Layer (Data Ingestion & Mapping)**:
   - `data_sources/<feature>_remote_data_source.dart`: Retrofit interface (`@RestApi()`).
   - `models/<feature>_model.dart`: `@JsonSerializable` DTOs with manual `copyWith` and `toEntity()` mappers.
   - `repos/<feature>_repository_impl.dart`: Concrete implementation mapping `DioException` / `ApiErrorModel` into domain `Failure`s.
3. **Presentation Layer (Reactive State & Adaptive UI)**:
   - `logic/cubits/<feature>_state.dart`: `@freezed` union states (`initial`, `loading`, `success`, `failure`).
   - `logic/cubits/<feature>_cubit.dart`: State machine injecting discrete UseCases.
   - `screens/<feature>_screen.dart`: Adaptive screen supporting `ResponsiveLayout` (Phone, Tablet, Desktop).
   - `widgets/<sub_widgets>.dart`: Dedicated widget classes (ONE widget class per file).

### Section 4: API Contracts & Schema Mapping
- **Endpoints & Methods**: `POST /api/v1/auth/login`, `GET /api/v1/user/profile`.
- **Headers**: `Authorization: Bearer <token>`, `X-Idempotency-Key: <uuid>`.
- **Request Payload Schema**:
  ```json
  {
    "email": "user@example.com",
    "password": "securePassword123"
  }
  ```
- **Response Payload Schema (200 OK)**:
  ```json
  {
    "success": true,
    "data": {
      "token": "jwt_token_example",
      "user_id": "usr_99881"
    }
  }
  ```
- **Error Response Schema (401 / 422 / 500)**:
  ```json
  {
    "status_code": 401,
    "message": "Invalid email or password",
    "error_code": "AUTH_INVALID_CREDENTIALS"
  }
  ```

### Section 5: Error Handling & Failure Mapping Pipeline
- Mapping from infrastructure errors to Domain `Failure`s:
  - HTTP 401 / 403 ➔ `UnauthorizedFailure`
  - HTTP 422 ➔ `ValidationFailure`
  - HTTP 500 / 502 / 504 ➔ `ServerFailure`
  - No connection / Timeout ➔ `NetworkFailure`
- Presentation mapping: Cubit maps `Failure` into localized UI message (`context.l10n.<key>`).

### Section 6: Non-Functional Requirements & Security
- **Security & Privacy**:
  - Hardware-level encryption via `FlutterSecureStorage` (`AndroidOptions(encryptedSharedPreferences: true)`).
  - App switcher protection via `PrivacyScreenOverlay`.
  - Zero plain-text token caching.
- **Performance Standards**:
  - `const` constructors on all leaf widgets.
  - Granular rebuild scoping with `BlocSelector`.
  - Frame budget: 60fps / 120fps with zero UI stutter.
  - Memory leak prevention: strict controller and subscription disposal in `dispose()`.
- **Accessibility & Localization**:
  - Context-Aware AR/EN localization.
  - Accessible semantics with minimum 48x48dp touch targets.

### Section 7: 3-Tier Testing & QA Verification Plan
1. **Unit Tests (`test/features/<feature>/...`)**:
   - UseCases with mocked Repositories.
   - Cubits with `bloc_test` and `mocktail` verifying state transitions and `.called(1)`.
2. **Widget Tests (`test/features/<feature>/presentation/...`)**:
   - Screen rendering in Phone and Tablet viewports.
   - Form interaction, button click, loading state, error display.
3. **Integration E2E Tests (`integration_test/<feature>_flow_test.dart`)**:
   - End-to-end user journey test from screen launch to navigation.

---

## 3. 📄 Automated PDF Export Pipeline

When generating documentation, the CLI/Agent creates an HTML file with an embedded print stylesheet and converts it to PDF using headless Chrome/Edge:

```bash
# Generate documentation & PDF for a feature
dart bin/doc.dart auth
```

The script automatically executes:
1. Markdown generation: `lib/features/<feature>/docs/<feature>_prd_and_architecture.md`.
2. Printable HTML styling: `lib/features/<feature>/docs/<feature>_prd_and_architecture.html`.
3. PDF generation: `lib/features/<feature>/docs/<feature>_prd_and_architecture.pdf`.
