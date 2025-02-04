import 'api_exception.dart';
import 'failure.dart';

/// *
///
/// ApiFailure
///
/// it implements Failure and it is used to convert network error to a common
/// object that it is used in the domain and presentation layer

class ApiFailure extends Failure {
  const ApiFailure(super.message, super.statusCode);

  ApiFailure.fromException(ApiException exception) :
        this(exception.message, exception.statusCode);
}
