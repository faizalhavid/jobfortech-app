class Article {
  int id;
  List<String> tags;
  String title;
  String content;
  String status;
  DateTime createdAt;
  String image;
  int views;
  List<int> likes;

  Article({
    required this.id,
    required this.tags,
    required this.title,
    required this.content,
    required this.status,
    required this.createdAt,
    required this.image,
    required this.views,
    required this.likes,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      tags: List<String>.from(json['tags']),
      title: json['title'],
      content: json['content'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      image: json['image'],
      views: json['views'],
      likes: List<int>.from(json['likes']),
    );
  }
}
