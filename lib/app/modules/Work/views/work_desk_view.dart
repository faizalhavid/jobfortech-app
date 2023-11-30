import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Work.dart';
import 'package:jobfortech2/app/data/repository/WorkRepo.dart';
import 'package:jobfortech2/app/modules/Project/views/project_desk_view.dart';
import 'package:jobfortech2/app/modules/Work/views/detail_work.dart';
import 'package:jobfortech2/app/modules/Work/views/work_list.dart';
import 'package:jobfortech2/components/AppButton/index.dart';
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
          length: 3,
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
                        Get.to(() => WorkListView());
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
                    text: "Project Desk",
                  ),
                  Tab(
                    icon: Icon(Icons.work),
                    text: "Applied",
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
                        future: WorkRepository().getAcceptWork(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print('data' + snapshot.data.toString());
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
                                    return ProjectCard(workData, index);
                                  },
                                ),
                              ),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Center(
                              child: Text('No Data'),
                            );
                          }
                        }),
                    FutureBuilder(
                        future: WorkRepository().getAppliedWork(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
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
                          if (snapshot.hasData) {
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

  ListTile ProjectCard(List<Work> workData, int index) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(workData[index].company!.photo_profile!),
      ),
      title: Text(
        workData[index].project!.name!,
        style: AppBasicStyle(
          fontSize: 14,
          fontColor: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        workData[index].company!.name!,
        style: AppBasicStyle(
          fontSize: 12,
          fontColor: AppColor.grey,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Due Date',
            style: AppBasicStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontColor: AppColor.grey),
          ),
          Text(
            DateFormat('dd MMM yyyy').format(workData[index].project!.dueDate!),
            style: AppBasicStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontColor: AppColor.grey),
          ),
        ],
      ),
      onTap: () {
        Get.to(() => ProjectDeskView(), arguments: workData[index]);
      },
    );
  }
}
