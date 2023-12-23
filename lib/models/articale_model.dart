class ArticaleModel {
  final String? image;
  final String title;
  final String? subTitle;

  ArticaleModel(
      {required this.image, required this.title, required this.subTitle});

  factory ArticaleModel.fromJson(json) {
    return ArticaleModel(
        image: json['urlToImage'],
        title: json['title'],
        subTitle: json['description']);
  }
}
