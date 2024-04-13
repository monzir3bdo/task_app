// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTodoResponseImpl _$$GetTodoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetTodoResponseImpl(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      skip: json['skip'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$$GetTodoResponseImplToJson(
        _$GetTodoResponseImpl instance) =>
    <String, dynamic>{
      'todos': instance.todos,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
