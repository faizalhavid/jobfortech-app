import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/User.dart';

class UserController extends GetxController {
  Rx<User> user = User().obs;
  void setUser(User user) => this.user.value = user;
}
