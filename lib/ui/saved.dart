import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testbloc12/helpers/navigation.dart';
import 'package:testbloc12/models/news_model.dart';
import 'package:testbloc12/ui/description.dart';

class SavedScreen extends StatefulWidget {
  static const String tag = 'saved-page';

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  int _currentIndex;

  @override
  Widget build(BuildContext context) {
//    print('savedItems 0 ${savedItems[0].title}');
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xffcb2026),
        title: Text('Saved Stories'),
        centerTitle: true,
      ),
      body: savedItems.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) {
//                _currentIndex = index;
                return SavedItem(
                  article: savedItems[index],
                  deleteItem: () => deleteItem(index),
                );
              },
              itemCount: savedItems.length,
            )
          : Container(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/saved.png',
                      width: 200,
                      height: 200,
                    ),
                    Image.asset('assets/saved2.jpeg')
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () => dialogueToDelete(context, deleteAllItems, true),
        backgroundColor: Colors.red.shade800,
      ),
    );
  }

  void deleteItem(int itemIndex) {
    setState(() {
      _currentIndex = itemIndex;
      savedItems.removeAt(itemIndex);
    });
  }

  void deleteAllItems() {
    setState(() {
      savedItems = [];
    });
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
      onTap: (){
        pushPage(context: context,isHorizontalNavigation: true,page: DescriptionPage(article.url));
      },
      child: Card(
        child: ListTile(
          leading: article.imageUrl == null
              ? Image.asset('assets/loading_image.png')
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
                        onTap: () => dialogueToDelete(context, deleteItem, false),
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
  String keyWord = all ? 'all' : 'this';
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Remove Article"),
          content: Text("Are you sure you want to remove $keyWord article?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(
                "Remove",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                deleteItem();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Cancel", style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
