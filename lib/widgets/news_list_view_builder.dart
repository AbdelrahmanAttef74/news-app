import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/services/news_services.dart';

import 'news_list_view.dart';

class NewsListVirewBuilder extends StatefulWidget {
  const NewsListVirewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListVirewBuilder> createState() => _NewsListVirewBuilderState();
}

class _NewsListVirewBuilderState extends State<NewsListVirewBuilder> {
  var futur;
  @override
  void initState() {
    super.initState();
    futur = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticaleModel>>(
      future: futur,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articales: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('oop there was an error'),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
