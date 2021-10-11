class ItemModel {
  String status;
  int _totalResults;

  List<Article> articles = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {

    print(parsedJson['articles'].length);

    status = parsedJson['status'];

    _totalResults = parsedJson['total_results'];

    List<Article> temp = [];

    for (int i = 0; i < parsedJson['articles'].length; i++) {
      Article article = Article.fromJson(parsedJson['articles'][i]);
      temp.add(article);
    }

    articles = temp;
  }


  int get totalResults => _totalResults;
}

class Article {
  String auther;
  String title;
  String description;
  String url;
  String imageUrl;
  DateTime publishedAt;
  bool isSaved;

  Article({this.title, this.url, this.auther, this.description, this.imageUrl,this.isSaved,this.publishedAt});

  Article.fromJson(Map<String, dynamic> json) {
    auther = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    imageUrl = json['urlToImage'];
    publishedAt =  DateTime.parse(json['publishedAt']);
    isSaved = false;
  }

}

// List<Article> savedItems = List<Article>();
