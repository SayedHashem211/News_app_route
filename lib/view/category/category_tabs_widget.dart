import 'package:flutter/material.dart';
import 'package:news_app_route/view/category/source_tab_item.dart';

import '../../core/models/Source.dart';
import '../news/news_list.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((source) => SourceTab(
                      source, widget.sources.indexOf(source) == selectedIndex))
                  .toList(),
              isScrollable: true,
            ),
            Expanded(child: NewsList(widget.sources[selectedIndex]))
          ],
        ),
      ),
    );
  }
}
