import 'package:equatable/equatable.dart';

/*
* Failure.dart
*
* Common abstract class that represent an error from the remote api, it is used
* in the repositories, use cases and presentation
*
* */

abstract class Failure extends Equatable {
  const Failure(this.message, this.statusCode);

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}