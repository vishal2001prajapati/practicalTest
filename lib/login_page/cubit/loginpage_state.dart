part of 'loginpage_cubit.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState({
    @Default("") String userName,
    @Default("") String userEmail,
    @Default("") String userPassword,
    @Default("") String errorMessage,
    @Default(true) bool passwordVisible,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _LoginPageState;
}
