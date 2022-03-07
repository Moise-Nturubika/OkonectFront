class Result {
  String? message;
  bool? status;
  Map? data;
  Result({
    this.message,
    this.status,
    this.data,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      message: json['message'] as String,
      status: json['status'] as bool,
      data: json['data'] as Map);
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data
    };
