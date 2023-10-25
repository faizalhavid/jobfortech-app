import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Projects.dart';
import 'package:jobfortech/app/data/repository/ProjectRepo.dart';

class WorkListController extends GetxController {
  Rx<List<Project>> projects = Rx<List<Project>>([]);

  @override
  void onInit() {
    fetchWorkList();
    super.onInit();
  }

  void fetchWorkList() async {
    try {
      final project = await ProjectRepository().getprojectlist();

      if (project != null) {
        projects.value = project;
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Error', e.toString());
    }
  }
}
