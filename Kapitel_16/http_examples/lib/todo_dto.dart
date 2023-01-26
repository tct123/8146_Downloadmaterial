import 'package:json_annotation/json_annotation.dart';

part 'todo_dto.g.dart';

@JsonSerializable()
class TodoDto {
  TodoDto(
    this.userId,
    this.todoId,
    this.title,
    this.completed,
  );

  factory TodoDto.fromJson(Map<String, dynamic> json) => _$TodoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoDtoToJson(this);

  final int userId;
  @JsonKey(name: 'id')
  final int todoId;
  final String title;
  final bool completed;
}
