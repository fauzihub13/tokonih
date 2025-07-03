class Failure {

  final String? message;
  final int? code;
  final Exception? exception;
  final StackTrace? stackTrace;

  Failure({this.message, this.code, this.exception, this.stackTrace});
}