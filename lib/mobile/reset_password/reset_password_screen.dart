import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/reset_password/cubit/cubit.dart';
import 'package:projects/mobile/reset_password/cubit/state.dart';

class ResetPasswordScreen extends StatelessWidget {
  bool? lastIndex;

  ResetPasswordScreen({required this.lastIndex}) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {
          if (state is ResetPasswordEnterEmailSuccessState) {
            Fluttertoast.showToast(
                msg: "Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is ResetPasswordEnterEmailFailState) {
            Fluttertoast.showToast(
                msg: "Fail",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          ResetPasswordCubit.get(context: context)
              .sizeOfScreen(context: context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height:
                      ResetPasswordCubit.get(context: context).height * 0.340,
                  width: ResetPasswordCubit.get(context: context).width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/reset_password.png"),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            ResetPasswordCubit.get(context: context).width *
                                0.1349),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  ResetPasswordCubit.get(context: context)
                                              .index >
                                          0
                                      ? ResetPasswordCubit.get(context: context)
                                          .changePage(
                                              page: ResetPasswordCubit.get(
                                                          context: context)
                                                      .index -
                                                  1)
                                      : Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()),
                                          (route) => false,
                                        );
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ))
                          ],
                        ),
                        Image(
                          height:
                              ResetPasswordCubit.get(context: context).height *
                                  0.0928,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          image: AssetImage(
                            "assets/images/main_logo.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: buildResetPasswordScreen(
                    context: context,
                    lastIndex: lastIndex ?? false,
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

buildResetPasswordScreen({
  required BuildContext context,
  required bool lastIndex,
}) {
  return Column(
    children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: ResetPasswordCubit.get(context: context).index == 3 ||
                  ResetPasswordCubit.get(context: context).index == 1
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(
                  horizontal:
                      ResetPasswordCubit.get(context: context).width * 0.1058,
                ),
          child: ResetPasswordCubit.get(context: context).page[
              lastIndex ? 4 : ResetPasswordCubit.get(context: context).index],
        ),
      ),
      ResetPasswordCubit.get(context: context).index == 3 ||
              ResetPasswordCubit.get(context: context).index == 1
          ? SizedBox()
          : Expanded(
              flex: 1,
              child: Container(
                width: ResetPasswordCubit.get(context: context).width,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ResetPasswordCubit.get(context: context).height *
                        0.0334,
                    bottom:
                        ResetPasswordCubit.get(context: context).height * 0.018,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ResetPasswordCubit.get(context: context).index == 0 ||
                              ResetPasswordCubit.get(context: context).index ==
                                  1
                          ? SizedBox(
                              // height: ResetPasswordCubit.get(context: context).height *
                              //     0.1328,
                              )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Didn't get an email?",
                                ),
                                Text(
                                  "Check your spam, or contact",
                                ),
                                Text(
                                  "Customer support",
                                  style: TextStyle(color: Color(0xffF29972)),
                                ),
                              ],
                            ),
                      Text(
                        "Terms and conditions",
                      ),
                    ],
            ),
          ),
        ),
      ),
    ],
  );
}

backToLoginButton({
  required BuildContext context,
}) {
  return Row(
    children: [
      Expanded(
          child: mainTextButton(
              context: context,
              child: Text("Back to login",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                    (route) => false);
              })),
    ],
  );
}
