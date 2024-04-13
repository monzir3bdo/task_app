// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddTaskDtoImpl _$$AddTaskDtoImplFromJson(Map<String, dynamic> json) =>
    _$AddTaskDtoImpl(
      todo: json['todo'] as String,
      completed: json['completed'] as bool? ?? false,
      userId: json['userId'] as int? ?? 5,
    );

Map<String, dynamic> _$$AddTaskDtoImplToJson(_$AddTaskDtoImpl instance) =>
    <String, dynamic>{
      'todo': instance.todo,
      'completed': instance.completed,
      'userId': instance.userId,
    };
