import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:testbloc12/helpers/navigation.dart';
import 'package:testbloc12/models/news_model.dart';
import 'package:testbloc12/ui/description.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItemWidget extends StatefulWidget {
  final Article article;

  NewsItemWidget({this.article});

  @override
  _NewsItemWidgetState createState() => _NewsItemWidgetState();
}

class _NewsItemWidgetState extends State<NewsItemWidget> {
  bool isSaved ;

  @override
  void initState() {
    isSaved = widget.article.isSaved;

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var url = widget.article.url;
        pushPage(
            page: DescriptionPage(url),
            context: context,
            isHorizontalNavigation: true);
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
                        image: AssetImage("assets/loading_image.png"),
                        fit: BoxFit.cover),
                ),
                child: Stack(
                  children: <Widget>[
                    widget.article.imageUrl == null
                        ? Image.asset("assets/loading_image.png")
                        : Image.network(widget.article.imageUrl,  width: double.infinity,
                      fit: BoxFit.cover,
                      height: 250,),
                    Positioned(
                      bottom: 20,
                      left: 5,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black45
                        ),
                        child: Text(
                          widget.article.title,
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
                      timeago.format(widget.article.publishedAt),
                      style: TextStyle(color: Color(0xffcb2026)),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: isSaved
                            ? Icon(
                                Icons.bookmark,
                                color: Color(0xffcb2026),
                              )
                            : Icon(Icons.bookmark_border),
                        onPressed: () {
                          setState(() {
                            isSaved
                                ? savedItems.remove(widget.article)
                                : savedItems.add(
                                    widget.article,
                                  );

                            isSaved = !isSaved;
                          });

                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                        ),
                        onPressed: ()=>share(context, widget.article),
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
  }
  share(BuildContext context, Article article) {
    final RenderBox box = context.findRenderObject();

    Share.share("${article.title}",
        subject: article.url,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
