import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/firebase_user.dart';

part 'user_page_cubit.freezed.dart';

part 'user_page_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit() : super(const UserPageState());

  void changCurrentPage({required int index}) {
    emit(state.copyWith(currentPage: index));
  }

  Future<void> getAllUsers() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Users').get();

      var listOfUsers = List<String>.from(state.users);

      for (var document in querySnapshot.docs) {
        FirebaseUser user =
            FirebaseUser.fromJson(document.data() as Map<String, dynamic>);

        if (user.name != null) {
          listOfUsers.add(user.name!);
          emit(
            state.copyWith(
              users: listOfUsers,
              status: FormzSubmissionStatus.success,
            ),
          );
        }
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
