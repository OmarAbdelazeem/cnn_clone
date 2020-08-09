import 'package:flutter/material.dart';

void pushPage(
    {BuildContext context,
      bool isHorizontalNavigation,
      Widget page}
    ) {
  // If it's not horizontal navigation,
  // we should use the rootNavigator.
  Navigator.of(
    context,
    rootNavigator: !isHorizontalNavigation,
  ).push(
    MaterialPageRoute(
      builder: (context) => page,
      // Flutter will use the fullscreenDialog property to change the
      // animation and the app bar's left icon to an X instead of an arrow.
      fullscreenDialog: !isHorizontalNavigation,
    ),
  );
}