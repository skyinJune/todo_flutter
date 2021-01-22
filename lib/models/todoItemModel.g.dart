// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItemModel _$TodoItemModelFromJson(Map<String, dynamic> json) {
  return TodoItemModel()
    ..title = json['title'] as String
    ..createTime = json['createTime'] as num
    ..beginTime = json['beginTime'] as num
    ..isTop = json['isTop'] as num
    ..hasEndTime = json['hasEndTime'] as num
    ..endTime = json['endTime'] as num;
}

Map<String, dynamic> _$TodoItemModelToJson(TodoItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'createTime': instance.createTime,
      'beginTime': instance.beginTime,
      'isTop': instance.isTop,
      'hasEndTime': instance.hasEndTime,
      'endTime': instance.endTime
    };
