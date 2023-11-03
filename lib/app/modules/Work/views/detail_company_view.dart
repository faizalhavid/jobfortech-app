import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/data/repository/WorkRepo.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/app/modules/Work/views/image_preview_view.dart';
import 'package:jobfortech/app/modules/Work/views/work_detail_view.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/components/AppShimmer/index.dart';
import 'package:jobfortech/components/AppToast/index.dart';
import 'package:jobfortech/components/WorkCard/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class DetailCompanyView extends GetView {
  final Company company;
  const DetailCompanyView({required this.company, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkController());
    RxBool isExpanded = false.obs;
    return Scaffold(
      appBar: AppHeaderbar(
        title: Text(
          'Detail Company',
          style: AppBasicStyle(
            fontColor: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: AppSafeArea(
        safearea: {'vertical': 20, 'horizontal': 25},
        spacing: 10,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(10), // Add padding here
                  decoration: BoxDecoration(
                    color: AppColor.smoke,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      company.photo_profile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  company.name!,
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  company.founder!,
                  style: AppBasicStyle(
                    fontColor: AppColor.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: IconButton(
                  splashRadius: 25,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppColor.red,
                  ),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -3),
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Icon(
                  Icons.person_outline_sharp,
                  color: AppColor.blue,
                ),
                title: Text(
                  'Founder',
                  style: AppBasicStyle(
                    fontColor: AppColor.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  company.founder!,
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -3),
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Icon(
                  Icons.people_outline,
                  color: AppColor.blue,
                ),
                title: Text(
                  'Employees',
                  style: AppBasicStyle(
                    fontColor: AppColor.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  company.employees.toString(),
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -3),
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: AppIcon(svgPath: 'assets/svgs/location.svg', size: 20),
                title: Text(
                  'Location',
                  style: AppBasicStyle(
                    fontColor: AppColor.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  company.address!,
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColor.grey,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
          ),
          Obx(
            () => Column(
              children: [
                Text(
                  company.description!,
                  style: AppBasicStyle(
                    fontSize: 13,
                    fontColor: AppColor.grey,
                    height: 2,
                  ),
                  maxLines: isExpanded.value ? 300 : 5,
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                  onPressed: () {
                    isExpanded.value = !isExpanded.value;
                  },
                  child: Text(isExpanded.value ? 'Read Less' : 'Read More'),
                ),
              ],
            ),
          ),
          Text(
            "Gallery's Company",
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                        () => ImagePreview(imageUrl: company.photo_profile!));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, bottom: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1682686581498-5e85c7228119?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Expertise Domain',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 5,
            children: [
              ...controller.expertise.map(
                (e) => Chip(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  label: Text(e,
                      style: AppBasicStyle(
                          fontSize: 12,
                          fontColor: AppColor.blue,
                          fontWeight: FontWeight.w600)),
                  backgroundColor: AppColor.transparent,
                  side: const BorderSide(
                    color: AppColor.blue,
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Contact Information',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            dense: true,
            visualDensity: VisualDensity(horizontal: -4, vertical: -2),
            leading: const Icon(
              Icons.email_outlined,
              color: AppColor.blue,
            ),
            subtitle: Text(
              company.email!,
              style: AppBasicStyle(
                fontColor: AppColor.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            title: Text(
              'Email',
              style: AppBasicStyle(
                fontColor: AppColor.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
                splashRadius: 25,
                icon: const Icon(Icons.copy, size: 18, color: AppColor.grey),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: company.email!));
                  AppToast(message: 'Email Copied');
                }),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            visualDensity: VisualDensity(horizontal: -4, vertical: -2),
            dense: true,
            leading: const Icon(
              Icons.link_outlined,
              color: AppColor.blue,
            ),
            subtitle: Text(
              company.website!,
              style: AppBasicStyle(
                fontColor: AppColor.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            title: Text(
              'Website',
              style: AppBasicStyle(
                fontColor: AppColor.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
                splashRadius: 25,
                icon: const Icon(Icons.copy, size: 18, color: AppColor.grey),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: company.email!));
                  AppToast(message: 'Email Copied');
                }),
          ),
          Text(
            'Available Position',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 5,
              children: [
                FutureBuilder(
                    future: WorkRepository()
                        .getWorkListByCompany(companyId: company.id.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Wrap(
                          spacing: 15,
                          children: [
                            AppShimmer(
                              child: Container(
                                width: Get.width * 0.6,
                                height: Get.height * 0.1,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.whitebone,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            AppShimmer(
                              child: Container(
                                width: Get.width * 0.6,
                                height: Get.height * 0.1,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.whitebone,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            AppShimmer(
                              child: Container(
                                width: Get.width * 0.6,
                                height: Get.height * 0.1,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.whitebone,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        final List<Work> workList = snapshot.data as List<Work>;
                        return Wrap(
                          spacing: 15,
                          children: [
                            ...workList.map(
                              (e) => Container(
                                width: Get.width * 0.7,
                                height: Get.height * 0.1,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.grey.withOpacity(0.1),
                                      spreadRadius: 0.3,
                                      blurRadius: 0.3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: WorkList(e),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                            child: Text(
                          'This company has no job vacancy',
                          style: AppBasicStyle(
                              fontColor: AppColor.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ));
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  ListTile WorkList(Work e) {
    RxBool isBookmark = RxBool(e.saveStatus!);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      onTap: () {
        Get.to(() => WorkDetailView(work: e));
      },
      leading: AppAvatar(
        radius: 15,
        path: e.company?.photo_profile ?? null,
      ),
      subtitle: Text(
        e.position!,
        style: AppBasicStyle(
          fontColor: AppColor.blue,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      title: Text(
        e.company!.name!,
        style: AppBasicStyle(
          fontColor: AppColor.grey,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Obx(
        () => IconButton(
          onPressed: () async {
            isBookmark.value = !isBookmark.value;
            final response = await WorkRepository()
                .updateSaveStatus(status: isBookmark.value, id: e.id!);
          },
          icon: Icon(
            isBookmark.value
                ? Icons.bookmark_added_rounded
                : Icons.bookmark_border_rounded,
          ),
          splashRadius: 20,
          color: AppColor.blue,
        ),
      ),
    );
  }
}
