import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:http/http.dart' as http;

class WorkRepository {
  final baseUrl = dotenv.env['BASE_URL'];
  final secureStorage = FlutterSecureStorage();

  Future<List<Work>> getWorkList() async {
    final token = await secureStorage.read(key: 'token');

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/job'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token ${token}',
        },
      ).timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jobList = jsonDecode(response.body)['results'];
        return jobList.map((json) => Work.fromJson(json)).toList();
      } else {
        throw Exception('Something went wrong, Please try again later !');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
