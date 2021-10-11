import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:testbloc12/models/news_item_model.dart';
import 'package:testbloc12/providers/articles_provider.dart';
import 'package:testbloc12/providers/provider_notifier.dart';
import 'package:testbloc12/res/app_assets.dart';
import 'package:testbloc12/routes/routes_constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItemWidget extends StatelessWidget {
  final Article article;
  ArticleItemWidget(this.article);

  @override
  Widget build(BuildContext context) {
    share() {
      final RenderBox box = context.findRenderObject();

      Share.share("${article.title}",
          subject: article.url,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }

    return ProviderNotifier(
        child: (ArticlesProvider articlesProvider){
         return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.descriptionScreen,
                  arguments: article.url);
            },
            child: Padding(
              padding: EdgeInsets.all(1),
              child: Card(
                elevation: 4,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.imagePlaceHolder),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: <Widget>[
                          article.imageUrl == null
                              ? Image.asset(AppAssets.imagePlaceHolder)
                              : Image.network(
                            article.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: 250,
                          ),
                          Positioned(
                            bottom: 20,
                            left: 5,
                            right: 5,
                            child: Container(
                              decoration:
                              BoxDecoration(color: Colors.black45),
                              child: Text(
                                article.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            timeago.format(article.publishedAt),
                            style: TextStyle(color: Color(0xffcb2026)),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: article.isSaved
                                  ? Icon(
                                Icons.bookmark,
                                color: Color(0xffcb2026),
                              )
                                  : Icon(Icons.bookmark_border),
                              onPressed: () {
                                article.isSaved
                                    ? articlesProvider
                                    .unSaveArticle(article.title)
                                    : articlesProvider
                                    .saveArticle(article);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share,
                              ),
                              onPressed:share ,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }


}
