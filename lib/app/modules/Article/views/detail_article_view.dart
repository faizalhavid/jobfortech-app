import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/constant/theme.dart';

class DetailArticleView extends GetView {
  final int articleId;
  final String imagePath;
  const DetailArticleView(this.articleId, this.imagePath, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'heroTag-${articleId}',
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FutureBuilder(
                  future: ArticleRepository().getArticleById(id: articleId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final Article article = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'views: ${article.views}',
                                  style: AppBasicStyle(
                                    fontSize: 12,
                                    fontColor: AppColor.grey,
                                  ),
                                ),
                                Text(
                                  'likes: ${article.likes!.length}',
                                  style: AppBasicStyle(
                                    fontSize: 12,
                                    fontColor: AppColor.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              article.title!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Published at ${DateFormat('dd MMMM yyyy').format(article.createdAt!)} ',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              article.content!,
                              style: AppBasicStyle(
                                fontSize: 13,
                                fontColor: AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
