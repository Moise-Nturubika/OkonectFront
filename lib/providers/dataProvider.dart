import 'dart:convert';
import 'dart:io';
import 'package:okonect/models/category/category.dart';
import 'package:okonect/models/media/media.dart';
import 'package:okonect/models/result.dart';
import 'package:okonect/ui/widgets/widgets.dart';
import 'package:path/path.dart' as pathLib;
import 'package:http/http.dart' as http;
import 'package:async/async.dart' as async;

class DataApiProvider {
  static const mainUrl = "http://192.168.5.29:8000/api";
  final http.Client httpClient = http.Client();

  Future<List<Media>> fetchAllMedia() async {
    String url = Uri.encodeFull('$mainUrl/media/show/top');
    Future.delayed(new Duration(milliseconds: 5));
    final response = await this.httpClient.get(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode != 200) {
      print(response.body.toString());
      throw Exception('error getting media ');
    }
    // print(response.body.toString());

    final medias = (jsonDecode(response.body) as List)
        .map((json) => Media.fromJson(json))
        .toList();
    return medias;
  }

  Future<List<Media>> fetchCarousselVideo() async {
    String url = Uri.encodeFull('$mainUrl/media/show/top');
    Future.delayed(new Duration(milliseconds: 5));
    final response = await this.httpClient.get(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode != 200) {
      print(response.body.toString());
      throw Exception('error getting media ');
    }
    // print(response.body.toString());

    final medias = (jsonDecode(response.body) as List)
        .map((json) => Media.fromJson(json))
        .toList();
    return medias;
  }

  Future<List<Category>> fetchAllCategory() async {
    String url = Uri.encodeFull('$mainUrl/media/category/show/all');
    Future.delayed(new Duration(milliseconds: 5));
    final response = await this.httpClient.get(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode != 200) {
      print(response.body.toString());
      throw Exception('error getting media ');
    }
    // print(response.body.toString());

    final categories = (jsonDecode(response.body) as List)
        .map((json) => Category.fromJson(json))
        .toList();
    return categories;
  }

  Future<List<Media>> fetchRecentMedia() async {
    String url = Uri.encodeFull('$mainUrl/media/show/recent');
    Future.delayed(new Duration(milliseconds: 5));
    final response = await this.httpClient.get(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode != 200) {
      print(response.body.toString());
      throw Exception('error getting media ');
    }
    // print(response.body.toString());

    final medias = (jsonDecode(response.body) as List)
        .map((json) => Media.fromJson(json))
        .toList();
    return medias;
  }

  Future<List<Media>> fetchSameCategory({required String category}) async {
    String url = Uri.encodeFull('$mainUrl/media/show/category/$category');
    Future.delayed(new Duration(milliseconds: 5));
    final response = await this.httpClient.get(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode != 200) {
      print(response.body.toString());
      throw Exception('error getting media ');
    }
    // print(response.body.toString());

    final medias = (jsonDecode(response.body) as List)
        .map((json) => Media.fromJson(json))
        .toList();
    return medias;
  }

  Future<Result> saveMedia({
    required Media media,
    required File poster,
    required File fichier,
  }) async {
    var url = Uri.parse(Uri.encodeFull('$mainUrl/media/all/save'));
    var request = new http.MultipartRequest("POST", url);
    request.fields['title'] = "${media.title}";
    request.fields['auteur'] = "${media.auteur}";
    request.fields['refCategory'] = "${media.category?.id}";
    request.fields['refClient'] = "1";
    request.files.add(await http.MultipartFile.fromPath('poster', poster.path));
    request.files.add(await http.MultipartFile.fromPath("file", fichier.path));

    http.StreamedResponse insertResponse = await request.send();

    if (insertResponse.statusCode != 200) {
      throw Exception(
          'error saving save page data : ${insertResponse.stream.toString()}');
    }

    final json = jsonDecode(await insertResponse.stream.bytesToString());
    return Result.fromJson(json);
  }
}
