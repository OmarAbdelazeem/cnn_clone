import 'package:flutter/cupertino.dart';

class ErrorWidget extends StatelessWidget {
  final String error;
  ErrorWidget(this.error);
  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
