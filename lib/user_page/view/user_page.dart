import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../utils/utils.dart';
import '../cubit/user_page_cubit.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  static Widget instance() => BlocProvider<UserPageCubit>(
        create: (context) => UserPageCubit(),
        child: UserPage(),
      );

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserPageCubit()..getAllUsers(),
        child: BlocListener<UserPageCubit, UserPageState>(
          listener: (context, state) {
            if (state.status.isFailure) {
              SnackBarUtils.showSnackBar(context, state.errorMessage);
            } else if (state.status.isSuccess) {}
          },
          child: BlocBuilder<UserPageCubit, UserPageState>(
            builder: (context, state) {
              if (state.status.isInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (value) {
                        context.read<UserPageCubit>().changCurrentPage(
                              index: value,
                            );
                      },
                      controller: _pageController,
                      itemCount: (state.users.length / 4).ceil(),
                      itemBuilder: (context, pageIndex) {
                        return _itemBuildUser(pageIndex, context, state);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: DotsIndicator(
                      dotsCount: (state.users.length / 4).ceil(),
                      position: state.currentPage.toDouble().toInt(),
                      decorator: const DotsDecorator(
                        activeColor: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _itemBuildUser(int pageIndex, context, UserPageState userPageState) {
    if (userPageState.readLoad > 0) {
      return Container();
    } else {
      return BlocBuilder<UserPageCubit, UserPageState>(
        builder: (context, state) {
          final startIndex = pageIndex * 4;
          final endIndex = (pageIndex + 1) * 4;
          final pageUsers = state.users.sublist(startIndex,
              endIndex > state.users.length ? state.users.length : endIndex);

          if (pageUsers.length == 2) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTwoItem(pageUsers),
                  ],
                ),
              ],
            );
          }
          if (pageUsers.length == 3) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildThreeItem(pageUsers),
              ],
            );
          }
          if (pageUsers.length == 1) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pageUsers[0],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          }
          if (state.users.isEmpty) {
            return const Center(
              child: Text(
                'Data not found!!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18.0,
              childAspectRatio: 0.5,
              mainAxisSpacing: 18.0,
            ),
            itemCount: pageUsers.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pageUsers[index],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }
  }

  Widget _buildTwoItem(List<String> users) {
    return Row(
      children: [
        Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              users[0],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 60,
        ),
        Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              users[1],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildThreeItem(List<String> users) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              users[0],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    users[1],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    users[2],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
