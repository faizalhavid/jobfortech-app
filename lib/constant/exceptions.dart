class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);
  @override
  String toString() => message;
}

class UnauthorisedException implements Exception {
  final String message;
  UnauthorisedException(this.message);
  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
  @override
  String toString() => message;
}

class ConflictException implements Exception {
  final String message;
  ConflictException(this.message);
  @override
  String toString() => message;
}

class InternalServerErrorException implements Exception {
  final String message;
  InternalServerErrorException(this.message);
  @override
  String toString() => message;
}

class ServiceUnavailableException implements Exception {
  final String message;
  ServiceUnavailableException(this.message);
  @override
  String toString() => message;
}

class GatewayTimeoutException implements Exception {
  final String message;
  GatewayTimeoutException(this.message);
  @override
  String toString() => message;
}

class UnknownException implements Exception {
  final String message;
  UnknownException(this.message);
  @override
  String toString() => message;
}

class NoInternetException implements Exception {
  final String message;
  NoInternetException(this.message);
  @override
  String toString() => message;
}

class NoServiceFoundException implements Exception {
  final String message;
  NoServiceFoundException(this.message);
  @override
  String toString() => message;
}

class InvalidFormatException implements Exception {
  final String message;
  InvalidFormatException(this.message);
  @override
  String toString() => message;
}

class InvalidInputException implements Exception {
  final String message;
  InvalidInputException(this.message);
  @override
  String toString() => message;
}
