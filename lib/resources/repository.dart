
import 'news_api_provider.dart';


class Repository {
  final newsApiProvider = NewsApiProvider();

   fetchAllNews(int id,[String keyWord]) => newsApiProvider.fetchNewsList(id,keyWord);

}