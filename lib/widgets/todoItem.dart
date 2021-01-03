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
        children: [
          Chip(label: Text('A')),
          Expanded(
              flex: 5,
              child: Container(
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text('标题已经'),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: Theme.of(context).accentColor,
                alignment: Alignment.center,
                child: Text('10'),
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Theme.of(context).cardColor,
                alignment: Alignment.center,
                child: Text('天'),
              )),
        ],
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
