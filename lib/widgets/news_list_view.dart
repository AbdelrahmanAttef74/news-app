import 'package:flutter/material.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/widgets/news_tile_category.dart';

class NewsListView extends StatelessWidget {
  final List<ArticaleModel> articales;

  const NewsListView({super.key, required this.articales});
  @override
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articales.length,
        (context, index) {
          return NewsTileCategory(
            articaleModel: articales[index],
          );
        },
      ),
    );
  }
}
