import 'package:get/get.dart';

import '../controllers/itemdetailsscreen_controller.dart';

class ItemdetailsscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemdetailsscreenController>(
      () => ItemdetailsscreenController(),
    );
  }
}
