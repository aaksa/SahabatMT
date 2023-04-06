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

    article.value = Article(
      title: 'articleData[' ']',
      content: 'articleData[' ']',
      imageUrl: defaultimg,
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
