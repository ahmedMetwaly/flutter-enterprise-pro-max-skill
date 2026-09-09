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

  T? get dataOrNull => this is Success<T, E> ? (this as Success<T, E>).data : null;
  E? get errorOrNull => this is Error<T, E> ? (this as Error<T, E>).error : null;
}

class Success<T, E> extends Result<T, E> {
  final T data;
  const Success(this.data);
}

class Error<T, E> extends Result<T, E> {
  final E error;
  const Error(this.error);
}
