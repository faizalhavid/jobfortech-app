import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jobfortech2/app/data/models/Article.dart';
import 'package:jobfortech2/app/data/models/User.dart';
import 'package:jobfortech2/app/data/repository/ArticleRepo.dart';
import 'package:jobfortech2/app/data/repository/UserRepo.dart';

class ArticleController extends GetxController {
  RxBool isLike = RxBool(false);
  final secureStorage = FlutterSecureStorage();
  final int articleId;
  ArticleController({required this.articleId});
  late Future<Article> dataFuture;

  @override
  void onInit() {
    checkLike(id: articleId);
    dataFuture = ArticleRepository().getArticleById(id: articleId);
    super.onInit();
  }

  void checkLike({required int id}) async {
    final userId = await secureStorage.read(key: 'id');
    final Article article = await ArticleRepository().getArticleById(id: id);
    article.likes!.contains(int.parse(userId!))
        ? isLike.value = true
        : isLike.value = false;
  }
}
