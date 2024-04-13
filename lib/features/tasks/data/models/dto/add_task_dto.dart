import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_task_dto.freezed.dart';
part 'add_task_dto.g.dart';

@unfreezed
class AddTaskDto with _$AddTaskDto {
  factory AddTaskDto({
    required String todo,
    @Default(false) bool completed,
    @Default(5) int userId,
  }) = _AddTaskDto;
  AddTaskDto._();
  factory AddTaskDto.fromJson(Map<String, dynamic> json) =>
      _$AddTaskDtoFromJson(json);
  Map<String, dynamic> buildRequestBody() => {...toJson()};
}
