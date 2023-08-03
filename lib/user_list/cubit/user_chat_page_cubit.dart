import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_page_cubit.freezed.dart';

part 'user_list_page_state.dart';

class UserChatPage extends Cubit<UserChatPageState> {
  UserChatPage() : super(const UserChatPageState.initial());
}
