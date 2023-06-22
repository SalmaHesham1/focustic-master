import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/mobile/reset_password/cubit/cubit.dart';
import 'package:projects/mobile/reset_password/reset_password_screen.dart';

class ResetPasswordPage2 extends StatelessWidget {
  const ResetPasswordPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        InkWell(
          onTap: () {
            ResetPasswordCubit.get(context: context).changePage(page: 3);
          },
          child: Column(
            children: [
              Text("Check your email",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left),
              Text("The link sent to your emai",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  textAlign: TextAlign.left),
              Text("s valid for 24 hours",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  textAlign: TextAlign.left),
              Container(
                height: ResetPasswordCubit.get(context: context).height * 0.253,
                width: ResetPasswordCubit.get(context: context).width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "assets/images/reset_password_page2.png"))),
              ),
            ],
          ),
        ),
        Spacer(),
        backToLoginButton(context: context),
        Spacer(),
      ],
    );
  }
}
