import 'dart:convert';
import 'package:okonect/models/category/category.dart';
import 'package:okonect/models/media/media.dart';
import 'package:okonect/ui/widgets/widgets.dart';
import 'package:http/http.dart' as http;

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

  // Future<Category> fetchCategory({required String id}) async{

  // }
}
