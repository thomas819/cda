// ///
// /// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
// ///
class AppError {
  String? message;
  Map<String, dynamic> __origJson = {};

  AppError({
    this.message,
  });
  AppError.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
  Map<String, dynamic> origJson() => __origJson;
}
