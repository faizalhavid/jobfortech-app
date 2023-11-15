class Article {
  int? id;
  List<String>? tags;
  String? title;
  String? content;
  String? status;
  DateTime? createdAt;
  String? image;
  int? views;
  List<int>? likes;

  Article({
    this.id,
    this.tags,
    this.title,
    this.content,
    this.status,
    this.createdAt,
    this.image,
    this.views,
    this.likes,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? '',
      tags: json['tags'] is List ? List<String>.from(json['tags']) : [],
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at']) ?? DateTime.now(),
      image: json['image'] ?? '',
      views: json['views'] ?? '',
      likes: json['likes'] is List ? List<int>.from(json['likes']) : [],
    );
  }
}
