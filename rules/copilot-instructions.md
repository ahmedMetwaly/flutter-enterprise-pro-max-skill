# GitHub Copilot Custom Instructions for Flutter Enterprise Pro Max

- Architecture: Clean Architecture + Feature-First.
- Always use Widget classes in separate files. Do not generate widget helper methods.
- State Management: Cubit only. States must use `@freezed`.
- Models: Use `@JsonSerializable(explicitToJson: true)`, manual `copyWith`, and Dart Extensions.
- Networking: Dio with Retrofit.
- Use `flutter_screenutil` for sizes and `AppColors` for design tokens.
