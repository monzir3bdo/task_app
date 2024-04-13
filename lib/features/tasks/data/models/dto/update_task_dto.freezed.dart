// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateTaskDto _$UpdateTaskDtoFromJson(Map<String, dynamic> json) {
  return _UpdateTaskDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateTaskDto {
  String get todo => throw _privateConstructorUsedError;
  set todo(String value) => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  set completed(bool value) => throw _privateConstructorUsedError;
  int get taskId => throw _privateConstructorUsedError;
  set taskId(int value) => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  set userId(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTaskDtoCopyWith<UpdateTaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskDtoCopyWith<$Res> {
  factory $UpdateTaskDtoCopyWith(
          UpdateTaskDto value, $Res Function(UpdateTaskDto) then) =
      _$UpdateTaskDtoCopyWithImpl<$Res, UpdateTaskDto>;
  @useResult
  $Res call({String todo, bool completed, int taskId, int userId});
}

/// @nodoc
class _$UpdateTaskDtoCopyWithImpl<$Res, $Val extends UpdateTaskDto>
    implements $UpdateTaskDtoCopyWith<$Res> {
  _$UpdateTaskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
    Object? completed = null,
    Object? taskId = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTaskDtoImplCopyWith<$Res>
    implements $UpdateTaskDtoCopyWith<$Res> {
  factory _$$UpdateTaskDtoImplCopyWith(
          _$UpdateTaskDtoImpl value, $Res Function(_$UpdateTaskDtoImpl) then) =
      __$$UpdateTaskDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String todo, bool completed, int taskId, int userId});
}

/// @nodoc
class __$$UpdateTaskDtoImplCopyWithImpl<$Res>
    extends _$UpdateTaskDtoCopyWithImpl<$Res, _$UpdateTaskDtoImpl>
    implements _$$UpdateTaskDtoImplCopyWith<$Res> {
  __$$UpdateTaskDtoImplCopyWithImpl(
      _$UpdateTaskDtoImpl _value, $Res Function(_$UpdateTaskDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
    Object? completed = null,
    Object? taskId = null,
    Object? userId = null,
  }) {
    return _then(_$UpdateTaskDtoImpl(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTaskDtoImpl extends _UpdateTaskDto {
  _$UpdateTaskDtoImpl(
      {required this.todo,
      required this.completed,
      required this.taskId,
      this.userId = 5})
      : super._();

  factory _$UpdateTaskDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTaskDtoImplFromJson(json);

  @override
  String todo;
  @override
  bool completed;
  @override
  int taskId;
  @override
  @JsonKey()
  int userId;

  @override
  String toString() {
    return 'UpdateTaskDto(todo: $todo, completed: $completed, taskId: $taskId, userId: $userId)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTaskDtoImplCopyWith<_$UpdateTaskDtoImpl> get copyWith =>
      __$$UpdateTaskDtoImplCopyWithImpl<_$UpdateTaskDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTaskDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateTaskDto extends UpdateTaskDto {
  factory _UpdateTaskDto(
      {required String todo,
      required bool completed,
      required int taskId,
      int userId}) = _$UpdateTaskDtoImpl;
  _UpdateTaskDto._() : super._();

  factory _UpdateTaskDto.fromJson(Map<String, dynamic> json) =
      _$UpdateTaskDtoImpl.fromJson;

  @override
  String get todo;
  set todo(String value);
  @override
  bool get completed;
  set completed(bool value);
  @override
  int get taskId;
  set taskId(int value);
  @override
  int get userId;
  set userId(int value);
  @override
  @JsonKey(ignore: true)
  _$$UpdateTaskDtoImplCopyWith<_$UpdateTaskDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
