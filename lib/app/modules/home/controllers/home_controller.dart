import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final currentIndex = 0.obs;
  final count = 0.obs;

  CarouselController buttonCarouselController = CarouselController();

  void changePage(int currentIndex) {
    this.currentIndex.value = currentIndex;
  }

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
