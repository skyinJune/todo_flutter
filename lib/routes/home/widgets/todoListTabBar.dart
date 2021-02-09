import 'package:flutter/material.dart';
import 'package:todo_flutter/db/todoItemDB.dart';
import 'package:todo_flutter/models/index.dart';
import 'package:todo_flutter/routes/addTodo/index.dart';
import 'package:todo_flutter/widgets/todoItem.dart';

class TodoListTabBar extends StatefulWidget {
  _TodoListTabBarState createState() => _TodoListTabBarState();
}

class _TodoListTabBarState extends State<TodoListTabBar>
    with AutomaticKeepAliveClientMixin {
  List<TodoItemModel> _todoItemList = [];
  @override
  bool get wantKeepAlive => false;
  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (_todoItemList.length == 0) {
            return Container(
              padding: EdgeInsets.all(17),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          } else {
            return TodoItem(
              title: _todoItemList[index].title,
              createTime: DateTime.fromMillisecondsSinceEpoch(
                  _todoItemList[index].createTime),
              beginTime: DateTime.fromMillisecondsSinceEpoch(
                  _todoItemList[index].beginTime),
            );
          }
        },
        itemCount: _todoItemList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTodoPage();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> fetchData() async {
    final db = await todoItemDB();
    final List<Map<String, dynamic>> maps = await db.query('todo_items');
    var list = List.generate(
        maps.length, (index) => TodoItemModel.fromJson(maps[index]));
    setState(() {
      _todoItemList = list;
    });
  }
}
