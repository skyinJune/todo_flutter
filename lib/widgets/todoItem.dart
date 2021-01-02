import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      child: Row(
        children: [Chip(label: Text('A')), Text('标题')],
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
