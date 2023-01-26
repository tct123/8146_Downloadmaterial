// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDto _$TodoDtoFromJson(Map<String, dynamic> json) {
  return TodoDto(
    json['userId'] as int,
    json['id'] as int,
    json['title'] as String,
    json['completed'] as bool,
  );
}

Map<String, dynamic> _$TodoDtoToJson(TodoDto instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.todoId,
      'title': instance.title,
      'completed': instance.completed,
    };
