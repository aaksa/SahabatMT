import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/data/models/user_model2.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
  //TODO: Implement AccountController

  final AuthService _authService = AuthService();
  final GetStorage nyimpan = GetStorage();
  var userData = UserModel2().obs;
  bool get isAuthenticated => _authService.isAuthenticated;
  final box = GetStorage();

  var name = "".obs;
  var email = "".obs;
  var phone = "-".obs;
  var address = "-".obs;

  Future<void> updateProfile(String name, String phone) async {
    String userId = box.read('userId');

    try {
      await updateUserProfile(name, phone, userId);
      var box = GetStorage();
      var jsonData = box.read('user');
      if (jsonData != null) {
        userData.value = UserModel2.fromJson(jsonData);
        var anu = UserModel2.fromJson(jsonData);
        print(anu.nama);
        print(anu.alamatLengkap);
        print(UserModel2.fromJson(jsonData));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    // this.name.value = name ?? this.name.value;
    // this.phone.value = phone ?? this.phone.value;
  }

  void logout() {
    _authService.logout();
    Get.toNamed(Routes.LOGIN);
  }

  final count = 0.obs;
  @override
  void onInit() {
    // email.value = nyimpan.read('email');
    // name.value = nyimpan.read('nama');
    // phone.value = nyimpan.read('phone');
    // Retrieve the user data from GetStorage
    var box = GetStorage();
    var jsonData = box.read('user');
    if (jsonData != null) {
      userData.value = UserModel2.fromJson(jsonData);
      var anu = UserModel2.fromJson(jsonData);
      print(anu.nama);
      print(anu.alamatLengkap);
      print(UserModel2.fromJson(jsonData));
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> updateUserProfile(
      String nama, String nomorHp, String userId) async {
    String authToken = box.read('token');

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/$userId'),
        headers: {
          "Authorization": "Bearer $authToken",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "nama": nama,
          "nomor_hp": nomorHp,
        }),
      );

      if (response.statusCode == 200) {
        // handle success
        print("Profile updated successfully");
        print(response.body);

        // display success message in snackbar
        final jsonResponse = jsonDecode(response.body);
        final message = jsonResponse['meta']['message'];
        Get.snackbar('Berhasil Update Profil', message);

        // display success message in snackbar
        var user = jsonResponse['data']['user'];

        userData.value = UserModel2.fromJson(user);
        await box.write('user', userData.value.toJson());
      } else {
        // handle error
        final jsonResponse = jsonDecode(response.body);
        final message = jsonResponse['meta']['message'];
        Get.snackbar('Gagal Update Profil', message);
      }
    } catch (e) {
      // handle exception
      Get.snackbar(
          'Gagal Update Profil', 'Terjadi kesalahan saat memperbarui profil');
      print("Exception occurred while updating profile: $e");
    }
  }

  // Future<void> updateUserProfile(String nama, String nomorHp) async {
  //   // int userId = 123; // replace with the ID of the user you want to update
  //   String authToken = box.read('token');
  //   String _userId = box.read('userId');
  //
  //   print(_userId);
  //   print(authToken);
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/update'),
  //       headers: {
  //         "Authorization": "Bearer $authToken",
  //         "Content-Type": "application/json",
  //       },
  //       body: jsonEncode({
  //         "nama": nama, // replace with the new name
  //         "nomor_hp": nomorHp, // replace with the new phone number
  //         "id": _userId, // specify the ID of the user you want to update
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // handle success
  //       print("Profile updated successfully");
  //       print(response.body);
  //     } else {
  //       // handle error
  //       print("Error updating profile: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     // handle exception
  //     print("Exception occurred while updating profile: $e");
  //   }
  // }
}
