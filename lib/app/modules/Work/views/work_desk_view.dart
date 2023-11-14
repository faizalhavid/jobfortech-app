import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Work.dart';
import 'package:jobfortech2/app/data/repository/WorkRepo.dart';
import 'package:jobfortech2/app/modules/Work/views/detail_work.dart';

import 'package:jobfortech2/app/modules/Work/views/my_work_view.dart';
import 'package:jobfortech2/app/modules/Work/views/work_list.dart';
import 'package:jobfortech2/app/modules/Work/views/work_search_view.dart';
import 'package:jobfortech2/components/AppButton/index.dart';
import 'package:jobfortech2/components/AppSafeArea/index.dart';
import 'package:jobfortech2/components/WorkCard/index.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class WorkDeskView extends GetView {
  const WorkDeskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Work Desk',
                    style: AppBasicStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.width * 0.41,
                    height: 40,
                    child: AppButton(
                      type: 'outline',
                      outlineColor: AppColor.transparent,
                      child: Text(
                        'Find Work',
                        style: AppBasicStyle(
                            fontSize: 14,
                            fontColor: AppColor.osean,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Get.to(() => SearchWokView());
                      },
                      suffix: AppIconButton(
                        svgPath: 'assets/svgs/zoom-in.svg',
                        size: 20,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              ButtonsTabBar(
                backgroundColor: AppColor.blue,
                unselectedBackgroundColor: AppColor.transparent,
                unselectedLabelStyle: AppBasicStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontColor: AppColor.grey),
                labelStyle: AppBasicStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontColor: AppColor.white),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.work),
                    text: "Applied Work",
                  ),
                  Tab(
                    icon: Icon(Icons.bookmark_added),
                    text: "Bookmark",
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    FutureBuilder(
                        future: WorkRepository().getAppliedWork(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            print(snapshot.data);
                            final workData = snapshot.data as List<Work>;
                            return Container(
                              child: OverflowBox(
                                alignment: Alignment.center,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: Get.height * 0.02,
                                    );
                                  },
                                  itemCount: workData.length,
                                  itemBuilder: (context, index) {
                                    return WorkCard(
                                      work: workData[index],
                                      simplify: true,
                                      onTap: () {
                                        Get.to(() => WorkDetailView(
                                              work: workData[index],
                                            ));
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                            ;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                    FutureBuilder(
                        future: WorkRepository().getBookmark(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            print(snapshot.data);
                            final workData = snapshot.data as List<Work>;
                            return ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: Get.height * 0.02,
                                );
                              },
                              itemCount: workData.length,
                              itemBuilder: (context, index) {
                                return WorkCard(
                                  work: workData[index],
                                  simplify: true,
                                  onTap: () {
                                    Get.to(() => WorkDetailView(
                                          work: workData[index],
                                        ));
                                  },
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
