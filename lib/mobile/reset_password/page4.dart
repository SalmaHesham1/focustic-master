import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/reset_password/cubit/cubit.dart';
import 'package:projects/mobile/reset_password/cubit/state.dart';
import 'package:projects/mobile/reset_password/reset_password_screen.dart';

class ResetPasswordPage4 extends StatelessWidget {
  const ResetPasswordPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ResetPasswordCubit.get(context: context)
                .sizeOfScreen(context: context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Text("All Set !",
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left),
                Spacer(),
                Icon(
                  Icons.check_circle_outline_sharp,
                  size: (ResetPasswordCubit.get(context: context).height *
                          0.127) *
                      2,
                  color: Color(0xffFF5E17),
                ),
                Spacer(),
                backToLoginButton(context: context),
                Spacer(),
              ],
            );
          }),
    );
  }
}
