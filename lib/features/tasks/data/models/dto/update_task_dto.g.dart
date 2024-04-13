// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateTaskDtoImpl _$$UpdateTaskDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateTaskDtoImpl(
      todo: json['todo'] as String,
      completed: json['completed'] as bool,
      taskId: json['taskId'] as int,
      userId: json['userId'] as int? ?? 5,
    );

Map<String, dynamic> _$$UpdateTaskDtoImplToJson(_$UpdateTaskDtoImpl instance) =>
    <String, dynamic>{
      'todo': instance.todo,
      'completed': instance.completed,
      'taskId': instance.taskId,
      'userId': instance.userId,
    };
