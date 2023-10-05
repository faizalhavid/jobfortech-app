import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AssessmentController extends GetxController {
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  Future<void> fetchUserData() async {
    try {
      final url =
          'https://the-trivia-api.com/v2/questions?category=food_and_drink';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('response : $response.body}');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
