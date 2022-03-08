import 'dart:convert';

import 'package:okonect/models/media/media.dart';
import 'package:okonect/ui/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class DataApiProvider {
  static const mainUrl = "http://192.168.5.12:8000/api";
  final http.Client httpClient = http.Client();

  Future<List<Media>> fetchAllMedia() async {
    List<Media> emptyArray = [];
    try {
      String url = Uri.encodeFull('$mainUrl/media/show/all');
      Future.delayed(new Duration(milliseconds: 5));
      final response = await this.httpClient.get(
        Uri.parse(url),
        headers: {"content-type": "application/json"},
      );
      if (response.statusCode != 200) {
        print(response.body.toString());
        throw Exception('error getting media ');
      }
      print(response.body.toString());

      final medias = (jsonDecode(response.body) as List)
          .map((json) => Media.fromJson(json))
          .toList();
      return medias;
    } catch (e) {
      print("Error media occured : ${e.toString()}");
      showToast(msg: 'Error occured');
      return emptyArray;
    }
  }
}