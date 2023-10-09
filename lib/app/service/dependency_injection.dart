import 'package:get/get.dart';
import 'package:jobfortech/app/data/repository/UserRepo.dart';
import 'package:jobfortech/app/utils/globalController.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());
    Get.put<UserRepository>(UserRepository());
    Get.put<UserController>(UserController());
  }
}
