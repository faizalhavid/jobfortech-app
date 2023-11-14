import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/constant/theme.dart';

import '../controllers/article_controller.dart';

class ArticleListView extends GetView<ArticleController> {
  const ArticleListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticleController());
    final article = controller.articles;
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: article.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(article.value[index].title!),
                    subtitle: Text(article.value[index].content!),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
