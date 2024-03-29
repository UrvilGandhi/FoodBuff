class FetchDataException implements Exception {
  final _message;

  // ignore: sort_constructors_first
  FetchDataException([this._message]);

  @override
  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}