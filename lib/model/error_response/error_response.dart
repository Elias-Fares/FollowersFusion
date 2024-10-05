class ErrorResponse {
  bool? status;
  List<dynamic>? messages;
  String? message;
  int? code;

  ErrorResponse({this.status, this.messages, this.message, this.code});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if(json['messages'] != null ){
      messages = json['messages'];
    } else {
      messages = [];
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messages'] = messages;
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}