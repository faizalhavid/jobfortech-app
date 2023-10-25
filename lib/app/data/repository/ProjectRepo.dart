import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobfortech/app/data/models/Projects.dart';
import 'package:http/http.dart' as http;

class ProjectRepository {
  final baseUrl = 'http://192.168.137.1:8000';
  final secureStorage = FlutterSecureStorage();

  Future<List<Project>> getprojectlist() async {
    final token = await secureStorage.read(key: 'token');

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/project'),
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
        final projectList = jsonDecode(response.body)['results'];

        final List<Project> projects = (projectList as List<dynamic>)
            .map((project) => Project.fromJson(project as Map<String, dynamic>))
            .toList();

        return projects;
      } else {
        throw Exception('Something went wrong, Please try again later !');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
