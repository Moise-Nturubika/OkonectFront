import 'package:okonect/models/category/category.dart';
import 'package:okonect/models/client/client.dart';

class Media {
  int? id;
  String? title;
  String? auteur;
  String? poster;
  String? file;
  String? dateAjout;
  Category? category;
  Client? client;

  Media(
      {this.id,
      this.title,
      this.auteur,
      this.poster,
      this.file,
      this.dateAjout,
      this.category,
      this.client});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
      id: json['id'] as int,
      title: json['title'] as String,
      auteur: json['auteur'] as String,
      poster: json['poster'] as String,
      file: json['file'] as String,
      dateAjout: json['dateAjout'] as String,
      category: Category.fromJson(json['category']),
      client: Client.fromJson(json['client']));
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      // 'fullname': instance.fullname,
      // 'phone': instance.phone,
      // 'image': instance.image,
      // 'lastConnection': instance.lastConnection,
    };
