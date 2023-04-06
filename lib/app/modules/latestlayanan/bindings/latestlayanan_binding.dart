import 'package:get/get.dart';

import '../controllers/latestlayanan_controller.dart';

class LatestlayananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatestlayananController>(
      () => LatestlayananController(),
    );
  }
}
