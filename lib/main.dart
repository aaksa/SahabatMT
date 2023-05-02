import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/services/auth_services.dart';

void main() async {
  // final AuthService _authService = AuthService();
  await GetStorage.init(); // Initialize GetStorage
  // print(GetStorage().read('token').toString());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // initialRoute:  _authService.isAuthenticated ?AppPages.routes.  : AppPages.INITIAL ,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
