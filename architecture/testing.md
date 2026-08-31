# 🧪 Enterprise Flutter Testing Pyramid & Strategy

Enterprise quality requires a multi-layered testing pyramid covering pure business logic, data mapping, state machines, widget rendering, and end-to-end integration.

---

## 1. 📐 The Enterprise Testing Pyramid

```
                ┌───────────────┐
                │  Integration  │  ~10% (End-to-End User Journeys)
                ├───────────────┤
                │ Widget / UI   │  ~20% (Component & Screen Rendering)
                ├───────────────┤
                │ State Machine │  ~30% (Cubit / Bloc / Notifier)
                ├───────────────┤
                │ Domain & Repo │  ~40% (UseCases, Mappers, Repositories)
                └───────────────┘
```

---

## 2. 🧪 Level 1: Domain & UseCase Tests (`test/features/<feature>/domain/...`)

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepo;
  late LoginUseCase useCase;

  setUp(() {
    mockRepo = MockAuthRepository();
    useCase = LoginUseCase(mockRepo);
  });

  test('should return token when repository call succeeds', () async {
    when(() => mockRepo.login(email: 'test@example.com', password: '123'))
        .thenAnswer((_) async => const Success('token_123'));

    final result = await useCase(email: 'test@example.com', password: '123');

    expect(result.isSuccess, isTrue);
    verify(() => mockRepo.login(email: 'test@example.com', password: '123')).called(1);
  });
}
```

---

## 3. 🧪 Level 2: Cubit / Notifier Unit Tests (`test/features/<feature>/presentation/...`)

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginCubit loginCubit;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginCubit = LoginCubit(mockLoginUseCase);
  });

  tearDown(() => loginCubit.close());

  test('initial state is LoginInitial', () {
    expect(loginCubit.state, equals(const LoginState.initial()));
  });

  blocTest<LoginCubit, LoginState>(
    'emits [loading, success] when login succeeds',
    build: () => LoginCubit(mockLoginUseCase),
    setUp: () {
      when(() => mockLoginUseCase(email: 'test@example.com', password: '123'))
          .thenAnswer((_) async => const Success('token_123'));
    },
    act: (cubit) => cubit.login(email: 'test@example.com', password: '123'),
    expect: () => [
      const LoginState.loading(),
      const LoginState.success('token_123'),
    ],
    verify: (_) {
      verify(() => mockLoginUseCase(email: 'test@example.com', password: '123')).called(1);
    },
  );
}
```

---

## 4. 🧪 Level 3: Widget Tests (`test/features/<feature>/presentation/widgets/...`)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppButton renders loading spinner when isLoading is true', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppButton(
            text: 'Submit',
            isLoading: true,
            onPressed: null,
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Submit'), findsNothing);
  });
}
```

---

## 5. 🧪 Level 4: Integration / E2E Tests (`integration_test/<feature>_flow_test.dart`)

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:your_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full Login Flow Test', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final emailField = find.byKey(const Key('email_field'));
    final passwordField = find.byKey(const Key('password_field'));
    final loginButton = find.byKey(const Key('login_button'));

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password123');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
```
