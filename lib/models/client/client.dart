class Client {
  int? id;
  String? fullname;
  String? phone;
  String? image;
  String? lastConnection;

  Client({
    this.id,
    this.fullname,
    this.phone,
    this.image,
    this.lastConnection,
  });
  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
      id: json['id'] as int,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      lastConnection: json['lastConnection'] as String);
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'phone': instance.phone,
      'image': instance.image,
      'lastConnection': instance.lastConnection,
    };
