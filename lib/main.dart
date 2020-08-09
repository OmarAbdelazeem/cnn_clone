import 'package:flutter/material.dart';
import 'package:testbloc12/ui/saved.dart';
import 'package:testbloc12/ui/search.dart';
import 'package:testbloc12/ui/settings.dart';
import 'ui/MainPage.dart';
import 'ui/home.dart';
import 'ui/news_list.dart';
import 'ui/description.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    MainPage.tag: (context) => MainPage(),
    HomeScreen.tag: (context) => HomeScreen(),
    SearchScreen.tag: (context) => SearchScreen(),
    SavedScreen.tag: (context) => SavedScreen(),
    SettingsScreen.tag: (context) => SettingsScreen(),
    DescriptionPage.tag: (context) => DescriptionPage(),
    NewsList.tag: (context) => NewsList()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: routes,
    );
  }
}
