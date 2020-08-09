import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testbloc12/blocs/news_bloc.dart';
import 'package:testbloc12/helpers/navigation.dart';
import 'package:testbloc12/models/news_model.dart';
import 'package:testbloc12/ui/description.dart';

class SearchScreen extends StatefulWidget {
  static String tag = 'search-page';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool search = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcb2026),
        centerTitle: true,
        title: Text('Search'),
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
                        hintText: 'Find it on CNN...',
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
                    child: Text('Cancel'),
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
                    child: StreamBuilder(
                      stream: bloc.allNews,
                      // ignore: missing_return
                      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        else if (snapshot.data.articles.length == 0) {
                          return buildNoContent();
                        } else if (snapshot.hasData) {
                          return buildResults(snapshot.data.articles, context);
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                      },
                    ),
                  )
                : Container(
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Recent Searches',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          padding: EdgeInsets.only(left: 15),
                        ),
                        FlatButton(
                          child: Text(
                            'Clear',
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

  void onSubmitted(String keyWord) {
    setState(() {
      search = true;
    });
    bloc.fetchAllNews(keyWord: keyWord);
  }
}

buildNoContent() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/no_result.jpeg',
          height: 90,
          width: 90,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'No search results',
          style: TextStyle(fontSize: 18),
        )
      ],
    ),
  );
}

buildResults(List<Article> articles, BuildContext context) {
  return Container(
//    height: MediaQuery.of(context).size.height * 0.75,
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            pushPage(
                context: context,
                page: DescriptionPage(articles[index].url),
                isHorizontalNavigation: true);
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
