import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testbloc12/di/app_injector.dart';
import 'package:testbloc12/models/news_item_model.dart';
import 'package:testbloc12/providers/articles_provider.dart';
import 'package:testbloc12/repositories/news_api_repository.dart';
part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesInitial());
  final _newsApiRepository = getItInstance<NewsApiRepository>();
  final _articlesProvider = getItInstance<ArticlesProvider>();
  List<Article> articles = [];

  void fetchNews({int id, String keyWord}) async {
    emit(ArticlesLoading());
    try {
      final newsData = await _newsApiRepository.fetchNewsList(id, keyWord);
      ItemModel item = ItemModel.fromJson(newsData);
      articles = item.articles;
      _articlesProvider.setArticles = articles;
      emit(ArticlesLoaded(articles));
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }

  getTvUrl(){
    return _newsApiRepository.getTvUrl();
  }
}
