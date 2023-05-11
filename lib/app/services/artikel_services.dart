import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../data/articlemodel.dart';

class ArtikelServices {
  final http.Client _client;
  GetStorage loginState = GetStorage();

  ArtikelServices({http.Client? client}) : _client = client ?? http.Client();

  Future<List<Artikel>> fetchArtikel() async {
    String _token = loginState.read('token');

    final response = await http.get(Uri.parse('$baseUrl/article'), headers: {
      'Authorization': 'Bearer $_token',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      // return List<Artikel>.from(json.map((data) => Artikel.fromJson(data)));
      // return json.map((json) => Artikel.fromJson(json)).toList();
      if (body is List) {
        return body.map((json) => Artikel.fromJson(json)).toList();
      } else if (body is Map) {
        var data = body['data'] as List;
        return data.map((json) => Artikel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to parse data');
      }
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
