import 'package:flutter/material.dart';
import 'package:testbloc12/routes/routes_constants.dart';
import 'package:testbloc12/ui/screens/articles_screen.dart';
import 'package:testbloc12/ui/screens/article_description_screen.dart';
import 'package:testbloc12/ui/screens/home_screen.dart';
import 'package:testbloc12/ui/screens/main_screen.dart';
import 'package:testbloc12/ui/screens/saved_articles_screen.dart';
import 'package:testbloc12/ui/screens/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.descriptionScreen:
      var arguments = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ArticleDescriptionScreen(arguments));
    case Routes.homeScreen :
      return MaterialPageRoute(
          builder: (context) => HomeScreen());
    case Routes.mainScreen:
        return MaterialPageRoute(
            builder: (context) => MainScreen());
    case Routes.newsScreen:
      return MaterialPageRoute(
          builder: (context) => ArticlesScreen());
    case Routes.savedScreen :
      return MaterialPageRoute(
          builder: (context) => SavedArticlesScreen());
      case Routes.searchScreen :
      return MaterialPageRoute(
          builder: (context) => SearchScreen());

  }
}
