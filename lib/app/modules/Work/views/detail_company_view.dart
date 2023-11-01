import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/components/AppHeaderBar/index.dart';
import 'package:jobfortech/components/AppSafeArea/index.dart';
import 'package:jobfortech/constant/icons.dart';
import 'package:jobfortech/constant/theme.dart';

class DetailCompanyView extends GetView {
  final Company company;
  const DetailCompanyView({required this.company, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkController());
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
        spacing: 20,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.smoke,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(company.photo_profile!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                company.name!,
                style: AppBasicStyle(
                  fontColor: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
          ListBody(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Icon(
                  Icons.person_outline_sharp,
                  color: AppColor.blue,
                ),
                title: Text(
                  company.founder!,
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Icon(
                  Icons.people_outline,
                  color: AppColor.blue,
                ),
                title: Text(
                  company.employees!.toString(),
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: AppIcon(svgPath: 'assets/svgs/location.svg', size: 20),
                title: Text(
                  company.address!,
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Text(
            company.description!,
            style: AppBasicStyle(
              fontSize: 13,
              fontColor: AppColor.grey,
              height: 2,
            ),
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          ),
          ListBody(
            children: [
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
                leading: const Icon(
                  Icons.email_outlined,
                  color: AppColor.blue,
                ),
                title: Text(
                  company.email!,
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Icon(
                  Icons.link_outlined,
                  color: AppColor.blue,
                ),
                title: Text(
                  company.website!,
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Available Position',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
