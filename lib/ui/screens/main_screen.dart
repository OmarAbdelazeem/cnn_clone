import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testbloc12/res/app_assets.dart';
import 'package:testbloc12/ui/screens/saved_articles_screen.dart';
import 'package:testbloc12/ui/screens/search_screen.dart';
import 'package:testbloc12/ui/screens/settings_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> children = [
    HomeScreen(),
    SearchScreen(),
    SavedArticlesScreen(),
    SettingsScreen()
  ];

  int _selectedIndex = 0;

  PageController pageController = PageController();

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xffcb2026),
        unselectedItemColor: Colors.grey.shade500,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset(
              AppAssets.homeDark,
              height: 25,
              width: 25,
              color: Color(0xffcb2026),
            ),
            icon: SvgPicture.asset(
              AppAssets.homeLight,
              height: 25,
              width: 25,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset(
              AppAssets.searchDark,
              height: 25,
              width: 25,
              color: Color(0xffcb2026),
            ),
            icon: SvgPicture.asset(
              AppAssets.searchLight,
              height: 25,
              width: 25,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.bookmark_border,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.bookmark,
              color: Color(0xffcb2026),
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
