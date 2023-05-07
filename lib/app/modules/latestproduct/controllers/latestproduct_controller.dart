import 'package:get/get.dart';

import 'package:sahabatmt/app/data/models/produk.dart';
import '../../../services/produk_services.dart';

class LatestproductController extends GetxController {
  //TODO: Implement LatestproductController

  final count = 0.obs;
  final ProdukServices _services = ProdukServices();
  var marketData = <Produk>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
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

  void fetchData() async {
    try {
      isLoading(true);
      var data = await _services.fetchData();
      marketData.value = data;
      // print(produkList[0].gambar);
      // print('HAHAHAHAHA');
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void increment() => count.value++;
}
