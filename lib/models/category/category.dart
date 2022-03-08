class Category {
  String? designation;
  int? id;
  Category({
    this.id,
    this.designation,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      id: json['id'] as int, designation: json['designation'] as String);
}

Map<String, dynamic> _$CategoryToJson(Category instance) =>
    <String, dynamic>{'designation': instance.designation};
