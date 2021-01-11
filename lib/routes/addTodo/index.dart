import 'package:flutter/material.dart';
import 'package:todo_flutter/common/Utility.dart';

class AddTodoPage extends StatefulWidget {
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String _title = '';
  DateTime _todoDate = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增事件'),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
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
          Icon(Icons.book),
          Icon(Icons.vertical_align_top),
          Icon(Icons.replay),
          Icon(Icons.event_available),
        ],
      ),
    );
  }
}

Future<DateTime> _datePicker(BuildContext context) {
  var date = new DateTime.now();
  return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: DateTime(2030));
}
