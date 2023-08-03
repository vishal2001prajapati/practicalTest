import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showSnackBar(
    BuildContext context,
    String message, {
    int duration = 2,
    SnackBarAction? action,
    TextStyle? textStyle,
    Color? backgroundColor,
  }) {
    if (message.isEmpty) {
      return;
    }

    final snackBar = SnackBar(
      content: Text(
        message,
        style: textStyle ??
            const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
            ),
      ),
      backgroundColor: backgroundColor ?? Colors.black,
      duration: Duration(seconds: duration),
      action: action,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
//
// import '../cubit/user_page_cubit.dart';
//
// class UserPage extends StatelessWidget {
//   const UserPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => UserPageCubit()..getAllUsers(),
//         child: BlocListener<UserPageCubit, UserPageState>(
//           listener: (context, state) {
//             if (state.status.isFailure) {
//               showSnackBar(context, state.errorMessage);
//             } else if (state.status.isSuccess) {
//               // showSnackBar(context, state.errorMessage);
//             } else if (state.status.isInProgress) {
//               //   ProgressHUD.of(context)?.show();
//             }
//           },
//           child: BlocBuilder<UserPageCubit, UserPageState>(
//             builder: (context, state) {
//               var size = MediaQuery.of(context).size;
//
//               /*24 is for notification bar on Android*/
//               final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//               final double itemWidth = size.width / 2;
//               return GridView.builder(
//                 itemCount: state.users.length,
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   right: 10,
//                   top: 10,
//                   bottom: 25,
//                 ),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: (itemWidth / itemHeight),
//                 ),
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       const CircleAvatar(
//                         radius: 50,
//                         backgroundImage: NetworkImage(
//                           'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         state.users[index],
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   void showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         duration: const Duration(seconds: 2),
//         content: Text(message),
//       ),
//     );
//   }
// }
