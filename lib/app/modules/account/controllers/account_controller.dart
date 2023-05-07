import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahabatmt/app/data/models/user_model2.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';

class AccountController extends GetxController {
  //TODO: Implement AccountController

  final AuthService _authService = AuthService();
  final GetStorage nyimpan = GetStorage();
  var userData = UserModel2().obs;
  bool get isAuthenticated => _authService.isAuthenticated;

  var name = "".obs;
  var email = "".obs;
  var phone = "-".obs;
  var address = "-".obs;

  void updateProfile(String name, String email, String phone, String address) {
    this.name.value = name ?? this.name.value;
    this.email.value = email ?? this.email.value;
    this.phone.value = phone ?? this.phone.value;
    this.address.value = address ?? this.address.value;
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
}
