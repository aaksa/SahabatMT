import 'package:get/get.dart';

import '../../../services/produk_services.dart';
import 'package:sahabatmt/app/data/models/produk.dart';

class MarketController extends GetxController {
  //TODO: Implement MarketController

  final count = 0.obs;
  // var produkList = <Produk>[].obs;

  // var isProduk = true.obs;
  var isButton1Active = true.obs;
  var isButton2Active = false.obs;
  final ProdukServices _services = ProdukServices();

  var marketData = <Produk>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchData();
    isButton1Active.value = true;
    super.onInit();
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

  void fetchData2() async {
    try {
      isLoading(true);
      var data = await _services.fetchData2();
      marketData.value = data;
      // print(produkList[0].gambar);
      // print('HAHAHAHAHA');
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
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
