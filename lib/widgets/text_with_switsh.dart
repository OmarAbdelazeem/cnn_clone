import 'package:flutter/material.dart';

class TextWithSwitch extends StatelessWidget {
  final title;

  TextWithSwitch(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title),
              Switch(
                value: true,
                onChanged: null,
              )
            ],
          ),
        ),
        Divider(height: 1,thickness: 2,)
      ],
    );
  }
}