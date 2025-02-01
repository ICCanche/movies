
import 'package:movies/src/core/utils/typedef.dart';

/// UseCaseParams is the common use case class that when it is implemented
/// it will request for params
///
/// UseCase it is used when the use case should not expect any parameter
///
abstract class UseCaseParams<Type, Params> {
  const UseCaseParams();

  ResultFuture<Type> call(Params params);
}

abstract class UseCase<Type> {
  const UseCase();

  ResultFuture<Type> call();
}