import '../constants/constants.dart';

class Artikel {
  int? id;
  String? title;
  String? content;
  String? image;
  Artikel({this.id, this.title, this.content, this.image});

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
      id: json['id'],
      image: takeImage(json['image']),
      title: json['title'],
      content: json['content'],
    );
  }

  static String takeImage(String url) {
    return "$baseUrl2/storage/$url";
  }
}
