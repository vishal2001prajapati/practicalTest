part of 'user_page_cubit.dart';

@freezed
class UserPageState with _$UserPageState {
  const factory UserPageState({
    @Default("") String errorMessage,
    @Default(0) int currentPage,
    @Default(0) int readLoad,
    @Default([]) List<String> users,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _UserPageStatee;
}
