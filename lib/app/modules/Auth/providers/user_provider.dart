import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../user_model.dart';
import 'dart:convert';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  // Future<User?> getUser(int id) async {
  //   final response = await get('user/$id');
  //   return response.body;
  // }

  Future<User?> getUser(int id) async {
    try {
      final jsonString = await rootBundle.loadString('lib/app/data/user.json');
      final Map<String, dynamic> userData = json.decode(jsonString);
      return User.fromJson(userData);
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
