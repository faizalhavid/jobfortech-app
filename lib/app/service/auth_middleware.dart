// import 'package:get/get.dart';
// import 'package:jobfortech/app/service/secure_storage_service.dart';

// Future<void> authMiddleware(Middleware middleware) async {
//   final secureStorage = Get.find<SecureStorageService>();
//   final token = await secureStorage.read('token');
//   if (token == null) {
//     Get.offNamed('/login');
//   } else {
//     middleware.next();
//   }
// }
