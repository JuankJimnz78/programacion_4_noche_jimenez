// lib/core/error/api_exception.dart
//
// Copiado tal cual de tu proyecto PreciosEC (lib/core/error/api_exception.dart).
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  const ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;
}
