class ResponseData {
  int status;
  final String message;
  Map<String, dynamic> data;
  ResponseData({
    this.status,
    this.message,
    this.data,
  });
  factory ResponseData.fromJson(Map<String, dynamic> data) => ResponseData(
        status: data['status'],
        message: data['message'],
        data: data['data'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
