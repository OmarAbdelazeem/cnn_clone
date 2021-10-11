import 'package:flutter/cupertino.dart';
import 'package:testbloc12/models/news_item_model.dart';

class ArticlesProvider extends ChangeNotifier {
  List<Article> _savedArticles = [];
  List<Article> _allArticles = [];

  void saveArticle(Article article) {
    _savedArticles.add(article);
    int articleIndex = _getArticleIndex(article.title);
    if (articleIndex >= 0) _allArticles[articleIndex].isSaved = true;
    notifyListeners();
  }

  void unSaveArticle(String articleTitle) {
    _savedArticles.removeWhere((article) => article.title == articleTitle);
    int articleIndex = _getArticleIndex(articleTitle);
    if (articleIndex >= 0) _allArticles[articleIndex].isSaved = false;
    notifyListeners();
  }

  void deleteAllSavedArticles() {
    _savedArticles.forEach((savedArticle) {
      int articleIndex = _getArticleIndex(savedArticle.title);
      if (articleIndex >= 0) _allArticles[articleIndex].isSaved = false;
    });
    _savedArticles = [];
    notifyListeners();
  }

  set setArticles(List<Article> articles) {
    _allArticles = articles;
    notifyListeners();
  }

  List<Article> get savedArticles => _savedArticles;

  get allArticles => _allArticles;

  int _getArticleIndex(String articleTitle) {
    int index =
        _allArticles.indexWhere((element) => articleTitle == element.title);
    return index;
  }
}
