import 'package:flutter/material.dart';
import 'package:testbloc12/routes/router.dart' as router;
import 'package:testbloc12/ui/screens/main_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      onGenerateRoute: router.generateRoute,
      // routes: routes,
    );
  }
}
