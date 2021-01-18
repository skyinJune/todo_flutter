import 'package:json_annotation/json_annotation.dart';

part 'todoItem.g.dart';

@JsonSerializable()
class TodoItem {
  TodoItem(
      {this.title,
      this.createTime,
      this.beginTime,
      this.isTop,
      this.hasEndTime,
      this.endTime});

  String title;
  num createTime;
  num beginTime;
  bool isTop;
  bool hasEndTime;
  num endTime;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);
  Map<String, dynamic> toJson() => _$TodoItemToJson(this);
}
