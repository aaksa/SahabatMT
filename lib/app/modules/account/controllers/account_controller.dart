import 'package:get/get.dart';

class AccountController extends GetxController {
  //TODO: Implement AccountController

  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var address = "".obs;

  void updateProfile(String name, String email, String phone, String address) {
    this.name.value = name ?? this.name.value;
    this.email.value = email ?? this.email.value;
    this.phone.value = phone ?? this.phone.value;
    this.address.value = address ?? this.address.value;
  }

  final count = 0.obs;
  @override
  void onInit() {
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
