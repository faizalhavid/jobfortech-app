import 'dart:convert';

import 'package:jobfortech/app/data/models/User.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final baseUrl = 'http://192.168.100.44:8000';
  Future<User> register({
    required String email,
    required String password,
    required String password2,
    required String firstName,
    required String lastName,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'email': email,
        'password': password,
        'password2': password2,
        'first_name': firstName,
        'last_name': lastName,
      }),
    );
    print(response.body);
    print(email + password + password2 + firstName + lastName);
    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }
}
