import 'package:first_project/bottom_navigation/view/bottom_navigation.dart';
import 'package:first_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../cubit/loginpage_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          create: (context) => LoginPageCubit(),
          child: const LoginPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Login/Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginPageCubit(),
        child: BlocListener<LoginPageCubit, LoginPageState>(
          listenWhen: (previous, current) => current.status != previous.status,
          listener: (context, state) {
            if (state.status.isSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                BottomNavigationScreen.route(),
                (route) => false,
              );
              // showSnackBar(context, state.errorMessage);
            } else if (state.status.isInProgress) {
              //   ProgressHUD.of(context)?.show();
            } else if (state.status.isFailure) {
              SnackBarUtils.showSnackBar(context, state.errorMessage);
            }
          },
          child: BlocBuilder<LoginPageCubit, LoginPageState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) =>
                          context.read<LoginPageCubit>().nameChanged(value),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) =>
                          context.read<LoginPageCubit>().emailChanged(value),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Email',
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) =>
                          context.read<LoginPageCubit>().passwordChange(value),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: state.passwordVisible,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: state.passwordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            context
                                .read<LoginPageCubit>()
                                .togglePasswordVisibility();
                          },
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final loginPageCubit = context.read<LoginPageCubit>();
                          if (state.userEmail.isEmpty) {
                            SnackBarUtils.showSnackBar(
                                context, 'Please enter email');
                          } else if (!loginPageCubit
                              .checkEmail(state.userEmail)) {
                            SnackBarUtils.showSnackBar(
                                context, 'Please enter a proper email');
                          } else if (state.userPassword.isEmpty) {
                            SnackBarUtils.showSnackBar(
                                context, 'Please enter password');
                          } else if (!loginPageCubit
                              .checkPassword(state.userPassword)) {
                            SnackBarUtils.showSnackBar(context,
                                'Password should be 8 characters, must contain 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character');
                          } else {
                            var isExist = await loginPageCubit.login(
                                email: state.userEmail,
                                password: state.userPassword);
                            if (isExist == true) {
                              if (context.mounted) {
                                loginPageCubit.loginSuccess(state.userEmail);
                              }
                            } else if (isExist == false) {
                              if (state.userName.isEmpty) {
                                if (context.mounted) {
                                  SnackBarUtils.showSnackBar(
                                      context, 'Please enter name');
                                }
                              } else {
                                if (context.mounted) {
                                  loginPageCubit.signUpUser(
                                    name: state.userName,
                                    email: state.userEmail,
                                    password: state.userPassword,
                                  );
                                  loginPageCubit.loginSuccess(state.userEmail);
                                }
                              }
                            }
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
