import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management/features/tasks/data/models/task_model.dart';

part 'get_task_response.freezed.dart';
part 'get_task_response.g.dart';

GetTodoResponse getTodoResponseFromJson(String str) =>
    GetTodoResponse.fromJson(json.decode(str));

String getTodoResponseToJson(GetTodoResponse data) =>
    json.encode(data.toJson());

@freezed
class GetTodoResponse with _$GetTodoResponse {
  const factory GetTodoResponse({
    required List<TaskModel> todos,
    required int total,
    required int skip,
    required int limit,
  }) = _GetTodoResponse;

  factory GetTodoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTodoResponseFromJson(json);
}
