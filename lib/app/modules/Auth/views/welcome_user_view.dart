import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/controllers/welcome_user_controller.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class WelcomeUserView extends GetView {
  final String user_id;
  final String user_uuid;
  const WelcomeUserView(this.user_id, this.user_uuid, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final controller = Get.put(WelcomeUserController());
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background:
                  ImageSlider(controller.gallerySwipper, _scrollController),
            ),
            expandedHeight: Get.height,
          ),
          SliverToBoxAdapter(
            child: descriptionApp(),
          ),
        ],
      ),
    );
  }

  Container descriptionApp() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.09, vertical: Get.height * 0.05),
      decoration: BoxDecoration(
        color: AppColor.black,
      ),
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 20,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jobfortech: A job search app for developers',
                style: AppBasicStyle(
                  fontColor: AppColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Jobfortech is a job search app designed specifically for developers. The app allows developers to search for jobs, apply for jobs, and connect with potential employers.',
                style: AppBasicStyle(
                  fontColor: AppColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Features',
                style: AppBasicStyle(
                  fontColor: AppColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Jobfortech offers a number of features that make it a valuable tool for developers looking for a job. These features include:',
                style: AppBasicStyle(
                  fontColor: AppColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          ListBody(
            children: [
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 2, vertical: -2),
                leading: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 15,
                ),
                title: Text(
                  'Search for jobs by location, company, or keyword',
                  style: AppBasicStyle(
                    fontColor: AppColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 2, vertical: -2),
                leading: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 15,
                ),
                title: Text(
                  'Apply for jobs directly from the app',
                  style: AppBasicStyle(
                    fontColor: AppColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 2, vertical: -2),
                leading: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 15,
                ),
                title: Text(
                  'Connect with potential employers',
                  style: AppBasicStyle(
                    fontColor: AppColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 2, vertical: -2),
                leading: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 15,
                ),
                title: Text(
                  'Receive notifications when new jobs are posted',
                  style: AppBasicStyle(
                    fontColor: AppColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 2, vertical: -2),
                leading: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 15,
                ),
                title: Text(
                  'Save jobs to view later',
                  style: AppBasicStyle(
                    fontColor: AppColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 2, vertical: -2),
                leading: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 15,
                ),
                title: Text(
                  'Share jobs with friends and colleagues',
                  style: AppBasicStyle(
                    fontColor: AppColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 2, vertical: -2),
                leading: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 15,
                ),
                title: Text(
                  'Receive notifications when new jobs are posted',
                  style: AppBasicStyle(
                    fontColor: AppColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ImageSlider(List<Map<String, String>> gallerySwipper,
      ScrollController _scrollController) {
    return Obx(
      () => PageView.builder(
        controller: controller.pageController.value,
        itemCount: gallerySwipper.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(
                      Rect.fromLTRB(0, -140, rect.width, rect.height - 18));
                },
                blendMode: BlendMode.darken,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(gallerySwipper[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppIcon(
                      svgPath: 'assets/svgs/jobfortech-logo.svg',
                      size: 40,
                      editColor: true,
                      color: AppColor.white,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        gallerySwipper[index]['title']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      icon: const Icon(
                        Icons.keyboard_double_arrow_up_sharp,
                        size: 15,
                      ), // Replace with your icon
                      label: const Text(
                        'Swipe up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
