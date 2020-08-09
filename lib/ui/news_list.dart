import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testbloc12/blocs/news_bloc.dart';
import 'package:testbloc12/widgets/news_item_widget.dart';

import '../models/news_model.dart';


class NewsList extends StatefulWidget {
  static String tag = "NewsFeedPage-tag";

  NewsList([this.id]);

  final int id;

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {


  @override
  void initState() {
    bloc.fetchAllNews(id: widget.id);
    super.initState();
  }


  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        color: Colors.white,
        child: StreamBuilder(
          stream: bloc.allNews,
          builder: (context, AsyncSnapshot <ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot.data.articles);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  buildList(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return NewsItemWidget(
          article: articles[index],
        );
      },
    );
  }
}
