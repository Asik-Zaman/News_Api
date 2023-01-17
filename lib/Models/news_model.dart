class NewsModel {
  final String title;
  final String desc;
  final String linkUrl;
  final String imgUrl;
  final String publishedTime;

  NewsModel(
      {required this.title,
      required this.desc,
      required this.linkUrl,
      required this.imgUrl,
      required this.publishedTime});

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
        title: json['title'] as String,
        desc: json['description'] as String,
        linkUrl: json['url'] as String,
        imgUrl: json['urlToImage'] as String,
        publishedTime: json['publishedAt'] as String);
  }

  static List<NewsModel> newsList(List snapshot) {
    return snapshot.map((data) {
      return NewsModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {Title: $title, image: $imgUrl, totalTime: $linkUrl}';
  }
}
