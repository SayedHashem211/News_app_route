import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_route/core/models/NewsResponse.dart';
import 'package:news_app_route/core/models/SourcesResponse.dart';



class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = '69bef2124cac4192a144e335174fa17e';


  // get sources

  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      // parameters
      'apiKey': apiKey,
      'category': categoryId
    });

    var response = await http.get(url);
    // var bodyString = response.body;
    // var json = jsonDecode(bodyString);

    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews(String sourceId) async{
    https://newsapi.org/v2/everything?apiKey=69bef2124cac4192a144e335174fa17e&sources=bbc-sport
   
    var url = Uri.https(baseUrl , 'v2/everything' , {
      'apiKey':apiKey,
      'sources' :sourceId
    });
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }


}


//  https://newsapi.org
//  /v2/top-headlines/sources?
//  apiKey=69bef2124cac4192a144e335174fa17e
