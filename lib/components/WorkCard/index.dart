import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/data/models/Work.dart';
import 'package:jobfortech/app/modules/Work/controllers/work_controller.dart';
import 'package:jobfortech/components/AppAvatar/index.dart';
import 'package:jobfortech/components/AppButton/index.dart';
import 'package:jobfortech/components/AppCard/index.dart';
import 'package:jobfortech/constant/theme.dart';

Ink WorkCard({
  required Work work,
  void Function()? onTap,
  required WorkController controller,
}) {
  String salary = '';
  if (work.minSalary != null && work.maxSalary != null) {
    if (work.minSalary! >= 1000000 && work.maxSalary! >= 1000000) {
      salary =
          'Rp${(work.minSalary! / 1000000).toStringAsFixed(1).replaceAll('.0', '')} - Rp${(work.maxSalary! / 1000000).toStringAsFixed(1).replaceAll('.0', '')} jt';
    } else if (work.minSalary! >= 100000 && work.maxSalary! >= 100000) {
      salary =
          'Rp${(work.minSalary! / 100000 * 100).toStringAsFixed(0)} - Rp${(work.maxSalary! / 100000 * 100).toStringAsFixed(0)}';
    } else {
      salary = 'Rp$work.minSalary - Rp$work.maxSalary';
    }
  }

  return AppCard(
    width: 230,
    radius: 15,
    spacing: 15,
    color: AppColor.white,
    onTap: onTap,
    boxShadow: [
      BoxShadow(
        color: AppColor.grey.withOpacity(0.2),
        spreadRadius: 0.2,
        blurRadius: 5,
        offset: Offset(0, 0),
      ),
    ],
    children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: AppAvatar(
                  radius: 20,
                  path: work.company?.photo_profile ?? null,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                width: Get.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${work.company!.name!}',
                      style: AppBasicStyle(
                        fontColor: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${work.company!.user_profile?.firstName!}',
                      style: AppBasicStyle(
                        fontColor: AppColor.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(
            () => IconButton(
              onPressed: () {
                controller.isSaved.value = !controller.isSaved.value;
              },
              icon: Icon(controller.isSaved.value
                  ? Icons.bookmark_added_rounded
                  : Icons.bookmark_border_rounded),
              splashRadius: 20,
              color: AppColor.blue,
            ),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 170,
            child: Text(
              work.position!,
              style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            work.project!.name!,
            style: AppBasicStyle(
              fontColor: AppColor.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            work.description!,
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w600),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      Wrap(spacing: 5, runSpacing: 8, children: [
        for (var tecnology in work.technology!.take(7))
          Container(
            height: 34,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Chip(
              label: Text(tecnology),
              backgroundColor: AppColor.transparent,
            ),
          ),
        work.technology!.length > 7
            ? Container(
                height: 34,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Chip(
                  label: Text(
                    '+${work.technology!.length - 7}',
                    style: AppBasicStyle(
                      fontColor: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: AppColor.transparent,
                ),
              )
            : Container(),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                salary,
                style: AppBasicStyle(
                  fontColor: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Work ${work.jobType!}',
                style: AppBasicStyle(
                  fontColor: AppColor.grey.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 45,
            child: AppButton(
              backgroundColor: AppColor.blue,
              child: Text(
                'Apply',
                style: AppBasicStyle(
                  fontColor: AppColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              suffix: Icon(
                Icons.arrow_circle_right_outlined,
                color: AppColor.white,
                size: 13,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    ],
  );
}
