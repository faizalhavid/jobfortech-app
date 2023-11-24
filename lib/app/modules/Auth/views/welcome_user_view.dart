import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/modules/Auth/views/login_view.dart';
import 'package:jobfortech2/constant/icons.dart';
import 'package:jobfortech2/constant/theme.dart';

class WelcomeUserView extends StatefulWidget {
  final String user_id;
  final String user_uuid;

  const WelcomeUserView(this.user_id, this.user_uuid, {Key? key})
      : super(key: key);

  @override
  _WelcomeUserViewState createState() => _WelcomeUserViewState();
}

class _WelcomeUserViewState extends State<WelcomeUserView> {
  final ScrollController _scrollController = ScrollController();
  final PageController pageController = PageController();
  final PageController companyController = PageController();
  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  Timer timerCompany = Timer.periodic(const Duration(seconds: 1), (timer) {});
  final List<Map<String, String>> gallerySwipper = [
    {
      'title': 'Welcome to JobForTech',
      'image':
          'https://images.unsplash.com/photo-1596003906949-67221c37965c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Easy To Search Job',
      'image':
          'https://images.unsplash.com/photo-1444653389962-8149286c578a?q=80&w=864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Be Professional Developer',
      'image':
          'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Collaborate With Team',
      'image':
          'https://images.unsplash.com/photo-1537511446984-935f663eb1f4?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Get Your Dream Job',
      'image':
          'https://images.unsplash.com/photo-1628348068343-c6a848d2b6dd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];
  bool swipeUp = false;
  final List<String> comapanySlider = [
    'assets/images/company1.png',
    'assets/images/company2.png',
    'assets/images/company3.png',
    'assets/images/company4.png',
    'assets/images/company5.png',
    'assets/images/company6.png',
    'assets/images/company7.png',
    'assets/images/company8.png',
  ];

  void caraouselSlider() {
    pageController.addListener(() {
      if (pageController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        timer.cancel();
        timer = Timer.periodic(const Duration(seconds: 2), (timer) {
          if (pageController.page?.round() == gallerySwipper.length - 1) {
            Get.offAll(() => LoginView());
            timer.cancel();
          } else {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          }
        });
      } else {
        timer.cancel();
        timer = Timer.periodic(const Duration(seconds: 2), (timer) {
          if (pageController.page?.round() == gallerySwipper.length - 1) {
            Get.offAll(() => LoginView());
            timer.cancel();
          } else {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          }
        });
      }
    });
  }

  void companyCaraouselSlider() {
    timerCompany = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (companyController.page?.round() == comapanySlider.length - 1) {
        companyController.jumpToPage(0);
      } else {
        companyController.nextPage(
          duration: Duration.zero,
          curve: Curves.slowMiddle,
        );
      }
    });
  }

  void listenerSwipeUp() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          companyCaraouselSlider();
          swipeUp = true;
        });
      } else {
        setState(() {
          swipeUp = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    caraouselSlider();
    listenerSwipeUp();
  }

  @override
  Widget build(BuildContext context) {
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
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: ImageSlider(),
            ),
            expandedHeight: Get.height * 0.92,
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                descriptionApp(),
                Positioned(
                  left: 0,
                  right: 0,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        swipeUp = !swipeUp;
                        if (swipeUp) {
                          timer.cancel();
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                        } else {
                          _scrollController.animateTo(
                            _scrollController.position.minScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                          caraouselSlider();
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    icon: Icon(
                      swipeUp
                          ? Icons.keyboard_double_arrow_down_sharp
                          : Icons.keyboard_double_arrow_up_sharp,
                      size: 15,
                    ), // Replace with your icon
                    label: Text(
                      swipeUp ? 'Swipe down' : 'Swipe up',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                  'Search for jobs by position, company, or keyword',
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
          Text(
            'Top Companies',
            style: AppBasicStyle(
              fontColor: AppColor.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5),
            width: Get.width,
            height: 100,
            padding: EdgeInsets.all(10),
            child: PageView.builder(
              controller: companyController,
              itemCount: comapanySlider.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        comapanySlider[index],
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget ImageSlider() {
    return PageView.builder(
      controller: pageController,
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
