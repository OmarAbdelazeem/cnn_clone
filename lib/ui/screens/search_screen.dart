import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc12/bloc/articles_cubit.dart';
import 'package:testbloc12/di/app_injector.dart';
import 'package:testbloc12/models/news_item_model.dart';
import 'package:testbloc12/res/app_assets.dart';
import 'package:testbloc12/res/strings_constants.dart';
import 'package:testbloc12/routes/routes_constants.dart';
import 'package:testbloc12/ui/widgets/loading_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final newsCubit = getItInstance<ArticlesCubit>();
  TextEditingController searchController = TextEditingController();
  bool search = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onSubmitted(String keyWord) {
      setState(() {
        search = true;
      });
      newsCubit.fetchNews(keyWord: keyWord);
    }
    buildBlocBuilder() {
      return BlocBuilder<ArticlesCubit, ArticlesState>(
        bloc: newsCubit,
        builder: (context, state) {
          if (state is ArticlesLoaded) {
            if (state.articles.isEmpty) return buildNoContent();
            return buildResults(state.articles);
          } else if (state is ArticlesError) {
            return ErrorWidget(state.error);
          } else {
            return LoadingWidget();
          }
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcb2026),
        centerTitle: true,
        title: Text(StringsConstants.search),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.grey.shade300,
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
                    color: Colors.white,
                    width: 280.0,
                    height: 38,
                    child: TextField(
                      onSubmitted: onSubmitted,
                      controller: searchController,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.clear),
                          onTap: () {
                            setState(() {
                              searchController.clear();
                            });
                          },
                        ),
                        border: InputBorder.none,
                        hintText: StringsConstants.findItOnCNN,
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 5),
                  ),
                  FlatButton(
//                    color: Colors.white,
                    child: Text(StringsConstants.cancel),
                    onPressed: () {
                      setState(() {
                        search = false;
                      });
                    },
                  )
                ],
              ),
            ),
            search
                ? Expanded(
                    child: buildBlocBuilder(),
                  )
                : Container(
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            StringsConstants.recentSearches,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          padding: EdgeInsets.only(left: 15),
                        ),
                        FlatButton(
                          child: Text(
                            StringsConstants.clear,
                            style: TextStyle(color: Colors.red.shade900),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }



  buildNoContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            AppAssets.noResult,
            height: 90,
            width: 90,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            StringsConstants.noSearchResults,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  buildResults(List<Article> articles) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.descriptionScreen,
                  arguments: articles[index].url);
            },
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 35,
                      child: Text(
                        articles[index].title,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Icon(Icons.event_note)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
