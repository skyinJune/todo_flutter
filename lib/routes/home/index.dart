import 'package:flutter/material.dart';
import 'package:todo_flutter/routes/home/widgets/collectionTabBar.dart';
import 'package:todo_flutter/routes/home/widgets/exploreTabBar.dart';
import 'package:todo_flutter/routes/home/widgets/myTabBar.dart';
import 'package:todo_flutter/routes/home/widgets/todoListTabBar.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  final List _navPageMapList = [
    {'title': '首页', 'page': TodoListTabBar(), 'icon': Icon(Icons.home)},
    {'title': '收藏', 'page': CollectionTabBar(), 'icon': Icon(Icons.star)},
    {'title': '发现', 'page': ExploreTabBar(), 'icon': Icon(Icons.explore)},
    {'title': '我的', 'page': MyTabBar(), 'icon': Icon(Icons.person)},
  ];
  List<Widget> _pageList = [];
  List<String> _titleList = [];
  List<BottomNavigationBarItem> _bottomNavItemList = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _selectedIndex);
    _pageList.addAll(_navPageMapList.map((e) => e['page']));
    _titleList.addAll(_navPageMapList.map((e) => e['title']));
    _bottomNavItemList.addAll(_navPageMapList.map(
        (e) => BottomNavigationBarItem(icon: e['icon'], label: e['title'])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList[_selectedIndex]),
      ),
      body: PageView(
        controller: _controller,
        children: _pageList,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItemList,
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
    _controller.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
