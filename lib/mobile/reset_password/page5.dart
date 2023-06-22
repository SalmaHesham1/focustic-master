import 'package:flutter/material.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/reset_password/cubit/cubit.dart';

class ResetPasswordPage5 extends StatelessWidget {
  const ResetPasswordPage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  ResetPasswordCubit.get(context: context).width * 0.1058,
            ),
            child: Column(
              children: [
                Text("Reset password",
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left),
                SizedBox(
                  height: 55,
                ),
                Column(
                  children: [
                    Text("Enter your E-mail",
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 15,
                    ),
                    Form(
                        key: ResetPasswordCubit.get(context: context).key,
                        child: Column(
                          children: [
                            mainTextForm(
                                isPassword: false,
                                hintText: "",
                                prefixIcon: null,
                                validator: "Enter your E-mail",
                                controller:
                                    ResetPasswordCubit.get(context: context)
                                        .email,
                                keyboardType: TextInputType.emailAddress,
                                context: context),
                            SizedBox(
                              height: 30,
                            ),
                            mainTextButton(
                                context: context,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                                onPressed: () {
                                  if (ResetPasswordCubit.get(context: context)
                                      .key
                                      .currentState!
                                      .validate()) {
                                    ResetPasswordCubit.get(context: context)
                                        .enterYourEmail(
                                      email: ResetPasswordCubit
                                          .get(context: context)
                                          .email
                                          .text, context: context,);
                                  }
                                })
                          ],
                        )),
                    SizedBox(
                      height: 55,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            width: ResetPasswordCubit.get(context: context).width,
            padding: EdgeInsets.only(
              top: ResetPasswordCubit.get(context: context).height * 0.0334,
              bottom: ResetPasswordCubit.get(context: context).height * 0.018,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Terms and conditizons",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
