import 'package:json_annotation/json_annotation.dart';

part 'todoItemModel.g.dart';

@JsonSerializable()
class TodoItemModel {
  TodoItemModel(
      {this.title,
      this.createTime,
      this.beginTime,
      this.isTop,
      this.hasEndTime,
      this.endTime});

  String title;
  num createTime;
  num beginTime;
  num isTop;
  num hasEndTime;
  num endTime;

  factory TodoItemModel.fromJson(Map<String, dynamic> json) =>
      _$TodoItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodoItemModelToJson(this);
}
