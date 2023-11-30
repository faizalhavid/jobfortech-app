import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/app/data/repository/WorkRepo.dart';
import 'package:jobfortech2/app/modules/Article/views/article_list.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/navigation_controller.dart';
import 'package:jobfortech2/components/AppBadge/index.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
import 'package:jobfortech2/components/AppShimmer/index.dart';
import 'package:jobfortech2/components/AppStack/index.dart';
import 'package:jobfortech2/components/TableReportWork/index.dart';
import 'package:jobfortech2/constant/theme.dart';

SingleChildScrollView Dashboard() {
  final navController = Get.put(NavigationController());

  List<String> TopIndustri = [
    'Fintech',
    'Ecommerce',
    'Website',
    'Fintech',
    'Ecommerce',
    'Website',
    'Fintech',
    'Ecommerce',
    'Website'
  ];

  return SingleChildScrollView(
      child: Column(
    children: [
      AppStack(
        safearea: {'horizontal': 20, 'vertical': 20},
        spacing: 15,
        backgroundcolor: AppColor.white,
        children: [
          TextHeader(text: 'Your Progress'),
          FutureBuilder(
              future: WorkRepository().getWorkReport(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return buildReportWork(
                    workApply: snapshot.data!['workApply'] ?? 0,
                    interview: snapshot.data!['interview'] ?? 0,
                    hired: snapshot.data!['hired'] ?? 0,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          const Divider(
            color: AppColor.smoke,
            thickness: 1,
          ),
          TextHeader(text: 'Top Company'),
          buildTopIndustri(items: TopIndustri),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextHeader(text: 'Article For You'),
              TextButton(
                onPressed: () {
                  Get.to(
                    () => ArticleListView(),
                  );
                },
                child: Text(
                  'See All',
                  style: AppBasicStyle(
                    fontColor: AppColor.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: Get.width,
            height: 220,
            child: FutureBuilder(
              future: ArticleRepository().getHighlightArticle(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return AppShimmer(
                    child: Container(
                      height: 200,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.smoke,
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          width: Get.width * 0.8,
                          child: CardArticle(snapshot.data![index]));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                          width:
                              16); // Adjust the width to change the space between items
                    },
                  );
                } else {
                  return Center(
                    child: Text('Article empty'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ],
  ));
}

Text TextHeader({required String text}) {
  return Text(
    text,
    style: AppBasicStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16,
      fontColor: AppColor.black,
    ),
  );
}

SizedBox buildTopIndustri({required List<String> items}) {
  return SizedBox(
    height: 22,
    child: ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AppBadgeButton(
          onPressed: () {
            print(items[index]);
          },
          height: 2,
          width: 100,
          child: Text(
            items[index],
            overflow: TextOverflow.ellipsis,
            style: AppBasicStyle(
              fontSize: 12,
              fontColor: AppColor.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: AppColor.lightBlue,
        );
      },
      scrollDirection: Axis.horizontal,
    ),
  );
}
