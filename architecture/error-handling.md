# 🛡️ Enterprise Error Handling & Domain Isolation Guide

In Clean Architecture, error handling must maintain strict layer separation. The **Domain Layer** must remain completely isolated from infrastructure, HTTP status codes, and third-party networking clients.

---

## 1. 🏗️ Layer Separation Workflow

```
[Remote Server / Database]
          │
          ▼
[Data Layer: DataSource]
   • Throws typed Exceptions (e.g. ServerException, CacheException, NoInternetException)
          │
          ▼
[Data Layer: Repository Implementation]
   • Catches Exceptions / DioException
   • Maps them to Domain `Failure` instances
          │
          ▼
[Domain Layer: UseCase]
   • Returns `Result<T, Failure>` or `Either<Failure, T>`
          │
          ▼
[Presentation Layer: Cubit / Notifier]
   • Matches Failure pattern
   • Emits UI State with user-friendly localized message
```

---

## 2. 🧱 Pure Domain Failure Hierarchy (`core/errors/failure.dart`)

```dart
sealed class Failure {
  final String message;
  final String? code;
  const Failure({required this.message, this.code});
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({required super.message, super.code, this.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message, super.code});
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.code});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.code});
}
```

---

## 3. 🎯 Result Type Support (`core/network/result.dart`)

The system supports both Dart 3 Sealed Class Result and Functional Either:

### Sealed Result Pattern (Modern Dart 3 Native):
```dart
sealed class Result<T, E> {
  const Result();

  R when<R>({
    required R Function(T data) success,
    required R Function(E error) failure,
  }) {
    if (this is Success<T, E>) {
      return success((this as Success<T, E>).data);
    } else if (this is Error<T, E>) {
      return failure((this as Error<T, E>).error);
    }
    throw StateError('Unhandled Result subtype');
  }

  bool get isSuccess => this is Success<T, E>;
  bool get isFailure => this is Error<T, E>;
}

class Success<T, E> extends Result<T, E> {
  final T data;
  const Success(this.data);
}

class Error<T, E> extends Result<T, E> {
  final E error;
  const Error(this.error);
}
```

### Functional Either Pattern (`package:dartz` or `package:fpdart`):
```dart
typedef ResultFuture<T> = Future<Either<Failure, T>>;
```
