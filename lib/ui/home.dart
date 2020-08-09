import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testbloc12/helpers/navigation.dart';
import 'package:testbloc12/ui/description.dart';
import 'news_list.dart';

class HomeScreen extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  TabController _controller;
  List<Tab> tabs = [
    Tab(
      text: 'Top News',
    ),
    Tab(
      text: 'Sports',
    ),
    Tab(
      text: 'Entertainment',
    ),
    Tab(
      text: 'Health',
    ),
    Tab(
      text: 'Science',
    ),
    Tab(
      text: 'Technelogy',
    ),
  ];

  @override
  void initState() {
    _controller = TabController(length: 6, initialIndex: 0, vsync: this);
    super.initState();
  }

//  @override
//  void dispose() {
//    bloc.dispose();
//    super.dispose();
//  }

  Widget build(BuildContext context) {
    super.build(context);
    String tvUrl = 'https://www.news18.com/livetv/';
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        'Watch Tv',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        pushPage(
                            context: context,
                            page: DescriptionPage(tvUrl),
                            isHorizontalNavigation: true);
                      },
                    )
                  ],
                  title: Image.asset(
                    'assets/cnn.png',
                    scale: 9,
                    fit: BoxFit.cover,
                  ),
                  backgroundColor: Color(0xffcb2026),
                  bottom: TabBar(
                    isScrollable: true,
                    controller: _controller,
                    tabs: tabs,
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    NewsList(1),
                    NewsList(2),
                    NewsList(3),
                    NewsList(4),
                    NewsList(5),
                    NewsList(6),
                  ],
                  controller: _controller,
                ),
              )),
    );
  }
}
