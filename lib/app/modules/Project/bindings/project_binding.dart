import 'package:get/get.dart';

import 'package:jobfortech2/app/modules/Project/controllers/task_list_controller.dart';

import '../controllers/project_controller.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectController>(
      () => ProjectController(projectId: 2),
    );
  }
}
