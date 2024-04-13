import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task_dto.freezed.dart';
part 'update_task_dto.g.dart';

@unfreezed
class UpdateTaskDto with _$UpdateTaskDto {
  factory UpdateTaskDto({
    required String todo,
    required bool completed,
    required int taskId,
    @Default(5) int userId,
  }) = _UpdateTaskDto;
  UpdateTaskDto._();
  factory UpdateTaskDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskDtoFromJson(json);
  Map<String, dynamic> buildRequestBody() => {...toJson()};
}
