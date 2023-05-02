import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  static const String _baseUrl = baseUrl;
  final http.Client _client;
  String? _token;
  String? userId;
  String? _email;
  String? _nama;
  String? _phone;
  final box = GetStorage();
  final tokenKey = 'token';

  // AuthService({http.Client? client}) : _client = client ?? http.Client();
  AuthService({http.Client? client}) : _client = client ?? http.Client() {
    _token = box.read(tokenKey);
  }

  Future<bool> login(String email, String password) async {
    try {
      var response = await _client.post(Uri.parse('$_baseUrl/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        // Parse the authentication token from the response body
        var body = json.decode(response.body);
        _token = body['data']['access_token'];
        userId = body['data']['user']['id'].toString();
        _email = body['data']['user']['email'].toString();
        _nama = body['data']['user']['nama'].toString();
        _phone = body['data']['user']['nomor_hp'].toString();

        await box.write(tokenKey, _token);
        await box.write('userId', userId);
        await box.write('email', _email);
        await box.write('nama', _nama);
        await box.write('phone', _phone);

        return true;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to loging');
    }
  }

  bool get isAuthenticated => _token != null;

  void logout() async {
    _token = null;
    await box.remove(tokenKey);
  }
}
