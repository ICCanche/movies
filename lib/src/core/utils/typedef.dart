import 'package:dartz/dartz.dart';
import 'package:movies/src/core/error/failure.dart';

/// Uses dartz to return a custom RIGHT, LEFT Future results
/// ResultFuture can return either a failure or a T
/// ResultVoid it is launched without returning any type
///

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid<T> =  ResultFuture<void>;