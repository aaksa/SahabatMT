import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import 'package:sahabatmt/app/data/models/produk.dart';

class ProdukServices {
  static const String _baseUrl = baseUrl;
  final http.Client _client;
  GetStorage loginState = GetStorage();

  ProdukServices({http.Client? client}) : _client = client ?? http.Client();

  Future<List<Produk>> fetchData() async {
    String _token = loginState.read('token');
    try {
      // Check if the user is authenticated
      if (loginState.read('token') == null) {
        throw Exception('User is not authenticated');
      }

      // Make a GET request to the /produk endpoint with the authentication token in the header
      var response = await _client.get(
        Uri.parse('$_baseUrl/produk'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        // Parse the data from the response body
        var body = json.decode(response.body);

        if (body is List) {
          return body.map((json) => Produk.fromJson(json)).toList();
        } else if (body is Map) {
          var data = body['data'] as List;
          return data.map((json) => Produk.fromJson(json)).toList();
        } else {
          throw Exception('Failed to parse data');
        }
      } else {
        throw Exception('Failed to load data 1');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data 2');
    }
  }

  Future<List<Produk>> fetchData2() async {
    String _token = loginState.read('token');
    try {
      // Check if the user is authenticated
      if (loginState.read('token') == null) {
        throw Exception('User is not authenticated');
      }

      // Make a GET request to the /produk endpoint with the authentication token in the header
      var response = await _client.get(
        Uri.parse('$_baseUrl/jasa'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        // Parse the data from the response body
        var body = json.decode(response.body);

        if (body is List) {
          return body.map((json) => Produk.fromJson(json)).toList();
        } else if (body is Map) {
          var data = body['data'] as List;
          return data.map((json) => Produk.fromJson(json)).toList();
        } else {
          throw Exception('Failed to parse data');
        }
      } else {
        throw Exception('Failed to load data 1');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data 2');
    }
  }
}
