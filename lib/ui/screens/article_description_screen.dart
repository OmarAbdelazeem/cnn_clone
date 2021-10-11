import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDescriptionScreen extends StatelessWidget {
  final String urlNews;
  ArticleDescriptionScreen(this.urlNews);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcb2026),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: urlNews,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
