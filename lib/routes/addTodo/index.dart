import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增事件'),
      ),
      body: Column(
        children: [
          Icon(Icons.badge),
          Icon(Icons.event),
          Icon(Icons.book),
          Icon(Icons.vertical_align_top),
          Icon(Icons.replay),
          Icon(Icons.event_available),
        ],
      ),
    );
  }
}
