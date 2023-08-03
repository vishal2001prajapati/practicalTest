import 'package:first_project/login_page/cubit/loginpage_cubit.dart';
import 'package:first_project/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bottom_navigation/cubit/bottom_navigation_cubit.dart';
import '../../bottom_navigation/view/bottom_navigation.dart';
import '../../login_page/view/login_page.dart';
import '../cubit/splash_page_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          lazy: false,
          create: (context) => SplashPageCubit(),
          child: const SplashPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Future<void> checkEmailAndNavigate() async {
      final userEmail = await UserSession.getUserEmail();

      if (context.mounted) {
        if (userEmail == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Builder(
                builder: (BuildContext context) {
                  return BlocProvider(
                    create: (context) => LoginPageCubit(),
                    child: const LoginPage(),
                  );
                },
              ),
            ),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Builder(
                builder: (BuildContext context) {
                  return BlocProvider(
                    create: (context) => BottomNavigationCubit(),
                    child: BottomNavigationScreen(),
                  );
                },
              ),
            ),
            (route) => false,
          );
        }
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkEmailAndNavigate();
    });

    return const Scaffold(
      body: Center(
        child: Text(
          'Practical',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
