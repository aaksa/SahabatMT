import 'package:get/get.dart';
import 'package:sahabatmt/app/services/rekuest_services.dart';
import 'package:sahabatmt/app/data/models/Rekuest.dart';

class WishlistController extends GetxController {
  //TODO: Implement WishlistController

  final count = 0.obs;
  var rekuestList = <Rekuest>[].obs;
  // var rekuestList = RxList<Rekuest>([]); // modify this line

  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRekuests();
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

  // void fetchRekuests() async {
  //   try {
  //     isLoading(true);
  //     var rekuests = await RekuestServices().rekuestfetch();
  //     rekuestList.assignAll(rekuests);
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  void fetchRekuests() async {
    try {
      isLoading(true);
      var rekuests = await RekuestServices().fetchDatarekuest();
      rekuestList.assignAll(rekuests);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // void fetchRekuests() async {
  //   try {
  //     var rekuests = await RekuestServices().rekuestfetch();
  //     rekuestList.value = rekuests;
  //   } catch (e) {
  //     print('Error fetching requests: $e');
  //   }
  // }
}
