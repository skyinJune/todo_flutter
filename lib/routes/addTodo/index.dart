import 'package:flutter/material.dart';
import 'package:todo_flutter/common/Utility.dart';
import 'package:todo_flutter/db/todoItemDB.dart';
import 'package:todo_flutter/models/index.dart';

class AddTodoPage extends StatefulWidget {
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String _title = '';
  DateTime _todoDate = new DateTime.now();
  bool _isTop = false;
  bool _hasEndTime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增事件'),
      ),
      body: ListView(
        children: [
          TextField(
            autofocus: false,
            decoration: InputDecoration(
                hintText: '输入事件名称', prefixIcon: Icon(Icons.badge)),
            onChanged: (e) {
              setState(() {
                _title = e;
                print(_title);
              });
            },
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('目标日'),
                ),
                InkWell(
                  child: Text(
                    '${_todoDate.year}-${_todoDate.month}-${_todoDate.day} 星期${parseWeekDayToCnNum(_todoDate.weekday)}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 18),
                  ),
                  onTap: () async {
                    var _selectedDate = await _datePicker(context);
                    if (_selectedDate != null) {
                      setState(() {
                        _todoDate = _selectedDate;
                      });
                    }
                  },
                )
              ],
            ),
          ),
          ListTile(
              leading: Icon(Icons.vertical_align_top),
              title: Text('置顶'),
              trailing: Switch(
                value: _isTop,
                onChanged: (e) {
                  setState(() {
                    _isTop = e;
                  });
                },
              )),
          ListTile(
            leading: Icon(Icons.replay),
            title: Text('重复'),
          ),
          ListTile(
              leading: Icon(Icons.event_available),
              title: Text('结束时间'),
              trailing: Switch(
                value: _hasEndTime,
                onChanged: (e) {
                  setState(() {
                    _hasEndTime = e;
                  });
                },
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                minWidth: double.infinity,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  print('submit');
                  addTodoItem();
                },
                child: Text(
                  '保存',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }

  Future<DateTime> _datePicker(BuildContext context) {
    var date = new DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: DateTime(date.year + 10));
  }

  void addTodoItem() async {
    final todoItem = TodoItemModel(
        title: _title,
        createTime: new DateTime.now().millisecondsSinceEpoch,
        beginTime: _todoDate.millisecondsSinceEpoch,
        isTop: 0,
        hasEndTime: 0);
    final todoItemDb = await todoItemDB();
    await todoItemDb.insert('todo_items', todoItem.toJson());
  }
}
