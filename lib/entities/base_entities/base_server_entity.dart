class BaseServerEntity<T> {
  final List? messages;
  final T? data;
  final bool loading;

  BaseServerEntity({this.messages, this.data, this.loading = false});
}
