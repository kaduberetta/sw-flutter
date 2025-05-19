class ApiException implements Exception {
  final String message;
  final int? code;

  ApiException(this.message, {this.code});

  @override
  String toString() => 'ApiException(code: $code, message: $message)';
}

class BadRequestException extends ApiException {
  BadRequestException(super.message, {super.code});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message, {super.code});
}

class NotFoundException extends ApiException {
  NotFoundException(super.message, {super.code});
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(super.message, {super.code});
}

class NetworkException extends ApiException {
  NetworkException(super.message, {super.code});
}
