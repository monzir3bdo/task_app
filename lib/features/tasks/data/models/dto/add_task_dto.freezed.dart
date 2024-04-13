// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddTaskDto _$AddTaskDtoFromJson(Map<String, dynamic> json) {
  return _AddTaskDto.fromJson(json);
}

/// @nodoc
mixin _$AddTaskDto {
  String get todo => throw _privateConstructorUsedError;
  set todo(String value) => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  set completed(bool value) => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  set userId(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddTaskDtoCopyWith<AddTaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTaskDtoCopyWith<$Res> {
  factory $AddTaskDtoCopyWith(
          AddTaskDto value, $Res Function(AddTaskDto) then) =
      _$AddTaskDtoCopyWithImpl<$Res, AddTaskDto>;
  @useResult
  $Res call({String todo, bool completed, int userId});
}

/// @nodoc
class _$AddTaskDtoCopyWithImpl<$Res, $Val extends AddTaskDto>
    implements $AddTaskDtoCopyWith<$Res> {
  _$AddTaskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
    Object? completed = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddTaskDtoImplCopyWith<$Res>
    implements $AddTaskDtoCopyWith<$Res> {
  factory _$$AddTaskDtoImplCopyWith(
          _$AddTaskDtoImpl value, $Res Function(_$AddTaskDtoImpl) then) =
      __$$AddTaskDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String todo, bool completed, int userId});
}

/// @nodoc
class __$$AddTaskDtoImplCopyWithImpl<$Res>
    extends _$AddTaskDtoCopyWithImpl<$Res, _$AddTaskDtoImpl>
    implements _$$AddTaskDtoImplCopyWith<$Res> {
  __$$AddTaskDtoImplCopyWithImpl(
      _$AddTaskDtoImpl _value, $Res Function(_$AddTaskDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
    Object? completed = null,
    Object? userId = null,
  }) {
    return _then(_$AddTaskDtoImpl(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddTaskDtoImpl extends _AddTaskDto {
  _$AddTaskDtoImpl(
      {required this.todo, this.completed = false, this.userId = 5})
      : super._();

  factory _$AddTaskDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddTaskDtoImplFromJson(json);

  @override
  String todo;
  @override
  @JsonKey()
  bool completed;
  @override
  @JsonKey()
  int userId;

  @override
  String toString() {
    return 'AddTaskDto(todo: $todo, completed: $completed, userId: $userId)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTaskDtoImplCopyWith<_$AddTaskDtoImpl> get copyWith =>
      __$$AddTaskDtoImplCopyWithImpl<_$AddTaskDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddTaskDtoImplToJson(
      this,
    );
  }
}

abstract class _AddTaskDto extends AddTaskDto {
  factory _AddTaskDto({required String todo, bool completed, int userId}) =
      _$AddTaskDtoImpl;
  _AddTaskDto._() : super._();

  factory _AddTaskDto.fromJson(Map<String, dynamic> json) =
      _$AddTaskDtoImpl.fromJson;

  @override
  String get todo;
  set todo(String value);
  @override
  bool get completed;
  set completed(bool value);
  @override
  int get userId;
  set userId(int value);
  @override
  @JsonKey(ignore: true)
  _$$AddTaskDtoImplCopyWith<_$AddTaskDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
