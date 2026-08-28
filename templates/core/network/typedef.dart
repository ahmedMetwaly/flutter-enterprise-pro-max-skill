import 'package:dartz/dartz.dart';
import 'api_error_model.dart';

typedef ResultFuture<T> = Future<Either<ApiErrorModel, T>>;
typedef ResultVoid = ResultFuture<void>;
