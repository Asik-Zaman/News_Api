class PhotoModel {
  final String imgUrl;
  final String photographer;

  PhotoModel({required this.photographer, required this.imgUrl});

  factory PhotoModel.fromJson(dynamic json) {
    return PhotoModel(
        photographer: json['photographer'] as String,
        imgUrl: json['src']['portrait'] as String);
  }

  static List<PhotoModel> newsList(List snapshot) {
    return snapshot.map((data) {
      return PhotoModel.fromJson(data);
    }).toList();
  }
}
