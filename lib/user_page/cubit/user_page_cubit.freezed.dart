// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPageState {
  String get errorMessage => throw _privateConstructorUsedError;

  int get currentPage => throw _privateConstructorUsedError;

  int get readLoad => throw _privateConstructorUsedError;

  List<String> get users => throw _privateConstructorUsedError;

  FormzSubmissionStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPageStateCopyWith<UserPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPageStateCopyWith<$Res> {
  factory $UserPageStateCopyWith(
          UserPageState value, $Res Function(UserPageState) then) =
      _$UserPageStateCopyWithImpl<$Res, UserPageState>;

  @useResult
  $Res call(
      {String errorMessage,
      int currentPage,
      int readLoad,
      List<String> users,
      FormzSubmissionStatus status});
}

/// @nodoc
class _$UserPageStateCopyWithImpl<$Res, $Val extends UserPageState>
    implements $UserPageStateCopyWith<$Res> {
  _$UserPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? currentPage = null,
    Object? readLoad = null,
    Object? users = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      readLoad: null == readLoad
          ? _value.readLoad
          : readLoad // ignore: cast_nullable_to_non_nullable
              as int,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPageStateeCopyWith<$Res>
    implements $UserPageStateCopyWith<$Res> {
  factory _$$_UserPageStateeCopyWith(
          _$_UserPageStatee value, $Res Function(_$_UserPageStatee) then) =
      __$$_UserPageStateeCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String errorMessage,
      int currentPage,
      int readLoad,
      List<String> users,
      FormzSubmissionStatus status});
}

/// @nodoc
class __$$_UserPageStateeCopyWithImpl<$Res>
    extends _$UserPageStateCopyWithImpl<$Res, _$_UserPageStatee>
    implements _$$_UserPageStateeCopyWith<$Res> {
  __$$_UserPageStateeCopyWithImpl(
      _$_UserPageStatee _value, $Res Function(_$_UserPageStatee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? currentPage = null,
    Object? readLoad = null,
    Object? users = null,
    Object? status = null,
  }) {
    return _then(_$_UserPageStatee(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      readLoad: null == readLoad
          ? _value.readLoad
          : readLoad // ignore: cast_nullable_to_non_nullable
              as int,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$_UserPageStatee implements _UserPageStatee {
  const _$_UserPageStatee(
      {this.errorMessage = "",
      this.currentPage = 0,
      this.readLoad = 0,
      final List<String> users = const [],
      this.status = FormzSubmissionStatus.initial})
      : _users = users;

  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int readLoad;
  final List<String> _users;

  @override
  @JsonKey()
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final FormzSubmissionStatus status;

  @override
  String toString() {
    return 'UserPageState(errorMessage: $errorMessage, currentPage: $currentPage, readLoad: $readLoad, users: $users, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPageStatee &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.readLoad, readLoad) ||
                other.readLoad == readLoad) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, currentPage,
      readLoad, const DeepCollectionEquality().hash(_users), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPageStateeCopyWith<_$_UserPageStatee> get copyWith =>
      __$$_UserPageStateeCopyWithImpl<_$_UserPageStatee>(this, _$identity);
}

abstract class _UserPageStatee implements UserPageState {
  const factory _UserPageStatee(
      {final String errorMessage,
      final int currentPage,
      final int readLoad,
      final List<String> users,
      final FormzSubmissionStatus status}) = _$_UserPageStatee;

  @override
  String get errorMessage;

  @override
  int get currentPage;

  @override
  int get readLoad;

  @override
  List<String> get users;

  @override
  FormzSubmissionStatus get status;

  @override
  @JsonKey(ignore: true)
  _$$_UserPageStateeCopyWith<_$_UserPageStatee> get copyWith =>
      throw _privateConstructorUsedError;
}
