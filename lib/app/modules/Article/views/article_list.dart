import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/app/modules/Article/views/article_list_by_tag_view.dart';
import 'package:jobfortech2/app/modules/Article/views/detail_article_view.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/constant/theme.dart';

import '../controllers/article_controller.dart';

class ArticleListView extends GetView<ArticleController> {
  const ArticleListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeaderbar(
          title: Text(
            "Article List",
            style: AppBasicStyle(
              fontColor: AppColor.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: FutureBuilder(
            future: ArticleRepository().getAllArticle(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final Article article = snapshot.data![index];
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColor.smoke,
                            width: 1,
                          )),
                      child: InkWell(
                        onTap: () {
                          Get.to(() =>
                              DetailArticleView(article.id!, article.image!));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Hero(
                                  tag: 'heroTag-${article.id}',
                                  child: Container(
                                    width: Get.width,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(article.image!),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.white.withOpacity(0.3),
                                            BlendMode.dstATop,
                                          ),
                                        ),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xffffffff),
                                              Color.fromARGB(0, 255, 255, 255)
                                            ],
                                            stops: [
                                              0,
                                              1
                                            ],
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            tileMode: TileMode.repeated)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: Get.width * 0.6,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          article.title!,
                                          style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        ...article.tags!.map(
                                          (tag) => Hero(
                                            tag: 'heroTag-$tag',
                                            child: ChoiceChip(
                                              padding: const EdgeInsets.all(0),
                                              labelPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: -4),
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.5),
                                              label: Text(
                                                '#$tag',
                                                style: AppBasicStyle(
                                                  fontColor: AppColor.blue,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              selected: false,
                                              onSelected: (value) {
                                                Get.to(() =>
                                                    ArticleListByTagView(tag));
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    DateFormat('EEEE, d MMMM y')
                                        .format(article.createdAt!),
                                    style: AppBasicStyle(
                                      fontColor: AppColor.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Chip(
                                        backgroundColor: AppColor.transparent,
                                        label: Text(
                                          article.likes!.length.toString(),
                                          style: AppBasicStyle(
                                            fontColor: AppColor.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        avatar: Hero(
                                          tag: 'heroLike-${article.id}',
                                          child: Icon(
                                            Icons.favorite,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      Chip(
                                        backgroundColor: AppColor.transparent,
                                        label: Text(
                                          article.views!.toString(),
                                          style: AppBasicStyle(
                                            fontColor: AppColor.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        avatar: Icon(
                                          Icons.remove_red_eye,
                                          size: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
