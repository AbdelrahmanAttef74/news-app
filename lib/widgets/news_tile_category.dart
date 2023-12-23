import 'package:flutter/material.dart';
import 'package:news_app/models/articale_model.dart';

class NewsTileCategory extends StatelessWidget {
  const NewsTileCategory({super.key, required this.articaleModel});
  final ArticaleModel articaleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        children: [
//?? null operator is used to check if the left side ==null do left side
          Image.network(articaleModel.image ??
              'https://cdn.abcotvs.com/dip/images/13772640_091223-wpvi-generic-chopper-6-img.jpg?w=1600'),
          Text(
            articaleModel.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            articaleModel.subTitle ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
