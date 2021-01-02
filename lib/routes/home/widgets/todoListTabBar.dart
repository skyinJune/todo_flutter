import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/todoItem.dart';

class TodoListTabBar extends StatefulWidget {
  _TodoListTabBarState createState() => _TodoListTabBarState();
}

class _TodoListTabBarState extends State<TodoListTabBar> {
  int _count = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TodoItem();
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
