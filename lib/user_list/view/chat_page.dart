import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/user_chat_page_cubit.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static Widget instance() => BlocProvider<UserChatPage>(
        create: (context) => UserChatPage(),
        child: const ChatPage(),
      );

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yyyy');
    var formatterTime = DateFormat('hh:mm');
    String currentDate = formatterDate.format(now);
    String currentTime = formatterTime.format(now);
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          height: 1,
        ),
        itemCount: 20,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 25,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Container(
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'John doe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$currentDate $currentTime',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Message',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
