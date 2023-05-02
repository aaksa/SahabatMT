import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:sahabatmt/app/data/models/Rekuest.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

class RekuestServices {
  static const String _baseUrl = baseUrl;
  final http.Client _client;
  GetStorage loginState = GetStorage();

  RekuestServices({http.Client? client}) : _client = client ?? http.Client();

  Future<List<Rekuest>> fetchDatarekuest() async {
    String _token = loginState.read('token');
    String _userId = loginState.read('userId');

    try {
      // Check if the user is authenticated
      if (_token == null) {
        throw Exception('User is not authenticated');
      }

      // Make a GET request to the /rekuest endpoint with the authentication token in the header
      var response = await _client.get(
        Uri.parse('$_baseUrl/rekuest/$_userId'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        // Parse the data from the response body
        var body = json.decode(response.body);
        print(body);
        if (body is List) {
          return body.map((json) => Rekuest.fromJson(json)).toList();
        } else if (body is Map) {
          var data = body['data']['data'] as List;
          return data.map((json) => Rekuest.fromJson(json)).toList();
        } else {
          throw Exception('Failed to parse data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }

// Future<List<Rekuest>> fetchDatarekuest() async {
  //   String _token = loginState.read('token');
  //   String _userId = loginState.read('userId');
  //
  //   try {
  //     // Check if the user is authenticated
  //     if (_token == null) {
  //       throw Exception('User is not authenticated');
  //     }
  //
  //     // Make a GET request to the /rekuest endpoint with the authentication token in the header
  //     var response = await _client.get(
  //       Uri.parse('$_baseUrl/rekuest/$_userId'),
  //       headers: {
  //         'Authorization': 'Bearer $_token',
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Parse the data from the response body
  //       var body = json.decode(response.body);
  //
  //       if (body is Map && body.containsKey('data')) {
  //         var data = body['data'];
  //         if (data is List) {
  //           return data.map((json) => Rekuest.fromJson(json)).toList();
  //         } else {
  //           throw Exception('Failed to parse data');
  //         }
  //       } else {
  //         throw Exception('Failed to parse data');
  //       }
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //
  //     // if (response.statusCode == 200) {
  //     //   // Parse the data from the response body
  //     //   var body = json.decode(response.body);
  //     //
  //     //   print(body);
  //     //   if (body is List) {
  //     //     return body.map((json) => Rekuest.fromJson(json)).toList();
  //     //   } else if (body is Map) {
  //     //     var data = body['data'] as List;
  //     //     return data.map((json) => Rekuest.fromJson(json)).toList();
  //     //   } else {
  //     //     throw Exception('Failed to parse data');
  //     //   }
  //     // } else {
  //     //   throw Exception('Failed to load data');
  //     // }
  //   } catch (e) {
  //     print(e.toString());
  //     throw Exception('Failed to load data');
  //   }
  // }
}
