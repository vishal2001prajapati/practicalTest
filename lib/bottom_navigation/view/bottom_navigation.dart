import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_page/view/login_page.dart';
import '../../user_list/view/chat_page.dart';
import '../../user_page/view/user_page.dart';
import '../cubit/bottom_navigation_cubit.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
          create: (context) => BottomNavigationCubit(),
          child: BottomNavigationScreen()));
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                ),
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () async {
            await _auth.signOut();
            await UserSession.removeUserEmail();
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                  context, LoginPage.route(), (route) => false);
            }
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          switch (state.currentIndex) {
            case 0:
              return ChatPage.instance();

            case 1:
              return UserPage.instance();

            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.white,
            currentIndex: state.currentIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: (index) {
              context.read<BottomNavigationCubit>().changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: state.currentIndex == 0
                    ? const Icon(Icons.chat_bubble_outline, color: Colors.black)
                    : const Icon(
                        Icons.chat_bubble_outline,
                      ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: state.currentIndex == 1
                    ? const Icon(Icons.person, color: Colors.black)
                    : const Icon(
                        Icons.person,
                      ),
                label: 'Person',
              ),
            ],
          );
        },
      ),
    );
  }
}
