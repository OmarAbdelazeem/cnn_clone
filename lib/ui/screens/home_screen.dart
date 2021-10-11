import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testbloc12/bloc/articles_cubit.dart';
import 'package:testbloc12/di/app_injector.dart';
import 'package:testbloc12/res/app_assets.dart';
import 'package:testbloc12/res/strings_constants.dart';
import 'package:testbloc12/routes/routes_constants.dart';
import 'package:testbloc12/ui/screens/articles_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _controller;
  List<Tab> tabs = [
    Tab(
      text: StringsConstants.topNews,
    ),
    Tab(
      text: StringsConstants.sports,
    ),
    Tab(
      text: StringsConstants.entertainment,
    ),
    Tab(
      text: StringsConstants.health,
    ),
    Tab(
      text: StringsConstants.science,
    ),
    Tab(
      text: StringsConstants.technology,
    ),
  ];

  @override
  void initState() {
    _controller = TabController(length: 6, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            child: Text(
              StringsConstants.watchTv,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.descriptionScreen,
                  arguments: getItInstance<ArticlesCubit>().getTvUrl());
            },
          )
        ],
        title: Image.asset(
          AppAssets.cnnLogo,
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
          ArticlesScreen(1),
          ArticlesScreen(2),
          ArticlesScreen(3),
          ArticlesScreen(4),
          ArticlesScreen(5),
          ArticlesScreen(6),
        ],
        controller: _controller,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
