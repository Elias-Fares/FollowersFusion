class ServerException implements Exception {
  List<dynamic>? error;
  ServerException({this.error});
}