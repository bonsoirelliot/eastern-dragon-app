class ResponseParseException implements Exception {
  ResponseParseException([
    this._message,
    StackTrace? stackTrace,
    this.data,
  ]) : stackTrace = stackTrace ?? StackTrace.current;

  late final String? _message;

  final StackTrace? stackTrace;

  final Map<String, dynamic>? data;

  @override
  String toString() => _message ?? 'ResponseParseExeption';
}
