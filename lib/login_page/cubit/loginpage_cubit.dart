import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/models/firebase_user.dart';
import 'package:first_project/utils/user_session.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginpage_cubit.freezed.dart';
part 'loginpage_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<bool?> login({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );

    bool? accountFound;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      accountFound = true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          accountFound = false;
          emit(
            state.copyWith(
              errorMessage: "Email is not found, please create an account",
              status: FormzSubmissionStatus.failure,
            ),
          );
          break;
        case 'wrong-password':
          emit(
            state.copyWith(
              errorMessage: "Incorrect password, please try again.",
              status: FormzSubmissionStatus.failure,
            ),
          );
          break;
        default:
          emit(
            state.copyWith(
              errorMessage: e.message ?? "Something went wrong!!",
              status: FormzSubmissionStatus.failure,
            ),
          );
          break;
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    }

    return accountFound;
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser mUser = FirebaseUser(
        email: email,
        password: password,
        name: name,
      );

      await fireStore
          .collection('Users')
          .doc(user.user?.uid)
          .set(mUser.toJson());
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void loginSuccess(String userEmail) {
    UserSession.saveUserEmail(userEmail);
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
      ),
    );
  }

  void nameChanged(String value) {
    emit(
      state.copyWith(
        userName: value,
      ),
    );
  }

  void emailChanged(String value) {
    emit(state.copyWith(
      userEmail: value,
    ));
  }

  void passwordChange(String value) {
    emit(state.copyWith(
      userPassword: value,
    ));
  }

  bool checkEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  bool checkPassword(String password) {
    final bool passwordValid = RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
        .hasMatch(password);
    return passwordValid;
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }
}
