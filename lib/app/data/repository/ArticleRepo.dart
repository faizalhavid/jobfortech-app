import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final GetConnect connect = Get.find<GetConnect>();
  final baseUrl = dotenv.env['BASE_URL'];
  final secureStorage = FlutterSecureStorage();

  Future<Article> getAllArticle() async {
    final token = await secureStorage.read(key: 'token');
    final response = await http.get(Uri.parse('$baseUrl/article'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    });

    if (response.statusCode == 200) {
      final article = Article.fromJson(jsonDecode(response.body)['article']);
      return article;
    } else {
      throw Exception('Failed to load article');
    }
  }
}
