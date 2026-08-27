# GitHub Copilot Custom Instructions for Flutter Enterprise Pro Max

- Architecture: Clean Architecture + Feature-First.
- Platform UI: Material 3 for Android/Desktop and Cupertino for iOS/macOS.
- Responsiveness: ResponsiveLayout (<600 phone, 600-1024 tablet, >1024 desktop).
- Always use Widget classes in separate files. Do not generate widget helper methods.
- State Management: Cubit only. States must use `@freezed`.
- Models: Use `@JsonSerializable(explicitToJson: true)`, manual `copyWith`, and Dart Extensions.
- Networking: Dio with Retrofit.
- Use `flutter_screenutil` for sizes and `AppColors` for design tokens.
