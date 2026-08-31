# 🔄 State Management Architecture & Implementation Guide

This guide details the supported State Management solutions in Flutter Enterprise Pro Max v2, their architecture conventions, code patterns, and testing strategies.

---

## 1. 🌟 Solution Comparison

| Solution | Best Use Case | Boilerplate | Testing Strategy | Learning Curve |
| :--- | :--- | :--- | :--- | :--- |
| **Cubit** | Clean Architecture, Enterprise apps, Banking | Low | `bloc_test` + `mocktail` | Low / Medium |
| **Bloc** | Event-driven apps, Complex event stream transforms | Medium | `bloc_test` + `mocktail` | Medium |
| **Riverpod** | Reactive apps, Web/Desktop, Fast DI | Low / Medium | `ProviderContainer` overrides | Medium / High |
| **Provider** | Simpler apps, Existing legacy codebases | Low | `ChangeNotifier` testing | Low |
| **Signals** | Fine-grained reactive primitives | Very Low | Signal value listeners | Low |

---

## 2. 🏛️ Solution 1: Cubit + Freezed States

### Structure:
```
presentation/
└── logic/
    └── cubits/
        ├── auth_cubit.dart
        └── auth_state.dart
```

### State Definition (`auth_state.dart`):
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success(String token) = _Success;
  const factory AuthState.failure(String message) = _Failure;
}
```

### Cubit Implementation (`auth_cubit.dart`):
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;

  AuthCubit(this._loginUseCase) : super(const AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(email: email, password: password);
    result.when(
      success: (token) => emit(AuthState.success(token)),
      failure: (failure) => emit(AuthState.failure(failure.message)),
    );
  }
}
```

### Testing Pattern:
```dart
blocTest<AuthCubit, AuthState>(
  'emits [loading, success] on valid credentials',
  build: () => AuthCubit(mockLoginUseCase),
  setUp: () {
    when(() => mockLoginUseCase(email: tEmail, password: tPassword))
        .thenAnswer((_) async => const Success('dummy_token'));
  },
  act: (cubit) => cubit.login(email: tEmail, password: tPassword),
  expect: () => [
    const AuthState.loading(),
    const AuthState.success('dummy_token'),
  ],
  verify: (_) {
    verify(() => mockLoginUseCase(email: tEmail, password: tPassword)).called(1);
  },
);
```

---

## 3. 🌊 Solution 2: Riverpod (AsyncNotifier)

### Structure:
```
presentation/
└── logic/
    └── notifiers/
        ├── auth_notifier.dart
        └── auth_state.dart
```

### Notifier Implementation:
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<String?> build() => null;

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(loginUseCaseProvider);
    final result = await useCase(email: email, password: password);
    result.when(
      success: (token) => state = AsyncValue.data(token),
      failure: (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
    );
  }
}
```

### Testing Pattern:
```dart
test('Riverpod AuthNotifier login flow', () async {
  final container = ProviderContainer(
    overrides: [
      loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
    ],
  );
  addTearDown(container.dispose);

  when(() => mockLoginUseCase(email: tEmail, password: tPassword))
      .thenAnswer((_) async => const Success('dummy_token'));

  final notifier = container.read(authNotifierProvider.notifier);
  await notifier.login(email: tEmail, password: tPassword);

  expect(container.read(authNotifierProvider), const AsyncValue.data('dummy_token'));
});
```
