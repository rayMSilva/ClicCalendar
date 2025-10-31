class BaseException implements Exception {
  final String message;
  final String code;

  BaseException({
    required this.message,
    required this.code,
  });
}
