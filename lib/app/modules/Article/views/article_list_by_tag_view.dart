import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/app/modules/Article/views/detail_article_view.dart';
import 'package:jobfortech2/components/AppHeaderBar/index.dart';
import 'package:jobfortech2/constant/theme.dart';

class ArticleListByTagView extends GetView {
  final String tag;
  const ArticleListByTagView(this.tag, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeaderbar(
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            children: [
              Hero(
                  tag: 'heroTag-$tag',
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        '#$tag',
                        style: AppBasicStyle(
                          fontColor: AppColor.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                  future: ArticleRepository()
                      .getArticleByTag(tag: tag.toLowerCase()),
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
                            child: ListTile(
                              onTap: () {
                                Get.to(() => DetailArticleView(
                                    article.id!, article.image!));
                              },
                              visualDensity: VisualDensity(vertical: 4),
                              contentPadding: const EdgeInsets.all(10),
                              trailing: Hero(
                                tag: 'heroTag-${article.id}',
                                child: Container(
                                  width: 100,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: AppColor.blue,
                                    image: DecorationImage(
                                      image: NetworkImage(article.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title!,
                                    style: AppBasicStyle(
                                      fontColor: AppColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ...article.tags!.map(
                                    (tag) => Hero(
                                      tag: 'heroTag-$tag',
                                      child: Chip(
                                        padding: const EdgeInsets.all(0),
                                        labelPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: -4),
                                        backgroundColor: AppColor.lightBlue,
                                        label: Text(
                                          '#$tag',
                                          style: AppBasicStyle(
                                            fontColor: AppColor.blue,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
