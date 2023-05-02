import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';

import '../../../data/articlemodel.dart';

class ArticleController extends GetxController {
  //TODO: Implement ArticleController

  final count = 0.obs;

  var article = Article().obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
  }

  void fetchArticle() {
    // Replace this with your code to fetch the article data from the database

    // article.value = Article(
    //   title: 'Pentingnya Membersihkan Air Conditioner',
    //   content:
    //       'Air conditioner (AC) adalah salah satu alat pendingin udara yang sering digunakan di berbagai tempat, seperti di rumah, kantor, dan pusat perbelanjaan. Namun, terkadang kita lupa untuk membersihkan AC secara teratur. Padahal, membersihkan AC secara teratur memiliki banyak manfaat penting, seperti: ',
    //   imageUrl:
    //       'https://coolbestaircon.com/wp-content/uploads/2020/11/The-Beginners-Guide-To-Aircon-Installation.png',
    // );

    article.value = Article(
      title: 'Pentingnya Membersihkan Air Conditioner',
      content:
          'Air conditioner (AC) adalah salah satu alat pendingin udara yang sering digunakan di berbagai tempat, seperti di rumah, kantor, dan pusat perbelanjaan. Namun, terkadang kita lupa untuk membersihkan AC secara teratur. Padahal, membersihkan AC secara teratur memiliki banyak manfaat penting, seperti:\n\n1. Menjaga Kesehatan\nAC yang kotor dapat menjadi sarang bagi bakteri, jamur, dan kuman. Udara yang dihasilkan oleh AC yang kotor dapat menyebabkan iritasi pada mata, hidung, dan tenggorokan. Oleh karena itu, membersihkan AC secara teratur dapat membantu menjaga kesehatan kita dan keluarga.\n\n2. Memperpanjang Umur AC\nAC yang kotor akan bekerja lebih berat dari biasanya, sehingga dapat memperpendek umur AC. Dengan membersihkan AC secara teratur, kinerja AC akan tetap optimal dan dapat memperpanjang umur AC.\n\n3. Menghemat Biaya\nAC yang kotor akan menghasilkan udara yang tidak dingin dan bekerja lebih keras. Akibatnya, konsumsi listrik pun akan meningkat. Dengan membersihkan AC secara teratur, AC akan bekerja lebih efisien dan menghemat biaya listrik.\n\nJangan lupa untuk membersihkan AC secara teratur, minimal satu kali dalam 3 bulan. Dengan menjaga kebersihan AC, kita dapat merasakan manfaat yang signifikan.',
      imageUrl:
          'https://coolbestaircon.com/wp-content/uploads/2020/11/The-Beginners-Guide-To-Aircon-Installation.png',
    );
  }
  // String? title;
  // String? content;
  // String? imageUrl;
//   List<Map<String, dynamic>> corousel = [
//       {
//   'image': 'assets/images/coros1.svg',
//   'subtitle':
//   'Perawatan AC Berkala dan Perbaikan Profesional untuk Kenyamanan Rumah Anda.',
//   'title': 'Jangan Biarkan AC Anda Menjadi Beban',
// },

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
