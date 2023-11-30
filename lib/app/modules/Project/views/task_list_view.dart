import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Project.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/ProjectRepo.dart';
import 'package:jobfortech2/app/modules/Project/controllers/task_list_controller.dart';

import 'package:jobfortech2/components/AppAvatar/index.dart';
import 'package:jobfortech2/components/AppButton/index.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
import 'package:jobfortech2/components/AppDialog/index.dart';

import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/components/AppShimmer/index.dart';
import 'package:jobfortech2/components/AppStack/index.dart';
import 'package:jobfortech2/components/AppTextInput/index.dart';

import 'package:jobfortech2/constant/theme.dart';

class TaskListView extends GetView {
  final projectId;
  TaskListView(this.projectId, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskListController(projectId: projectId));
    RxBool isExpandedToDo = true.obs;
    RxBool isExpandedOnGoing = false.obs;
    RxBool isExpandedDueDate = false.obs;
    RxBool isExpandedOnTesting = false.obs;
    RxBool isExpandedCompleted = false.obs;

    return Scaffold(
      appBar: AppHeaderbar(
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshCard('to-do');
          controller.refreshCard('on-going');
          controller.refreshCard('due');
          controller.refreshCard('on-testing');
          controller.refreshCard('completed');
        },
        child: AppSafeArea(
          safearea: {'vertical': 20, 'horizontal': 25},
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Task List',
                  style: AppTitleHeader,
                ),
                AppButton(
                    prefix: Icon(
                      Icons.task_sharp,
                      color: AppColor.white,
                      size: 20,
                    ),
                    width: 80,
                    height: 30,
                    child: Text('New Task',
                        style: AppBasicStyle(
                            fontColor: AppColor.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    onPressed: () {
                      return buildBottomSheet(
                        context,
                        controller,
                      );
                    })
              ],
            ),
            buildCardTask(controller, 'To Do', 'to-do', isExpandedToDo),
            buildCardTask(
                controller, 'On Going', 'on-going', isExpandedOnGoing),
            buildCardTask(controller, 'Due Date', 'due', isExpandedDueDate),
            buildCardTask(
                controller, 'On Testing', 'on-testing', isExpandedOnTesting),
            buildCardTask(
                controller, 'Completed', 'completed', isExpandedCompleted),
          ],
        ),
      ),
    );
  }

  Widget buildCardTask(TaskListController controller, String statusTask,
      String query, RxBool expanded) {
    return Obx(
      () => FutureBuilder(
          future: controller.taskListFutures[query],
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              Color cardColor = AppColor.lightBlue;
              Color titleColor = AppColor.blue;
              switch (query) {
                case 'to-do':
                  cardColor = AppColor.smoke;
                  titleColor = AppColor.grey;
                case 'on-going':
                  cardColor = AppColor.lightBlue;
                  titleColor = AppColor.blue;
                  break;
                case 'due':
                  cardColor = AppColor.lightRed;
                  titleColor = AppColor.red;
                  break;
                case 'completed':
                  cardColor = AppColor.lightGreen;
                  titleColor = AppColor.green;
                  break;
                case 'on-testing':
                  cardColor = AppColor.lightOrange;
                  titleColor = AppColor.orange;
                  break;
                default:
                  cardColor = AppColor.lightBlue;
                  titleColor = AppColor.blue;
              }
              return Column(
                children: [
                  Obx(
                    () => ExpansionPanelList(
                      elevation: 0,
                      expansionCallback: (int index, bool isExpanded) {
                        expanded.toggle();
                      },
                      children: [
                        ExpansionPanel(
                          backgroundColor: AppColor.lightGrey,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              onTap: () {
                                expanded.toggle();
                              },
                              title: Text(
                                statusTask,
                                style: AppBasicStyle(
                                    fontColor: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          body: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Task task = snapshot.data![index];
                              return cardTask(
                                task,
                                controller,
                                cardColor,
                                titleColor,
                              );
                            },
                          ),
                          isExpanded: expanded.value,
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return AppShimmer(
                child: Container(
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            } else {
              return Center(child: Text('No yet Task'));
            }
          }),
    );
  }

  Future<dynamic> buildBottomSheet(
    BuildContext context,
    TaskListController controller, {
    Task? task = null,
    bool updateTask = false,
  }) {
    if (updateTask) {
      controller.titleController.text = task!.name!;
      controller.dropdownValue.value = task.status!;
      controller.descriptionController.text = task.details!;
      controller.timeController.text = task.time.toString();
      controller.participantController.value = task.participants ?? [];
    } else {
      controller.titleController.text = '';
      controller.dropdownValue.value = controller.status.keys.first;
      controller.descriptionController.text = '';
      controller.timeController.text = '';
      controller.participantController.value = [];
    }
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: Get.height * 0.8,
              child: Form(
                  key: controller.keyForm,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              updateTask
                                  ? 'Update Task ${task?.name}'
                                  : 'New Task',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                (updateTask &&
                                        task!.status != 'completed' &&
                                        task.status != 'due')
                                    ? IconButton(
                                        onPressed: () {
                                          AppDialog(
                                            title:
                                                'Are you sure want to delete this task?',
                                            content: AppStack(
                                              cAlignment:
                                                  CrossAxisAlignment.center,
                                              mAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  task!.name!,
                                                  style: AppBasicStyle(
                                                      fontColor: AppColor.grey),
                                                ),
                                              ],
                                            ),
                                            onConfirm: () async {
                                              try {
                                                await ProjectRepository()
                                                    .deleteTask(task.id!);
                                                Navigator.pop(context);

                                                Get.snackbar('Success',
                                                    'Task deleted successfully',
                                                    backgroundColor:
                                                        AppColor.white,
                                                    colorText: AppColor.black);
                                                controller
                                                    .refreshCard('on-going');
                                                controller.refreshCard('due');
                                                controller
                                                    .refreshCard('on-testing');
                                                controller
                                                    .refreshCard('completed');
                                              } catch (e) {
                                                Navigator.pop(context);
                                                Get.snackbar(
                                                    'Error', e.toString());
                                              }
                                              Navigator.pop(context);
                                            },
                                            onCancel: () {
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: AppColor.red,
                                        ))
                                    : SizedBox(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: AppColor.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppTextInput(
                          prefix: const Icon(
                            size: 15,
                            Icons.task_sharp,
                            color: AppColor.grey,
                          ),
                          controller: controller.titleController,
                          labelText: 'Title',
                          hintText: 'Enter title',
                          errorText: 'Title cannot be empty',
                          readOnly: task?.status == 'completed' ||
                              task?.status == 'due',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title cannot be empty';
                            }
                          },
                        ),
                        AppTextInput(
                          prefix: const Icon(
                            size: 15,
                            Icons.description,
                            color: AppColor.grey,
                          ),
                          controller: controller.descriptionController,
                          labelText: 'Description',
                          hintText: 'Enter description',
                          errorText: 'Description cannot be empty',
                          readOnly: task?.status == 'completed' ||
                              task?.status == 'due',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Description cannot be empty';
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Status',
                                    style: AppBasicStyle(
                                        fontColor: AppColor.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Obx(
                                    () => DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Text('Select status'),
                                      disabledHint: Text('Select status'),
                                      itemHeight: 53,
                                      value: controller.dropdownValue.value,
                                      onChanged: (String? newValue) {
                                        (task?.status != 'completed' &&
                                                task?.status != 'due')
                                            ? controller.dropdownValue.value =
                                                newValue!
                                            : null;
                                      },
                                      items: controller.status.entries
                                          .map<DropdownMenuItem<String>>(
                                        (MapEntry<String, String> entry) {
                                          return DropdownMenuItem<String>(
                                            value: entry.key,
                                            child: Text(entry.value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width * 0.4,
                              child: AppTextInput(
                                prefix: const Icon(
                                  size: 15,
                                  Icons.timer,
                                  color: AppColor.grey,
                                ),
                                controller: controller.timeController,
                                labelText: 'Time',
                                readOnly: task?.status == 'completed' ||
                                    task?.status == 'due',
                                hintText: 'Enter time',
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false),
                                errorText: 'Time cannot be empty',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Time cannot be empty';
                                  }
                                  if (int.parse(value) < 0) {
                                    return 'Time cannot be less than 0';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder<List<User>>(
                          future: controller.fetchParticipantsProject(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return AppShimmer(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 100,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: AppColor.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final isParticipant = List<bool>.filled(
                                      snapshot.data!.length, false)
                                  .obs;
                              for (int i = 0; i < snapshot.data!.length; i++) {
                                User user = snapshot.data![i];
                                if (controller.participantController.value
                                    .contains(user.id)) {
                                  isParticipant[i] = true;
                                }
                              }
                              return Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.grey, width: 1),
                                ),
                                width: Get.width,
                                height: 150,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    User user = snapshot.data![index];

                                    return Obx(
                                      () => ListTile(
                                        key: UniqueKey(),
                                        onTap: () {
                                          if (task?.status != 'completed' ||
                                              task?.status != 'due') {
                                            isParticipant[index] =
                                                !isParticipant[index];
                                            controller
                                                .participantController.value
                                                .add(user.id!);
                                          }
                                        },
                                        leading: AppAvatar(
                                          path: user.profile!.photoProfile,
                                          radius: 15,
                                        ),
                                        title: Text(
                                          '${user.firstName} ${user.lastName}',
                                          style: AppBasicStyle(
                                              fontColor: AppColor.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: isParticipant[index]
                                            ? Icon(
                                                Icons.check,
                                                color: AppColor.blue,
                                              )
                                            : null,
                                        subtitle: Text(
                                          user.email!,
                                          style: AppBasicStyle(
                                              fontColor: AppColor.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        (task?.status != 'completed' && task?.status != 'due')
                            ? AppButton(
                                width: Get.width,
                                height: 40,
                                child: Text(
                                  updateTask ? 'Update Task' : 'Create Task',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () async {
                                  if (controller.keyForm.currentState!
                                      .validate()) {
                                    controller.refreshCard(controller
                                        .status.entries
                                        .firstWhere((element) =>
                                            element.key ==
                                            controller.dropdownValue.value)
                                        .key);
                                    try {
                                      if (updateTask) {
                                        await ProjectRepository().updateTask(
                                          task!.id.toString(),
                                          controller.titleController.text,
                                          controller.descriptionController.text,
                                          controller.dropdownValue.value,
                                          int.parse(
                                              controller.timeController.text),
                                          controller
                                              .participantController.value,
                                        );
                                      } else {
                                        await ProjectRepository().createTask(
                                          projectId,
                                          controller.titleController.text,
                                          controller.descriptionController.text,
                                          controller.dropdownValue.value,
                                          int.parse(
                                              controller.timeController.text),
                                          controller
                                              .participantController.value,
                                        );
                                      }
                                      Navigator.pop(context);

                                      Get.snackbar('Success',
                                          'Task created successfully',
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: AppColor.white,
                                          colorText: AppColor.black);
                                    } catch (e) {
                                      Navigator.pop(context);
                                      print(e);
                                      Get.snackbar('Error', e.toString());
                                    }
                                  }
                                },
                              )
                            : SizedBox(),
                      ]))),
        );
      },
    );
  }

  Ink cardTask(
    Task task,
    TaskListController controller,
    Color color,
    Color titleColor,
  ) {
    return AppCard(
      color: color,
      onTap: () {
        buildBottomSheet(
          Get.context!,
          controller,
          task: task,
          updateTask: true,
        );
      },
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.3,
                  child: Text(
                    task.name!,
                    style: AppBasicStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontColor: titleColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: participant(controller, task.participants ?? [])),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: Get.width * 0.7,
              child: Text(
                task.details ?? '',
                style: AppBasicStyle(
                    fontSize: 10,
                    fontColor: AppColor.grey,
                    fontWeight: FontWeight.w400,
                    height: 1.5),
              ),
            ),
          ],
        )
      ],
    );
  }

  Wrap participant(TaskListController controller, List<int> participants) {
    return Wrap(
      children: [
        FutureBuilder<List<User>>(
          future: controller.fetchParticipants(participants),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return participantsLoading();
            } else if (snapshot.hasData) {
              return snapshot.data!.length > 0
                  ? participantHasData(snapshot)
                  : Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'No one in this team',
                        style: AppBasicStyle(
                          fontColor: AppColor.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
            } else {
              return Center(
                  child: Text('Participant empty',
                      style: AppBasicStyle(
                        fontColor: AppColor.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )));
            }
          },
        ),
      ],
    );
  }

  Widget participantHasData(AsyncSnapshot<List<User>> snapshot) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.end,
      children: List<Widget>.generate(
        min(4, snapshot.data!.length),
        (index) {
          if (index < 3) {
            User user = snapshot.data![index];
            return AppAvatar(path: user.profile!.photoProfile, radius: 15);
          } else {
            return Container(
              width: 33,
              height: 33,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.blue,
                border: Border.all(color: AppColor.white, width: 2),
              ),
              child: Text(
                '+${snapshot.data!.length - 3}',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }

  Wrap participantsLoading() {
    return Wrap(
      spacing: 5,
      children: [
        AppShimmer(
          child: AppAvatar(radius: 15),
        ),
        AppShimmer(
          child: AppAvatar(radius: 15),
        ),
        AppShimmer(child: AppAvatar(radius: 15)),
      ],
    );
  }
}
