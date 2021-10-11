import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final title;

  CustomTextButton(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          child: Container(
            width: double.infinity,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.normal,),
            ),
          ),
          onPressed: () {},
        ),
        Divider(thickness:2 ,height: 1,),
      ],
    );
  }
}