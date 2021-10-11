import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testbloc12/di/app_injector.dart';
import 'package:testbloc12/models/news_item_model.dart';
import 'package:testbloc12/providers/articles_provider.dart';
import 'package:testbloc12/providers/provider_notifier.dart';
import 'package:testbloc12/res/app_assets.dart';
import 'package:testbloc12/res/strings_constants.dart';
import 'package:testbloc12/routes/routes_constants.dart';

class SavedArticlesScreen extends StatefulWidget {
  @override
  _SavedArticlesScreenState createState() => _SavedArticlesScreenState();
}

class _SavedArticlesScreenState extends State<SavedArticlesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xffcb2026),
        title: Text(StringsConstants.savedStories),
        centerTitle: true,
      ),
      body: ProviderNotifier(
        child: (ArticlesProvider articlesProvider) {

          return articlesProvider.savedArticles.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return SavedItem(
                      article: articlesProvider.savedArticles[index],
                      deleteItem: () => articlesProvider.unSaveArticle(
                          articlesProvider.savedArticles[index].title),
                    );
                  },
                  itemCount: articlesProvider.savedArticles.length,
                )
              : Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          AppAssets.saved,
                          width: 200,
                          height: 200,
                        ),
                        // Image.asset(AppAssets.saved2)
                      ],
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () => dialogueToDelete(context,
            getItInstance<ArticlesProvider>().deleteAllSavedArticles, true),
        backgroundColor: Colors.red.shade800,
      ),
    );
  }
}

class SavedItem extends StatelessWidget {
  final Article article;
  final Function deleteItem;

  SavedItem({this.article, this.deleteItem});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.descriptionScreen,
            arguments: article.url);
      },
      child: Card(
        child: ListTile(
          leading: article.imageUrl == null
              ? Image.asset(AppAssets.imagePlaceHolder)
              : Image.network(article.imageUrl),
          title: Container(
            width: double.infinity,
            child: Text(article.title),
          ),
          subtitle: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(DateFormat("dd-MM-yyyy").format(now)),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () =>
                            dialogueToDelete(context, deleteItem, false),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Icon(Icons.share),
                        onTap: () {
                          print('share');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

dialogueToDelete(BuildContext context, Function deleteItem, bool all) {
  String keyWord = all ? StringsConstants.all : StringsConstants.thisWord;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(StringsConstants.removeArticle),
          content: Text("${StringsConstants.removeSentence} $keyWord ${StringsConstants.article}?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(
                StringsConstants.remove,
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                deleteItem();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(StringsConstants.cancel, style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
