import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testbloc12/ui/saved.dart';
import 'package:testbloc12/ui/search.dart';
import 'home.dart';
import 'settings.dart';

class MainPage extends StatefulWidget {
  static String tag = 'main_page';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> children = [
    HomeScreen(),
    SearchScreen(),
    SavedScreen(),
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
            selectedItemColor: Color(0xffcb2026),
            unselectedItemColor: Colors.grey.shade500,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/home_dark.svg',
                  height: 25,
                  width: 25,
                  color: Color(0xffcb2026),
                ),
                icon: SvgPicture.asset(
                  'assets/home_light.svg',
                  height: 25,
                  width: 25,
                  color: Colors.grey,
                ),
                title: Text(
                  '',
                  style: TextStyle(fontSize: 0),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/search_dark.svg',
                  height: 25,
                  width: 25,
                  color: Color(0xffcb2026),
                ),
                icon: SvgPicture.asset(
                  'assets/search_light.svg',
                  height: 25,
                  width: 25,
                  color: Colors.grey,
                ),
                title: Text(
                  '',
                  style: TextStyle(fontSize: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                  size: 30,
                ),
                title: Text('', style: TextStyle(fontSize: 0)),
                activeIcon: Icon(
                  Icons.bookmark,
                  color: Color(0xffcb2026),
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  title: Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  )),
            ],
        ),
    );
  }
}
