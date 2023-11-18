import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/app/modules/Article/views/article_list_by_tag_view.dart';
import 'package:jobfortech2/app/modules/Article/views/detail_article_view.dart';
import 'package:jobfortech2/components/AppCard/index.dart';
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
                    return SizedBox(width: 80, child: CardArticle(article));
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
