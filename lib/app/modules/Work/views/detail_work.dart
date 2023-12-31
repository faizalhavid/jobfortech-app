import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:jobfortech/app/data/models/User.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';
import 'package:jobfortech/app/modules/Work/controllers/application_controller.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/app/modules/Work/views/detail_company_view.dart';
import 'package:jobfortech/app/modules/Work/views/detail_participants_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/components/AppToast/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class WorkDetailView extends GetView {
  final Work work;
  const WorkDetailView({Key? key, required this.work}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aplController = Get.find<ApplicationController>();
    final controller = Get.put(WorkController());

    return RefreshIndicator(
      onRefresh: () async {
        WorkRepository().getAplication(id: work.id);
        WorkRepository().getAplication(id: work.id);
      },
      child: Scaffold(
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
        body: AppSafeArea(
          safearea: {'horizontal': 20, 'vertical': 20},
          spacing: 10,
          children: [
            headerCompany(),
            qualification(),
            workDescription(),
            Text(
              'Skill Required :',
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            skills(),
            listInfoWork(),
            const SizedBox(height: 15),
            Text(
              'Team Profile :',
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            participant(controller),
            const SizedBox(height: 15),
            FutureBuilder(
              future: WorkRepository().getAplication(id: work.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return AppShimmer(
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29),
                              color: Colors.grey)));
                } else if (snapshot.hasData) {
                  return snapshot.data!.status == 'Applied'
                      ? Container(
                          height: 50,
                          width: Get.width,
                          child: AppButton(
                            child: Text(
                              'Applied',
                              style: AppBasicStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontColor: AppColor.orange,
                              ),
                            ),
                            onPressed: () {
                              AppToast(
                                  message: 'You have applied for this job !');
                            },
                            backgroundColor: AppColor.lightOrange,
                            overlayColor: AppColor.orange.withOpacity(0.2),
                            suffix: AppIcon(
                              svgPath: 'assets/svgs/time-2.svg',
                              size: 20,
                            ),
                          ),
                        )
                      : Container(
                          height: 50,
                          width: Get.width,
                          child: AppButton(
                            child: Text(
                              'Apply',
                              style: AppBasicStyle(
                                fontSize: 12,
                                fontColor: AppColor.white,
                              ),
                            ),
                            onPressed: () {
                              if (aplController.isAgree.value &&
                                  aplController.isAgree2.value) {
                                EasyLoading.show(status: 'Loading...');
                                WorkRepository()
                                    .aplicationWork(id: work.id)
                                    .then((value) {
                                  EasyLoading.dismiss();
                                  AppToast(message: 'Success');
                                }).catchError((e) {
                                  EasyLoading.dismiss();
                                  AppToast(message: 'Error');
                                });
                              } else {
                                AppToast(
                                    message: 'Please agree to the terms !');
                              }
                            },
                            backgroundColor: AppColor.smoke,
                            suffix: aplController.suffix.value,
                          ),
                        );
                } else {
                  if (aplController.isAgree.value &&
                      aplController.isAgree2.value) {
                    aplController.buttonColor.value = AppColor.blue;
                    aplController.textButton.value = 'Apply';
                    aplController.message.value =
                        'Congratulation, you have applied for this job !';
                    aplController.textColor.value = AppColor.white;
                    aplController.overlayButton.value =
                        AppColor.blue.withOpacity(0.2);
                    aplController.suffix.value = null;
                  } else {
                    aplController.buttonColor.value = AppColor.smoke;
                    aplController.textButton.value = 'Apply';
                    aplController.message.value =
                        'You have agree to the terms and conditions !';
                    aplController.textColor.value = AppColor.grey;
                    aplController.overlayButton.value = AppColor.grey;
                    aplController.suffix.value = null;
                  }
                  return Obx(
                    () => Column(
                      children: [
                        buildCheckbox(
                          title:
                              'I have read and agree to the terms and conditions',
                          controller: aplController.isAgree2,
                        ),
                        buildCheckbox(
                          title: 'I have read and agree to the privacy policy',
                          controller: aplController.isAgree,
                        ),
                        Container(
                          height: 50,
                          width: Get.width,
                          child: AppButton(
                            child: Text(
                              'Apply',
                              style: AppBasicStyle(
                                  fontSize: 12,
                                  fontColor: aplController.isAgree.value &&
                                          aplController.isAgree2.value
                                      ? AppColor.white
                                      : AppColor.grey),
                            ),
                            onPressed: () {
                              if (aplController.isAgree.value &&
                                  aplController.isAgree2.value) {
                                EasyLoading.show(status: 'Loading...');
                                WorkRepository()
                                    .aplicationWork(id: work.id)
                                    .then((value) {
                                  EasyLoading.dismiss();
                                  AppToast(message: 'Success');
                                }).catchError((e) {
                                  print(e);
                                  EasyLoading.dismiss();
                                  AppToast(message: 'Error');
                                });
                              } else {
                                AppToast(
                                    message: 'Please agree to the terms !');
                              }
                            },
                            backgroundColor: aplController.isAgree.value &&
                                    aplController.isAgree2.value
                                ? AppColor.blue
                                : AppColor.smoke,
                            suffix: aplController.isAgree.value &&
                                    aplController.isAgree2.value
                                ? Icon(Icons.verified_outlined,
                                    size: 20, color: AppColor.white)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Wrap participant(WorkController controller) {
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
              return Center(child: Text('Something went wrong'));
            }
          },
        )
      ],
    );
  }

  Wrap skills() {
    return Wrap(
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
    );
  }

  Column workDescription() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Work Description :',
        style: AppBasicStyle(
          fontColor: AppColor.black,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      ...work.description!
          .map((e) => SizedBox(
                width: Get.width * 0.8,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -2),
                  leading: Text('•'),
                  title: Text(
                    e,
                    style: AppBasicStyle(
                      fontColor: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ))
          .toList(),
    ]);
  }

  Column qualification() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Qualification :',
        style: AppBasicStyle(
          fontColor: AppColor.black,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      ...work.qualifications
              ?.map((e) => SizedBox(
                    width: Get.width * 0.8,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -2),
                      leading: Text('•'),
                      title: Text(
                        e,
                        style: AppBasicStyle(
                          fontColor: AppColor.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ))
              .toList() ??
          [],
    ]);
  }

  Widget buildCheckbox({
    required String title,
    required RxBool controller,
  }) {
    return SizedBox(
      height: 50,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: AppColor.blue,
        checkColor: AppColor.white,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        checkboxSemanticLabel: 'Agree to the terms and conditions',
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: AppBasicStyle(
            fontColor: AppColor.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: controller.value,
        onChanged: (value) {
          controller.value = value!;
        },
      ),
    );
  }

  Column listInfoWork() {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: ListTile(
            horizontalTitleGap: 0,
            leading: AppIcon(svgPath: 'assets/svgs/calender-day.svg', size: 20),
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
            leading: AppIcon(svgPath: 'assets/svgs/location.svg', size: 20),
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
    );
  }

  ListTile headerCompany() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        Get.to(() => DetailCompanyView(company: work.company!));
      },
      leading: AppAvatar(
        path: work.company!.photo_profile,
        radius: 25,
      ),
      title: Text(
        work.position!,
        style: AppBasicStyle(
          fontSize: 16,
          fontColor: AppColor.black,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              work.company!.name!,
              style: AppBasicStyle(
                fontColor: AppColor.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              work.company!.address!,
              style: AppBasicStyle(
                fontColor: AppColor.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      trailing: const Icon(
        Icons.verified,
        size: 20,
        color: AppColor.blue,
      ),
    );
  }

  Container participantHasData(AsyncSnapshot<List<User>> snapshot) {
    return Container(
        height: 150,
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
        ));
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
