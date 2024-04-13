// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_task_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetTodoResponse _$GetTodoResponseFromJson(Map<String, dynamic> json) {
  return _GetTodoResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTodoResponse {
  List<TaskModel> get todos => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTodoResponseCopyWith<GetTodoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTodoResponseCopyWith<$Res> {
  factory $GetTodoResponseCopyWith(
          GetTodoResponse value, $Res Function(GetTodoResponse) then) =
      _$GetTodoResponseCopyWithImpl<$Res, GetTodoResponse>;
  @useResult
  $Res call({List<TaskModel> todos, int total, int skip, int limit});
}

/// @nodoc
class _$GetTodoResponseCopyWithImpl<$Res, $Val extends GetTodoResponse>
    implements $GetTodoResponseCopyWith<$Res> {
  _$GetTodoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTodoResponseImplCopyWith<$Res>
    implements $GetTodoResponseCopyWith<$Res> {
  factory _$$GetTodoResponseImplCopyWith(_$GetTodoResponseImpl value,
          $Res Function(_$GetTodoResponseImpl) then) =
      __$$GetTodoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TaskModel> todos, int total, int skip, int limit});
}

/// @nodoc
class __$$GetTodoResponseImplCopyWithImpl<$Res>
    extends _$GetTodoResponseCopyWithImpl<$Res, _$GetTodoResponseImpl>
    implements _$$GetTodoResponseImplCopyWith<$Res> {
  __$$GetTodoResponseImplCopyWithImpl(
      _$GetTodoResponseImpl _value, $Res Function(_$GetTodoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(_$GetTodoResponseImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTodoResponseImpl implements _GetTodoResponse {
  const _$GetTodoResponseImpl(
      {required final List<TaskModel> todos,
      required this.total,
      required this.skip,
      required this.limit})
      : _todos = todos;

  factory _$GetTodoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetTodoResponseImplFromJson(json);

  final List<TaskModel> _todos;
  @override
  List<TaskModel> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final int total;
  @override
  final int skip;
  @override
  final int limit;

  @override
  String toString() {
    return 'GetTodoResponse(todos: $todos, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTodoResponseImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todos), total, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTodoResponseImplCopyWith<_$GetTodoResponseImpl> get copyWith =>
      __$$GetTodoResponseImplCopyWithImpl<_$GetTodoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTodoResponseImplToJson(
      this,
    );
  }
}

abstract class _GetTodoResponse implements GetTodoResponse {
  const factory _GetTodoResponse(
      {required final List<TaskModel> todos,
      required final int total,
      required final int skip,
      required final int limit}) = _$GetTodoResponseImpl;

  factory _GetTodoResponse.fromJson(Map<String, dynamic> json) =
      _$GetTodoResponseImpl.fromJson;

  @override
  List<TaskModel> get todos;
  @override
  int get total;
  @override
  int get skip;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$GetTodoResponseImplCopyWith<_$GetTodoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
