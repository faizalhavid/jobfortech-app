import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/app/modules/Article/controllers/article_controller.dart';
import 'package:jobfortech2/app/modules/Article/views/article_list_by_tag_view.dart';
import 'package:jobfortech2/components/AppToast/index.dart';
import 'package:jobfortech2/constant/theme.dart';
import 'package:like_button/like_button.dart';

class DetailArticleView extends GetView {
  final int articleId;
  final String imagePath;
  const DetailArticleView(this.articleId, this.imagePath, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticleController(articleId: articleId));
    return Scaffold(
      floatingActionButton: floatinglLikeButton(controller),
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
                  future: controller.dataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final Article article = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headerArticle(article),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              article.title!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              children: article.tags!
                                  .map(
                                    (tag) => Hero(
                                      tag: 'heroTag-$tag',
                                      child: ChoiceChip(
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
                                        selected: false,
                                        onSelected: (value) {
                                          Get.to(
                                            () => ArticleListByTagView(tag),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                  .toList(),
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

  Widget floatinglLikeButton(ArticleController controller) {
    return Obx(
      () => FloatingActionButton(
        onPressed: () {},
        heroTag: 'heroLike-${articleId}',
        backgroundColor:
            controller.isLike.value ? AppColor.lightRed : AppColor.smoke,
        enableFeedback: true,
        elevation: 0,
        child: LikeButton(
          isLiked: controller.isLike.value,
          onTap: (bool value) async {
            controller.dataFuture;
            bool newValue = !value;
            if (newValue) {
              await ArticleRepository()
                  .patchLikeArticle(id: articleId, like: newValue);
              AppToast(message: 'You like this article');
            } else {
              await ArticleRepository()
                  .patchLikeArticle(id: articleId, like: newValue);
              AppToast(message: 'You dislike this article');
            }
            return newValue;
          },
          size: 25,
          circleColor: const CircleColor(
            start: AppColor.blue,
            end: AppColor.blue,
          ),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: AppColor.red,
            dotSecondaryColor: AppColor.orange,
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite,
              color: isLiked ? AppColor.red : AppColor.grey,
              size: 25,
            );
          },
        ),
      ),
    );
  }

  Container headerArticle(Article article) {
    return Container(
      width: Get.width * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              const Icon(
                Icons.remove_red_eye,
                size: 15,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${article.views} views',
                style: AppBasicStyle(
                  fontSize: 12,
                  fontColor: AppColor.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.favorite,
                size: 15,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${article.likes!.length} likes',
                style: AppBasicStyle(
                  fontSize: 12,
                  fontColor: AppColor.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
