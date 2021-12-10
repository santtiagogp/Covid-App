class CovidException implements Exception {
  CovidException({
    this.status = 0,
    required this.message,
  });
  final String message;
  final int status;

  @override
  String toString() => message;
}