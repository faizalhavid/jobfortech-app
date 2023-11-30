import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Project.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/ProjectRepo.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';

class ProjectController extends GetxController {
  final projectReportFutures = <int, Future<ProjectReport>>{}.obs;
  final projectId;

  ProjectController({required this.projectId});

  void refreshReport(int id) {
    projectReportFutures[id] = ProjectRepository().getDetailProject(id: id);
    update();
  }

  Future<List<User>> fetchParticipants(List<int> userIds) async {
    List<User> participants = [];
    for (int id in userIds) {
      final user = await UserRepository().getUser(
        id: id.toString(),
      );
      participants.add(user);
    }

    return participants;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    refreshReport(projectId);
  }
}
