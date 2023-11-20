import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final GetConnect connect = Get.find<GetConnect>();
  final baseUrl = dotenv.env['BASE_URL'];
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
            'is_developer': 'True',
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

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      uri,
      body: jsonEncode(<dynamic, dynamic>{
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-Client-Type': 'Jobfortech-app',
      },
    );
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      final id = jsonDecode(response.body)['id'];
      await secureStorage.write(key: 'token', value: token);
      final readToken = await secureStorage.read(key: 'token');
      print('readToken : $readToken');
      await secureStorage.write(key: 'id', value: id.toString());
    } else {
      final message = jsonDecode(response.body)['non_field_errors'][0];
      throw (message);
    }
  }

  Future<void> loginWithGoogle(String accessToken) {
    final uri = Uri.parse('$baseUrl/auth/oauth/');
    return http.post(
      uri,
      body: jsonEncode(<dynamic, dynamic>{
        'access_token': accessToken,
        'backend': 'google-oauth2',
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-Client-Type': 'Jobfortech-app',
      },
    ).then((response) async {
      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['token'];
        final id = jsonDecode(response.body)['id'];
        await secureStorage.write(key: 'token', value: token);
        await secureStorage.write(key: 'id', value: id.toString());
        print('response : ${response.body}');
      } else {
        final message = jsonDecode(response.body)['non_field_errors'][0];
        throw (message);
      }
    });
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

  Future<User> updateUser({required Map<String, dynamic> body, int? id}) async {
    final id = await secureStorage.read(key: 'id');
    final token = await secureStorage.read(key: 'token');
    final uri = Uri.parse('$baseUrl/users/update-profile/$id/');
    print(body);
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
      print('success response ${response.body}');
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> updateUserPhoto({required File image}) async {
    final token = await secureStorage.read(key: 'token');
    final id = await secureStorage.read(key: 'id');

    final request = http.MultipartRequest(
        'PUT', Uri.parse('$baseUrl/users/update-photo-profile/$id/'));
    Map<String, String> headers = {
      'Content-type': 'multipart/form-data',
      'Authorization': 'Token ${token}'
    };
    try {
      request.headers.addAll(headers);
      request.files.add(
        http.MultipartFile(
          'photo_profile',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path.split('/').last,
        ),
      );
      final res = await request.send();
      http.Response response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        return true;
      } else {
        print('fail upload image');
        return false;
      }
    } catch (error) {
      print('Error uploading image: $error');
      return false;
    }
  }

  Future<bool> uploadPDF({required File pdfFile}) async {
    final token = await secureStorage.read(key: 'token');
    final id = await secureStorage.read(key: 'id');

    final request = http.MultipartRequest(
        'PUT', Uri.parse('$baseUrl/users/update-resume/$id/'));
    request.headers['Authorization'] = 'Token $token';

    request.files.add(
      http.MultipartFile(
        'resume',
        pdfFile.readAsBytes().asStream(),
        pdfFile.lengthSync(),
        filename: pdfFile.path.split('/').last,
      ),
    );

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Gagal mengunggah file PDF');
        return false;
      }
    } catch (error) {
      print('Kesalahan mengunggah file PDF: $error');
      return false;
    }
  }

  Future<List<String>> getExpertise() async {
    final uri = Uri.parse('$baseUrl/users/expertise/');
    final token = await secureStorage.read(key: 'token');
    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final results = jsonResponse['results'] as List;
      final expertiseList =
          results.map((item) => item['name'].toString()).toList();
      print('Expertise list: $expertiseList');
      return expertiseList;
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception('Failed to load expertise');
    }
  }

  Future<User> getUser({String? id}) async {
    final token = await secureStorage.read(key: 'token');
    id ??= await secureStorage.read(key: 'id');
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ${token}',
      },
    ).timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception('Something went wrong, Please try again later !');
    });

    if (response.statusCode == 200) {
      print('response ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse);
    } else {
      throw Exception(response.body);
    }
  }
}
