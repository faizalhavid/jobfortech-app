import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/app/modules/Work/views/detail_participants_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkDetailView extends GetView {
  final Work work;
  const WorkDetailView({Key? key, required this.work}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkController());
    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Detail Work',
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: AppButton(
          backgroundColor: AppColor.lightOrange,
          child: Text(
            'Apply Now',
            style: AppBasicStyle(
                fontColor: AppColor.orange, fontWeight: FontWeight.bold),
          ),
          suffix: AppIcon(svgPath: 'assets/svgs/time-2.svg', size: 20),
          onPressed: () {},
        ),
      ),
      body: AppSafeArea(
        safearea: {'horizontal': 20, 'vertical': 20},
        children: [
          Text(
            work.project!.name!,
            style: AppTitleHeader,
          ),
          Text(
            work.position!,
            style: AppBasicStyle(
              fontColor: AppColor.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            leading: Image.asset(
              'assets/images/company-2.png',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            title: Text(
              work.company!.name!,
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: AppIconButton(
              svgPath: 'assets/svgs/drop-down-up-outline.svg',
              onPressed: () {},
            ),
          ),
          Text(
            work.project!.details!,
            style: AppBasicStyle(
              fontSize: 13,
              fontColor: AppColor.grey,
              height: 2,
            ),
            maxLines: 8,
          ),
          Text(
            'Skill Required :',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 8,
            children: [
              for (var tecnology in work.technology!)
                Container(
                  height: 34,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Chip(
                    label: Text(
                      tecnology,
                      style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    backgroundColor: AppColor.transparent,
                  ),
                ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 35,
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: AppIcon(
                      svgPath: 'assets/svgs/calender-day.svg', size: 20),
                  title: Text(
                    'Posted on ${work.publishDate!.day}/${work.publishDate!.month}/${work.publishDate!.year}',
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
              SizedBox(
                height: 35,
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading:
                      AppIcon(svgPath: 'assets/svgs/location.svg', size: 20),
                  title: Text(
                    work.location!,
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
          ),
          Text(
            'Team Profile :',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Wrap(
            children: [
              FutureBuilder<List<User>>(
                future:
                    controller.fetchParticipants(work.project!.participants!),
                builder:
                    (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return participantsLoading();
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'));
                  } else {
                    return Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
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
                              user.profile!
                                  .position!, // replace with actual data fields
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
                    );
                  }
                },
              )
            ],
          )
        ],
      ),
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
}
