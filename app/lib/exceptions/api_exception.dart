class ApiException implements Exception {
  final String message;
  final String? devDetails;
  final String? prettyDetails;

  ApiException({
    required this.message,
    this.devDetails,
    this.prettyDetails,
  });

  @override
  String toString() {
    return 'ApiException: $message ${devDetails != null ? '- $devDetails' : ''}';
  }
}
