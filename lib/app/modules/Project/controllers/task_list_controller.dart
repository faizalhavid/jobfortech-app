import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Project.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/ProjectRepo.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';

class TaskListController extends GetxController {
  final projectId;

  TaskListController({required this.projectId});
  List<int> participants = [];
  final keyForm = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final statusController = TextEditingController();
  final timeController = TextEditingController();
  final Rx<List<int>> participantController = Rx<List<int>>([]);
  final Map<String, String> status = {
    'to-do': 'To Do',
    'on-going': 'On Going',
    'due': 'Due Date',
    'on-testing': 'On Testing',
    'completed': 'Completed'
  };
  final dropdownValue = ''.obs;

  final taskListFutures = <String, Future<List<Task>>>{}.obs;

  Future<List<User>> fetchParticipants(
    List<int> userIds,
  ) async {
    List<User> users = [];

    for (int id in userIds) {
      final user = await UserRepository().getUser(
        id: id.toString(),
      );
      users.add(user);
    }

    return users;
  }

  Future<List<User>> fetchParticipantsProject() async {
    List<User> participantsProject = [];
    for (int id in participants) {
      print('id: $id');
      final user = await UserRepository().getUser(
        id: id.toString(),
      );
      print('user: ${user.name}');
      participantsProject.add(user);
    }
    return participantsProject;
  }

  void refreshCard(String query) {
    taskListFutures[query] = ProjectRepository().getTaskList(query: query);
    update();
  }

  @override
  void onInit() {
    super.onInit();

    dropdownValue.value = status.keys.first;
    _initialize().then((_) {
      taskListFutures['to-do'] =
          ProjectRepository().getTaskList(query: 'to-do');
      taskListFutures['on-going'] =
          ProjectRepository().getTaskList(query: 'on-going');
      taskListFutures['due'] = ProjectRepository().getTaskList(query: 'due');
      taskListFutures['on-testing'] =
          ProjectRepository().getTaskList(query: 'on-testing');
      taskListFutures['completed'] =
          ProjectRepository().getTaskList(query: 'completed');
      fetchParticipantsProject();
    });
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    timeController.dispose();
    super.onClose();
  }

  Future<void> _initialize() async {
    try {
      final projectDetail = await ProjectRepository()
          .getDetailProject(id: projectId)
          .then((value) => participants = value.project.participants!);
    } catch (error) {
      print(error);
    }
  }
}
