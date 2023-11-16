import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ArticleListByTagView extends GetView {
  final String tag;
  const ArticleListByTagView(this.tag, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            tag,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => const ArticleListByTagView(''));
                  },
                  visualDensity: const VisualDensity(vertical: 4),
                  contentPadding: const EdgeInsets.all(10),
                  trailing: Container(
                    width: 100,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1622835047087-4b3b8a5b5b0f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ0aWNsZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    'Article Title',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Article Subtitle',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
