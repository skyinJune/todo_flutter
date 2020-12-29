import 'package:flutter/material.dart';
import 'package:todo_flutter/routes/collection/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Text('首页'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  print('1');
                }),
            IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CollectionPage();
                  }));
                }),
            IconButton(
                icon: Icon(Icons.explore),
                onPressed: () {
                  print('1');
                }),
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  print('1');
                }),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
