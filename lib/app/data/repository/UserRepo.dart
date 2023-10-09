import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:jobfortech/app/utils/globalController.dart';

class UserRepository {
  // final baseUrl = 'https://api.techconsulta.com';
  final GetConnect connect = Get.find<GetConnect>();

  final baseUrl = 'https://api.techconsulta.com';

  final secureStorage = FlutterSecureStorage();
  Future<User> register({
    required String email,
    required String password,
    required String password2,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/auth/register');
      final response = await http.post(
        uri,
        body: jsonEncode(
          <dynamic, dynamic>{
            'email': email,
            'password': password,
            'password2': password2,
            'first_name': firstName,
            'last_name': lastName,
            'is_developer': 'true',
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(
        Duration(minutes: 1),
        onTimeout: () {
          throw Exception('Something went wrong, Please try again later !');
        },
      );

      switch (response.statusCode) {
        case 200:
          final user = User.fromJson(jsonDecode(response.body)['user']);

          return user;
        case 400:
          final dynamic errorData = jsonDecode(response.body);
          if (errorData is Map<String, dynamic>) {
            final List<String> errorKeys = [
              'email',
              'password',
              'password2',
              'first_name',
              'last_name'
            ];

            for (var key in errorKeys) {
              if (errorData.containsKey(key)) {
                throw errorData[key][0];
              }
            }
          }

          final message = jsonDecode(response.body)['non_field_errors'][0];
          throw Exception(message);
        default:
          throw Exception(response.body);
      }
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-Client-Type': 'Jobfortech-app',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      final id = jsonDecode(response.body)['id'];
      await secureStorage.write(key: 'token', value: token);
      final readToken = await secureStorage.read(key: 'token');
      print('readToken : $readToken');
      await secureStorage.write(key: 'id', value: id.toString());
      return User.fromJson(jsonDecode(response.body));
    } else {
      final message = jsonDecode(response.body)['non_field_errors'][0];
      throw (message);
    }
  }

  // Future<User> logout({required token}) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/auth/logout'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'bearer': '$token',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     return User.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }

  Future<User> getUser() async {
    final token = await secureStorage.read(key: 'token');
    final id = await secureStorage.read(key: 'id');
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ${token}',
      },
    ).timeout(Duration(minutes: 1), onTimeout: () {
      throw Exception('Something went wrong, Please try again later !');
    });

    if (response.statusCode == 200) {
      print('response ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      User user = User.fromJson(jsonResponse);
      Get.find<UserController>().setUser(user);

      return user;
    } else {
      throw Exception(response.body);
    }
  }

  Future<User> emailActivation(
      {required id, required string_activation}) async {
    final uri = Uri.parse('$baseUrl/auth/activate/$id/$string_activation');
    final response = await http.get(uri, headers: {
      'Accept': 'application/json',
    });
    try {
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
      return User.fromJson(jsonDecode(response.body));
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<User> resendEmail({required id, required email}) async {
    final uri = Uri.parse('$baseUrl/resend-email/$id');
    final response = await http.patch(
      uri,
      headers: {
        'Accept': 'application/json',
      },
      body: jsonEncode(<dynamic, dynamic>{'email': email}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<User> updateUser({required Map<String, dynamic> body}) async {
    final id = await secureStorage.read(key: 'id');
    final token = await secureStorage.read(key: 'token');
    final uri = Uri.parse('$baseUrl/users/$id');
    final response = await http.patch(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ${token}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }
}
