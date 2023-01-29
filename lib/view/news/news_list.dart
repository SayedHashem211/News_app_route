import 'package:flutter/material.dart';
import 'package:news_app_route/core/models/NewsResponse.dart';

import '../../core/api/api_manager.dart';
import '../../core/models/Source.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(source.id ?? ""),
        builder: (buildContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error.toString()}"),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text("Server Error ${snapshot.data?.message}"),
            );
          }
          var newsList = snapshot.data?.newsList;
          return ListView.builder(
            itemBuilder: (buildContext, index) {
              return NewsItem(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );
  }
}
