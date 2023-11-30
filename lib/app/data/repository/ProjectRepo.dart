import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobfortech2/app/data/models/Project.dart';
import 'package:http/http.dart' as http;

class ProjectRepository {
  final baseUrl = dotenv.env['BASE_URL'];
  final secureStorage = FlutterSecureStorage();

  Future<ProjectReport> getDetailProject({required id}) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}/project/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token ${token}'
        },
      ).timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );
      if (response.statusCode == 200) {
        return ProjectReport.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Something went wrong, Please try again later !');
      }
    } on TimeoutException {
      throw TimeoutException('Request timeout, Please try again later !');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Task>> getTaskList({String? query}) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}/project/task?status=${query ?? ''}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token ${token}'
        },
      ).timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> jobList = jsonDecode(response.body)['results'];
        return jobList
            .map((json) => Task.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Something went wrong, Please try again later !');
      }
    } on TimeoutException {
      throw TimeoutException('Request timeout, Please try again later !');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createTask(
    int projectId,
    String title,
    String description,
    String status,
    int time,
    List<int> participants,
  ) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http
          .post(
        Uri.parse('${baseUrl}/project/task/create'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Token ${token}'
        },
        body: jsonEncode(
          {
            'project': projectId,
            'name': title,
            'details': description,
            'status': status,
            'time': time,
            'participants': participants,
          },
        ),
      )
          .timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );
      if (response.statusCode == 400) {
        print(response.body);
        throw Exception('Something went wrong, Please try again later !');
      }
    } on TimeoutException {
      throw TimeoutException('Request timeout, Please try again later !');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateTask(
    String taskId,
    String title,
    String description,
    String status,
    int time,
    List<int> participants,
  ) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http
          .patch(
        Uri.parse('${baseUrl}/project/task/$taskId'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Token ${token}'
        },
        body: jsonEncode(
          {
            'id': taskId,
            'name': title,
            'details': description,
            'status': status,
            'time': time,
            'participants': participants,
          },
        ),
      )
          .timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );
      if (response.statusCode == 400) {
        print(response.body);
        throw Exception('Something went wrong, Please try again later !');
      }
    } on TimeoutException {
      throw TimeoutException('Request timeout, Please try again later !');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteTask(
    int taskId,
  ) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http.delete(
        Uri.parse('${baseUrl}/project/task/$taskId'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Token ${token}'
        },
      ).timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );
      if (response.statusCode == 400) {
        print(response.body);
        throw Exception('Something went wrong, Please try again later !');
      }
    } on TimeoutException {
      throw TimeoutException('Request timeout, Please try again later !');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
