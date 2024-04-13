import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    required int id,
    required String todo,
    required bool completed,
    required int userId,
  }) = _TaskModel;
  TaskModel._();
  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> buildRequestBody() => {...toJson()};
}
