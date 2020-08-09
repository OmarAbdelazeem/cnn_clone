import 'package:testbloc12/models/news_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = 'c4b678a468fc46e499df1aad3b98b714';
  final _baseUrl = "https://newsapi.org/v2/";

   fetchNewsList(int id,[String keyWord]) async {
    print("entered");
    String url;

    if(keyWord!=null){
      url = _baseUrl + "everything?q=$keyWord&apiKey=" + _apiKey;
    }
    else{
     switch(id){
       case 1:
         url = _baseUrl + "top-headlines?country=us&apiKey=" + _apiKey;
         break;
       case 2:
         url = _baseUrl + "everything?q=sports&apiKey=" + _apiKey;
         break;
       case 3:
         url = _baseUrl + "everything?q=entertainment&apiKey=" + _apiKey;
         break;
       case 4:
         url = _baseUrl + "everything?q=health&apiKey=" + _apiKey;
         break;
       case 5:
         url = _baseUrl + "everything?q=science&apiKey=" + _apiKey;
          break;
       case 6:
         url = _baseUrl + "everything?q=apple&apiKey=" + _apiKey;
         break;
     }
    }

    final response = await client.get(url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
//      return parsed;
      return ItemModel.fromJson(parsed);

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}
