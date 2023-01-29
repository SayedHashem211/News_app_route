import 'package:flutter/material.dart';

import '../../core/api/api_manager.dart';
import '../../core/components/category_grid_view.dart';
import '../../core/models/SourcesResponse.dart';
import 'category_tabs_widget.dart';

class CategoryNewsList extends StatelessWidget {
  Category category;

  CategoryNewsList(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(category.categoryID),
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
          var sources = snapshot.data?.sources;
          return CategoryTabsWidget(sources!);
        },
      ),
    );
  }
}
