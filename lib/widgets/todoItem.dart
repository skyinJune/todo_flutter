import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {Key key,
      @required this.title,
      @required this.createTime,
      @required this.beginTime})
      : super(key: key);

  final String title;
  final DateTime createTime;
  final DateTime beginTime;

  @override
  Widget build(BuildContext context) {
    final int _diffDays = new DateTime.now().difference(beginTime).inDays;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      child: Row(
        children: [
          Chip(label: Text(title[0])),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(title + (_diffDays > 0 ? '已经' : '还有')),
              )),
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                color: Theme.of(context).accentColor,
                alignment: Alignment.center,
                child: Text('${_diffDays.abs()}'),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Theme.of(context).cardColor,
                alignment: Alignment.center,
                child: Text(
                  '天',
                ),
              )),
        ],
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
