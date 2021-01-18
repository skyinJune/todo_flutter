import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> todoItemDB() async {
  return openDatabase(
    join(await getDatabasesPath(), 'todo_item.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE todo_items(id INTEGER PRIMARY KEY, title TEXT, createTime INTEGER, beginTime INTEGER, isTop BOOLEAN, hasEndTime BOOLEAN, endTime INTEGER)');
    },
    version: 1,
  );
}
