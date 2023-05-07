import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/user_model2.dart';

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
  var userData = UserModel2().obs;

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
        var user = body['data']['user'];
        userId = body['data']['user']['id'].toString();
        _email = body['data']['user']['email'].toString();
        _nama = body['data']['user']['nama'].toString();
        _phone = body['data']['user']['nomor_hp'].toString();

        userData.value = UserModel2.fromJson(user);

        print(' ini baru boss $user');
        // Save the user data to GetStorage
        await box.write(tokenKey, _token);
        await box.write('userId', userId);
        await box.write('email', _email);
        await box.write('nama', _nama);
        await box.write('phone', _phone);
        await box.write('user', userData.value.toJson());

        return true;
      } else {
        throw Exception('Error saat melakukan login');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<bool> register(
      String nama,
      String email,
      String password,
      String nomorHp,
      String provinsi,
      String kota,
      String kecamatan,
      String kelurahan,
      String jalan,
      String alamatLengkap) async {
    try {
      var response = await _client.post(Uri.parse('$_baseUrl/register'), body: {
        'nama': nama,
        'email': email,
        'password': password,
        'nomor_hp': nomorHp,
        'provinsi': provinsi,
        'kota': kota,
        'kecamatan': kecamatan,
        'kelurahan': kelurahan,
        'jalan': jalan,
        'alamat_lengkap': alamatLengkap
      });

      print(response.body);

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
        var body = json.decode(response.body);
        String message = body['data']['error']['errorInfo'].toString();
        throw Exception(message);
      }
    } catch (e) {
      print('hahahah $e');
      throw e.toString();
    }
  }

  bool get isAuthenticated => _token != null;

  void logout() async {
    _token = null;
    await box.remove(tokenKey);
  }
}
