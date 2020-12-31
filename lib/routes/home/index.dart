import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:todo_flutter/routes/home/widgets/collectionTabBar.dart';
import 'package:todo_flutter/routes/home/widgets/exploreTabBar.dart';
import 'package:todo_flutter/routes/home/widgets/myTabBar.dart';
import 'package:todo_flutter/routes/home/widgets/todoListTabBar.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Map> _navPages = [
    {'title': '记事本', 'content': TodoListTabBar()},
    {'title': '收藏', 'content': CollectionTabBar()},
    {'title': '发现', 'content': ExploreTabBar()},
    {'title': '我的', 'content': MyTabBar()},
  ];

  final _swiperController = new SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_navPages[_selectedIndex]['title']),
      ),
      body: new Swiper(
          itemCount: _navPages.length,
          controller: _swiperController,
          loop: false,
          itemBuilder: (BuildContext context, int index) {
            return _navPages[index]['content'];
          },
          onIndexChanged: onSwiperChange),
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
    moveTo(index);
  }

  void onSwiperChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void moveTo(int index) {
    _swiperController.move(index);
  }
}
