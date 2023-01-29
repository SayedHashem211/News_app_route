import 'package:flutter/material.dart';

import '../../core/models/News.dart';

import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: CachedNetworkImage(
            imageUrl: news.urlToImage ?? "",
            height: 200,
            width: double.infinity,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Text(news.author ?? "", textAlign: TextAlign.start),
        Text(
          news.title ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        Text(news.publishedAt ?? "", textAlign: TextAlign.end)
      ],
    ));
  }
}
