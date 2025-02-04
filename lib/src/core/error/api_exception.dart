import 'package:equatable/equatable.dart';

/// ApiException
///
/// it is the class that we use in the only in the remote data source from
/// the network errors
///
///
class ApiException extends Equatable implements Exception {
  const ApiException({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
