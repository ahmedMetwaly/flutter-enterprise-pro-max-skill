# Claude Code Project Guidelines - Flutter Enterprise Pro Max

## Architecture & Code Standards
- Framework: Flutter with Clean Architecture (Domain, Data, Presentation).
- State Management: Cubit with Freezed for States.
- Dependency Injection: GetIt + Injectable.
- Networking: Dio + Retrofit (*_data_source.dart).
- Testing: TDD with mocktail and bloc_test.

## UI/UX Rules
- One widget per file as a StatelessWidget / StatefulWidget class. Never use helper functions returning Widgets.
- ScreenUtil for all dimensions (.w, .h, .sp, .r).
- Use design tokens from `core/theme/` and apply category-based visual styling.
