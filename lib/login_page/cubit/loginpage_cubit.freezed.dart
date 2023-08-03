// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loginpage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginPageState {
  String get userName => throw _privateConstructorUsedError;

  String get userEmail => throw _privateConstructorUsedError;

  String get userPassword => throw _privateConstructorUsedError;

  String get errorMessage => throw _privateConstructorUsedError;

  bool get passwordVisible => throw _privateConstructorUsedError;

  FormzSubmissionStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res, LoginPageState>;

  @useResult
  $Res call(
      {String userName,
      String userEmail,
      String userPassword,
      String errorMessage,
      bool passwordVisible,
      FormzSubmissionStatus status});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res, $Val extends LoginPageState>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userEmail = null,
    Object? userPassword = null,
    Object? errorMessage = null,
    Object? passwordVisible = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: null == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      passwordVisible: null == passwordVisible
          ? _value.passwordVisible
          : passwordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginPageStateCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$_LoginPageStateCopyWith(
          _$_LoginPageState value, $Res Function(_$_LoginPageState) then) =
      __$$_LoginPageStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String userName,
      String userEmail,
      String userPassword,
      String errorMessage,
      bool passwordVisible,
      FormzSubmissionStatus status});
}

/// @nodoc
class __$$_LoginPageStateCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$_LoginPageState>
    implements _$$_LoginPageStateCopyWith<$Res> {
  __$$_LoginPageStateCopyWithImpl(
      _$_LoginPageState _value, $Res Function(_$_LoginPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userEmail = null,
    Object? userPassword = null,
    Object? errorMessage = null,
    Object? passwordVisible = null,
    Object? status = null,
  }) {
    return _then(_$_LoginPageState(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: null == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      passwordVisible: null == passwordVisible
          ? _value.passwordVisible
          : passwordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$_LoginPageState implements _LoginPageState {
  const _$_LoginPageState(
      {this.userName = "",
      this.userEmail = "",
      this.userPassword = "",
      this.errorMessage = "",
      this.passwordVisible = true,
      this.status = FormzSubmissionStatus.initial});

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String userEmail;
  @override
  @JsonKey()
  final String userPassword;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool passwordVisible;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;

  @override
  String toString() {
    return 'LoginPageState(userName: $userName, userEmail: $userEmail, userPassword: $userPassword, errorMessage: $errorMessage, passwordVisible: $passwordVisible, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginPageState &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userPassword, userPassword) ||
                other.userPassword == userPassword) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.passwordVisible, passwordVisible) ||
                other.passwordVisible == passwordVisible) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, userEmail,
      userPassword, errorMessage, passwordVisible, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginPageStateCopyWith<_$_LoginPageState> get copyWith =>
      __$$_LoginPageStateCopyWithImpl<_$_LoginPageState>(this, _$identity);
}

abstract class _LoginPageState implements LoginPageState {
  const factory _LoginPageState(
      {final String userName,
      final String userEmail,
      final String userPassword,
      final String errorMessage,
      final bool passwordVisible,
      final FormzSubmissionStatus status}) = _$_LoginPageState;

  @override
  String get userName;

  @override
  String get userEmail;

  @override
  String get userPassword;

  @override
  String get errorMessage;

  @override
  bool get passwordVisible;

  @override
  FormzSubmissionStatus get status;

  @override
  @JsonKey(ignore: true)
  _$$_LoginPageStateCopyWith<_$_LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
