class News {
  final int id;
  final String titleAm;
  final String titleOr;
  final String descriptionAm;
  final String descriptionOr;
  final DateTime createdAt;
  final List<NewsImage> images;

  News({
    required this.id,
    required this.titleAm,
    required this.titleOr,
    required this.descriptionAm,
    required this.descriptionOr,
    required this.createdAt,
    required this.images,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      titleAm: json['titleAm'],
      titleOr: json['titleOr'],
      descriptionAm: json['descriptionAm'],
      descriptionOr: json['descriptionOr'],
      createdAt: DateTime.parse(json['createdAt']),
      images: (json['images'] as List<dynamic>)
          .map((i) => NewsImage.fromJson(i))
          .toList(),
    );
  }
}

class NewsImage {
  final int id;
  final int newsId;
  final String imageUrl;

  NewsImage({
    required this.id,
    required this.newsId,
    required this.imageUrl,
  });

  factory NewsImage.fromJson(Map<String, dynamic> json) {
    return NewsImage(
      id: json['id'],
      newsId: json['newsId'],
      imageUrl: json['imageUrl'],
    );
  }
}
