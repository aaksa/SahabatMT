import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/configs/configs.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        title: appbarviews(title: 'Artikel'),
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: getProperHeight(250),
                  child: Image.network(
                    articleController.article.value.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articleController.article.value.title!,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        articleController.article.value.content!,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
