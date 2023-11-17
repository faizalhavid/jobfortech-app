import 'package:flutter/material.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

Table buildReportJob(
    {required String project,
    required String outsource,
    required List skills}) {
  return Table(
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    columnWidths: const {
      0: FlexColumnWidth(1),
      1: FlexColumnWidth(1),
      2: FlexColumnWidth(1),
    },
    children: [
      TableRow(
        children: [
          Text(
            'Project',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text(
            'Outsource',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text(
            'Skills',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ],
      ),
      TableRow(children: [
        Text(
          project,
          style: AppBasicStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          outsource,
          style: AppBasicStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 15),
            height: 60,
            child: Stack(children: [
              ...skills.take(4).map((skill) {
                double leftPosition = 0.0;
                leftPosition += skills.indexOf(skill) * 15;
                return Positioned(
                  left: leftPosition,
                  child: AppSkillsIcon(skill: skill),
                );
              }).toList(),
              if (skills.length > 4)
                Positioned(
                  left: skills.take(4).length * 15,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: AppColor.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColor.blue, width: 1),
                    ),
                    child: Center(
                      child: Text(
                        '+${skills.length - 4}',
                        style: AppBasicStyle(
                          fontColor: AppColor.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
            ]))
      ]),
    ],
  );
}

Widget buildReportWork(
    {required int workApply, required int interview, required int hired}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Applyed',
            style: AppBasicStyle(
                fontColor: AppColor.black,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
          Text(
            workApply.toString(),
            style: AppBasicStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Interviewed',
          style: AppBasicStyle(
              fontColor: AppColor.black,
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
        Text(
          interview.toString(),
          style: AppBasicStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Hired',
          style: AppBasicStyle(
              fontColor: AppColor.black,
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
        Text(
          hired.toString(),
          style: AppBasicStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
      ]),
    ],
  );
}
