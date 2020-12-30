import 'package:flutter/material.dart';
import 'package:todo_flutter/routes/collection/index.dart';
import 'package:todo_flutter/routes/explore/index.dart';
import 'package:todo_flutter/routes/home/index.dart';
import 'package:todo_flutter/routes/my/index.dart';

class TabBarNav extends StatefulWidget {
  _TabBarNavState createState() => _TabBarNavState();
}

class _TabBarNavState extends State<TabBarNav> {
  int _selectedIndex = 0;
  List<Widget> _navPages = [];

  @override
  void initState() {
    super.initState();
    _navPages.addAll([HomePage(), CollectionPage(), ExplorePage(), MyPage()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '收藏'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onItemTap,
      ),
    );
  }

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
