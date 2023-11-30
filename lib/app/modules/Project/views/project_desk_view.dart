import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Project.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/models/Work.dart';
import 'package:jobfortech2/app/data/repository/ProjectRepo.dart';
import 'package:jobfortech2/app/modules/Project/views/task_list_view.dart';
import 'package:jobfortech2/app/modules/Work/views/detail_participants_view.dart';
import 'package:jobfortech2/components/AppAvatar/index.dart';
import 'package:jobfortech2/components/AppBadge/index.dart';
import 'package:jobfortech2/components/AppButton/index.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/components/AppShimmer/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../controllers/project_controller.dart';

class ProjectDeskView extends GetView {
  final Work work = Get.arguments;
  ProjectDeskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool isExpanded = false.obs;
    final controller = Get.put(ProjectController(projectId: work.project!.id));
    final project = work.project;
    final company = work.company;
    // int max_progress = project!.time!;
    // int progress = project.task!.
    return Scaffold(
      appBar: AppHeaderbar(
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshReport(project!.id);
        },
        child: AppSafeArea(
          safearea: {'vertical': 20, 'horizontal': 25},
          spacing: 10,
          children: [
            Text(
              project!.name ?? 'Project Name',
              style: AppTitleHeader,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: AppAvatar(path: company!.photo_profile, radius: 25),
              title: Text(
                company.name ?? 'Company Name',
                style: AppBasicStyle(
                    fontColor: AppColor.black, fontWeight: FontWeight.w600),
              ),
              trailing: AppIconButton(
                  svgPath: 'assets/svgs/drop-down-up-outline.svg',
                  onPressed: () {}),
            ),
            Text(
              project.details ?? 'Project Description',
              style: AppBasicStyle(
                fontSize: 13,
                fontColor: AppColor.grey,
                height: 2,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            FutureBuilder<ProjectReport>(
                future: controller.projectReportFutures[project.id],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return AppShimmer(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final projectReport = snapshot.data;
                    final totalTasks = projectReport!.task;
                    final todoPercent = totalTasks == 0
                        ? 0.0
                        : (projectReport?.todoTask ?? 0) / totalTasks;
                    final ongoingPercent = totalTasks == 0
                        ? 0.0
                        : (projectReport?.ongoingTask ?? 0) / totalTasks;
                    final completedpercent = totalTasks == 0
                        ? 0.0
                        : (projectReport?.completedTask ?? 0) / totalTasks;
                    final progressPercent = totalTasks == 0
                        ? 0.0
                        : (projectReport.completedTask / totalTasks);
                    String progressPercentStr =
                        (progressPercent * 100).toStringAsFixed(1);
                    if (progressPercentStr.endsWith('.0')) {
                      progressPercentStr = progressPercentStr.substring(
                          0, progressPercentStr.length - 2);
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 8,
                              animation: true,
                              percent: todoPercent,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.lightGrey2,
                              backgroundColor: AppColor.blue.withOpacity(0.2),
                            ),
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 8,
                              animation: true,
                              percent: ongoingPercent, // 20%
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.lightBlue,
                              backgroundColor: Colors.transparent,
                            ),
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 8,
                              animation: true,
                              percent: completedpercent, // 25%
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.blue,
                              backgroundColor: Colors.transparent,
                            ),
                            Positioned(
                              top: 50,
                              left: 20,
                              right: 0,
                              child: Text('${progressPercentStr}%',
                                  style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.lightGrey2,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      projectReport.todoTask.toString(),
                                      style: AppBasicStyle(
                                          fontColor: AppColor.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'To Do',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.lightBlue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      projectReport.ongoingTask.toString(),
                                      style: AppBasicStyle(
                                          fontColor: AppColor.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'On Going',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      projectReport.completedTask.toString(),
                                      style: AppBasicStyle(
                                          fontColor: AppColor.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Done',
                                      style: AppBasicStyle(
                                          fontColor: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return Center(child: Text('No yet Project'));
                  }
                }),
            SizedBox(
              height: 30,
            ),
            AppCard(
              spacing: 10,
              radius: 0,
              color: AppColor.white,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Team Project',
                        style: AppBasicStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => DetailParticipantsView(
                              user: company.user_profile!));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppAvatar(
                                    path: company.user_profile?.profile
                                                ?.photoProfile !=
                                            null
                                        ? company
                                            .user_profile!.profile!.photoProfile
                                        : null,
                                    radius: 15),
                                AppIcon(
                                    svgPath: 'assets/svgs/info-circle.svg',
                                    size: 20)
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${company.user_profile!.firstName!} ${company.user_profile!.lastName!}',
                              style: AppBasicStyle(
                                  fontColor: AppColor.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Tech Consultant',
                              style: AppBasicStyle(
                                fontColor: AppColor.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      participant(controller),
                      AppButton(
                          child: Text('Task list'),
                          height: 40,
                          onPressed: () {
                            Get.to(() => TaskListView(project.id));
                          })
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Wrap participant(ProjectController controller) {
    return Wrap(
      children: [
        FutureBuilder<List<User>>(
          future: controller.fetchParticipants(work.project!.participants!),
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
              return Center(child: Text('=No yet Participant'));
            }
          },
        )
      ],
    );
  }

  Widget participantHasData(AsyncSnapshot<List<User>> snapshot) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            User user = snapshot.data![index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Get.to(() => DetailParticipantsView(user: user));
              },
              leading: Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/circle.png',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      AppAvatar(
                        path: user.profile!.photoProfile,
                      ),
                    ],
                  )
                ],
              ),
              title: Text(
                '${user.profile!.firstName!} ${user.profile!.lastName!}',
                style: AppBasicStyle(
                  fontColor: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                user.profile!.position!, // replace with actual data fields
                style: AppBasicStyle(
                  fontColor: AppColor.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: AppIconButton(
                svgPath: 'assets/svgs/drop-down-up-outline.svg',
                onPressed: () {},
              ),
            );
          },
        ),
      ],
    );
  }

  Column participantsLoading() {
    return Column(
      children: [
        AppShimmer(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            leading: AppAvatar(),
            title: Container(
              width: 20,
              height: 10,
              color: Colors.grey,
            ),
            subtitle: Container(
              width: 30,
              height: 10,
              color: Colors.grey,
            ),
            trailing: AppIconButton(
              svgPath: 'assets/svgs/drop-down-up-outline.svg',
              onPressed: () {},
            ),
          ),
        ),
        AppShimmer(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            leading: AppAvatar(),
            title: Container(
              width: 20,
              height: 10,
              color: Colors.grey,
            ),
            subtitle: Container(
              width: 30,
              height: 10,
              color: Colors.grey,
            ),
            trailing: AppIconButton(
              svgPath: 'assets/svgs/drop-down-up-outline.svg',
              onPressed: () {},
            ),
          ),
        ),
        AppShimmer(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            leading: AppAvatar(),
            title: Container(
              width: 20,
              height: 10,
              color: Colors.grey,
            ),
            subtitle: Container(
              width: 30,
              height: 10,
              color: Colors.grey,
            ),
            trailing: AppIconButton(
              svgPath: 'assets/svgs/drop-down-up-outline.svg',
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Column listInfoProject() {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: ListTile(
            horizontalTitleGap: 0,
            leading: AppIcon(svgPath: 'assets/svgs/calender-day.svg', size: 20),
            title: Text(
              DateFormat('EEEE, d MMMM y').format(work.project!.dueDate!),
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 35,
          child: ListTile(
            horizontalTitleGap: 0,
            leading: AppIcon(svgPath: 'assets/svgs/dolar.svg', size: 20),
            title: Text(
              'IDR : ${work.minSalary!} - ${work.maxSalary!}',
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
