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

  Future<List<Produk>> fetchDataSearch(String searchQuery) async {
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
          // Filter the data based on the search query
          var filteredList = body
              .map((json) => Produk.fromJson(json))
              .where((produk) => (produk.nama?.toLowerCase() ?? '')
                  .contains(searchQuery.toLowerCase()))
              .toList();

          return filteredList;
        } else if (body is Map) {
          var data = body['data'] as List;

          // Filter the data based on the search query
          var filteredList = data
              .map((json) => Produk.fromJson(json))
              .where((produk) => (produk.nama?.toLowerCase() ?? '')
                  .contains(searchQuery.toLowerCase()))
              .toList();

          return filteredList;
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

  Future<List<Produk>> fetchDataSearch2(String searchQuery) async {
    String _token = loginState.read('token');
    try {
      // Check if the user is authenticated
      if (loginState.read('token') == null) {
        throw Exception('User is not authenticated');
      }

      // Make the first GET request to the first URL
      var response1 = await _client.get(
        Uri.parse('$_baseUrl/produk'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      // Make the second GET request to the second URL
      var response2 = await _client.get(
        Uri.parse('$_baseUrl/jasa'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response1.statusCode == 200 && response2.statusCode == 200) {
        // Parse the data from the response bodies
        var body1 = json.decode(response1.body);
        var body2 = json.decode(response2.body);

        List<dynamic> combinedData = [];

        if (body1 is List) {
          combinedData.addAll(body1);
        } else if (body1 is Map && body1.containsKey('data')) {
          var data = body1['data'] as List;
          combinedData.addAll(data);
        } else {
          throw Exception('Failed to parse data from Produk 1');
        }

        if (body2 is List) {
          combinedData.addAll(body2);
        } else if (body2 is Map && body2.containsKey('data')) {
          var data = body2['data'] as List;
          combinedData.addAll(data);
        } else {
          throw Exception('Failed to parse data from Produk 2');
        }

        // Filter the combined data based on the search query
        var filteredList = combinedData
            .map((json) => Produk.fromJson(json))
            .where((produk) => (produk.nama?.toLowerCase() ?? '')
                .contains(searchQuery.toLowerCase()))
            .toList();

        return filteredList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
