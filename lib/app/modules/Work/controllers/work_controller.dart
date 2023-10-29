import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';

class WorkController extends GetxController {
  Rx<List<Work>> works = Rx<List<Work>>([]);
  RxBool isSaved = RxBool(false);

  @override
  void onInit() {
    fetchWorkList();
    super.onInit();
  }

  void fetchWorkList() async {
    try {
      final workData = await WorkRepository().getWorkList();
      if (workData != null) {
        works.value = workData;
        for (var work in works.value) {
          print(work.company!.name);
        }
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Error', e.toString());
    }
  }
}
