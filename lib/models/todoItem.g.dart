// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) {
  return TodoItem()
    ..title = json['title'] as String
    ..createTime = json['createTime'] as num
    ..beginTime = json['beginTime'] as num
    ..isTop = json['isTop'] as bool
    ..hasEndTime = json['hasEndTime'] as bool
    ..endTime = json['endTime'] as num;
}

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'title': instance.title,
      'createTime': instance.createTime,
      'beginTime': instance.beginTime,
      'isTop': instance.isTop,
      'hasEndTime': instance.hasEndTime,
      'endTime': instance.endTime
    };
