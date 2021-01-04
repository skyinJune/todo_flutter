import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/todoItem.dart';

class TodoListTabBar extends StatefulWidget {
  _TodoListTabBarState createState() => _TodoListTabBarState();
}

class _TodoListTabBarState extends State<TodoListTabBar>
    with AutomaticKeepAliveClientMixin {
  int _count = 2;
  @override
  bool get wantKeepAlive => true;
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(
            title: '初始标题',
            createTime: new DateTime.now(),
          );
        },
        itemCount: _count,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
