import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sahabatmt/app/constants/constants.dart';

class ResetPasswordController extends GetxController {
  //TODO: Implement ResetPasswordController

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

  var email = '';
  var token = '';

  var isLoading = false.obs;

  var isempty = false.obs;

  var isSuccess = false.obs;

  void setEmail(String value) {
    email = value;
  }

  void setToken(String value) {
    token = value;
    isempty.value = true;
  }

  Future<String> sendResetPasswordRequest() async {
    final response =
        await http.post(Uri.parse('$baseUrl/forgot'), body: {'email': email});

    if (response.statusCode == 200) {
      print(response.body);
      print('success');
      isSuccess.value = true;
      return 'Reset password email sent successfully';
    } else {
      print('error');
      print(response.body);
      return 'Failed to send reset password email';
    }
  }

  // Future<void> sendPasswordResetEmail() async {
  //   isLoading.value = true;
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/forgot'),
  //       // headers: {'Content-Type': 'application/json'},
  //       body: {'email': email},
  //     );
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       // Email sent successfully
  //       Get.snackbar('Password Reset Email Sent',
  //           'A password reset email has been sent to your email address.');
  //       isLoading.value = false;
  //     } else {
  //       // Error sending email
  //       Get.snackbar('Error', 'Error sending password reset email');
  //       isLoading.value = false;
  //     }
  //   } catch (e) {
  //     // Exception occurred
  //     Get.snackbar('Error', 'Exception occurred: $e');
  //     isLoading.value = false;
  //   }
  // }
}
