import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:sahabatmt/app/services/artikel_services.dart';
import 'package:sahabatmt/app/data/articlemodel.dart';
import '../../../services/produk_services.dart';
import 'package:sahabatmt/app/data/models/produk.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final currentIndex = 0.obs;
  final count = 0.obs;

  CarouselController buttonCarouselController = CarouselController();

  final ProdukServices _services = ProdukServices();
  final ArtikelServices _services2 = ArtikelServices();
  var produkList = <Produk>[].obs;
  var jasaList = <Produk>[].obs;
  var artikel = <Artikel>[].obs;

  var isLoading = true.obs;
  var isLoading2 = true.obs;

  void changePage(int currentIndex) {
    this.currentIndex.value = currentIndex;
  }

  // List<Produk> myData = [];

  List<Map<String, dynamic>> corousel = [
    {
      'image': 'assets/images/coros1.svg',
      'subtitle':
          'Perawatan AC Berkala dan Perbaikan Profesional untuk Kenyamanan Rumah Anda.',
      'title': 'Jangan Biarkan AC Anda Menjadi Beban',
    },
    {
      'image': 'assets/images/coros2.svg',
      'subtitle':
          'Temukan Berbagai Pilihan AC dan Layanan Jasa Perawatan di Tempat Kami.',
      'title': 'Jadikan Udara di Rumah Anda Lebih Segar',
    },
    {
      'image': 'assets/images/coros3.svg',
      'subtitle':
          'Dapatkan Penawaran Menarik untuk AC Baru dan Layanan Perawatan Berkala di Tempat Kami',
      'title': 'Hemat dan Efisien dengan AC Terbaru.',
    },
  ];

  @override
  void onInit() {
    fetchData();
    fetchData2();
    fetchArtikel();
    super.onInit();
  }

  @override
  void onReady() async {
    fetchArtikel();
    super.onReady();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var data = await _services.fetchData();
      produkList.value = data;
      // print(produkList[0].gambar);

    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchData2() async {
    try {
      isLoading2(true);
      var data = await _services.fetchData2();
      jasaList.value = data;
      // print(produkList[0].gambar);
      // print('HAHAHAHAHA');
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading2(false);
    }
  }

  void fetchArtikel() async {
    try {
      List<Artikel> articles = await _services2.fetchArtikel();
      artikel.assignAll(articles);
    } catch (e) {
      print('Failed to fetch articles: $e');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
