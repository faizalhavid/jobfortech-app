import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:http/http.dart' as http;

class WorkRepository {
  final baseUrl = dotenv.env['BASE_URL'];
  final secureStorage = FlutterSecureStorage();

  Future<List<Work>> getWorkList({String? query}) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}/job?${query ?? ''}'),
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

  Future<List<Work>> getWorkListByCompany({required String companyId}) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}/job/company/${companyId}'),
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

  Future<bool> aplicationWork({required id}) async {
    final token = await secureStorage.read(key: 'token');

    try {
      final response = await http
          .post(
        Uri.parse('${baseUrl}/job/application/create'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Token ${token}',
        },
        body: jsonEncode({'job': id, 'status': 'Applied'}),
      )
          .timeout(
        Duration(seconds: 30),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jobList = jsonDecode(response.body)['results'];
        return true;
      } else {
        throw Exception('Something went wrong, Please try again later !');
      }
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Application> getAplication({required id}) async {
    final token = await secureStorage.read(key: 'token');
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}/job/application/${id}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token ${token}',
          'Content-Type': 'application/json',
        },
      ).timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jobList = jsonDecode(response.body);
        return Application.fromJson(jobList);
      } else {
        throw Exception('Something went wrong, Please try again later !');
      }
    } catch (e) {
      print(e);
    }
    throw Exception('Something went wrong, Please try again later !');
  }

  Future<bool> updateSaveStatus({required bool status, required int id}) async {
    final token = await secureStorage.read(key: 'token');

    try {
      final response = await http
          .patch(
        Uri.parse('${baseUrl}/job/update-saved/${id}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token ${token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'save_status': status}),
      )
          .timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Something went wrong, Please try again later !');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
