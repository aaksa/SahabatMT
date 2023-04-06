import 'package:get/get.dart';

import '../controllers/latestproduct_controller.dart';

class LatestproductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatestproductController>(
      () => LatestproductController(),
    );
  }
}
