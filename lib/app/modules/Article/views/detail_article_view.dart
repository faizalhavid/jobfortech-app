import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';

class DetailArticleView extends GetView {
  final int articleId;
  const DetailArticleView(this.articleId, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ArticleRepository().getArticleById(id: articleId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Article article = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'heroTag-${article.id}',
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(article.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          DateFormat('dd MMMM yyyy').format(article.createdAt!),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          article.content!,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
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
    );
  }
}
