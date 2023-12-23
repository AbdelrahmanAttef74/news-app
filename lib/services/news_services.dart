import 'package:dio/dio.dart';
import 'package:news_app/models/articale_model.dart';

class NewsServices {
  NewsServices(this.dio);
  final Dio dio;
//here we make http get request to get top headline general data

  Future<List<ArticaleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=499606a4206f4eb688385b24a11e4701&category=$category');
      //here we create variable of map data type "jsonData" to save the request.data on it
      Map<String, dynamic> jsonData = response.data;
      //we need to print the list of dynamic "articles" and save it in a variable
      List<dynamic> articales = jsonData['articles'];
      /*to convert from list of maps 'articales'to list of ArticalModel
    we need to do this ;
    */
      List<ArticaleModel> articalesList = [];
      for (var artical in articales) {
        ArticaleModel articaleModel = ArticaleModel.fromJson(artical);
        /*we made object of ArticaleModel
        and give the value to its attribute by the element we loop 'articale';*/
        //--------------------------------------------------
        // ArticaleModel articaleModel = ArticaleModel(
        //     image: artical['urlToImage'],
        //     title: artical['title'],
        //     subTitle: artical['description']);
        articalesList.add(articaleModel);
      }
      return articalesList;
    } catch (e) {
      return [];
    }
  }
}
