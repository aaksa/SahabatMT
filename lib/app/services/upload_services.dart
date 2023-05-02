import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sahabatmt/app/constants/constants.dart';

import '../data/models/Rekuest.dart';
import '../data/models/Upload.dart';

class UploadServices {
  var baseUrl = baseUrl2;
  final loginState = GetStorage();

  Future<Upload> uploadFile(
    File file,
    String name,
    String pengajuan,
    String harga,
    String deskripsi,
    String kondisi,
    String alamat,
    String provinsi,
    String kuantitas,
  ) async {
    String token = loginState.read('token');
    String user_id = loginState.read('userId');
    print(user_id);
    print(token);
    print('user_id');

    // String userId = '1';
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl2/api/upload'));

    request.files.add(await http.MultipartFile.fromPath('gambar', file.path));
    request.fields['nama'] = name;
    request.fields['pengajuan'] = pengajuan;
    request.fields['harga'] = harga as String;
    request.fields['deskripsi'] = deskripsi;
    request.fields['kondisi'] = kondisi as String;
    request.fields['alamat'] = alamat;
    request.fields['kuantitas'] = kuantitas;
    request.fields['provinsi'] = provinsi;
    request.fields['user_id'] = user_id;

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    var response = await request.send();
    print(response.statusCode);
    print(response.headers);
    if (response.statusCode == 200) {
      var responseData = await response.stream.transform(utf8.decoder).join();
      var data = jsonDecode(responseData)['data'];

      return Upload.fromJson(data);
    } else {
      throw Exception('Failed to upload file');
    }
  }
}
