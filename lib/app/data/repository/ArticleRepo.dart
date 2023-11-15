import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:http/http.dart' as http;

class ArticleRepository {
  final GetConnect connect = Get.find<GetConnect>();
  final baseUrl = dotenv.env['BASE_URL'];
  final secureStorage = FlutterSecureStorage();

  Future<List<Article>> getAllArticle() async {
    final token = await secureStorage.read(key: 'token');
    final response = await http.get(Uri.parse('$baseUrl/article'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    });

    if (response.statusCode == 200) {
      final List<dynamic> articleList = jsonDecode(response.body)['results'];
      print(articleList);
      return articleList.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load article');
    }
  }

  Future<Article> getHighlightArticle() async {
    final token = await secureStorage.read(key: 'token');
    final response =
        await http.get(Uri.parse('$baseUrl//article/highlight'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    });

    if (response.statusCode == 200) {
      final article = Article.fromJson(jsonDecode(response.body)['results']);
      return article;
    } else {
      throw Exception('Failed to load article');
    }
  }

  Future<Article> getArticleById({required int id}) async {
    final token = await secureStorage.read(key: 'token');
    final response =
        await http.get(Uri.parse('$baseUrl/article/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    });

    if (response.statusCode == 200) {
      final article = Article.fromJson(jsonDecode(response.body));
      print(article);
      return article;
    } else {
      throw Exception('Failed to load article');
    }
  }
}
