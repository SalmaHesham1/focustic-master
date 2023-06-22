import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/register/sign_up/cubit/cubit.dart';
import 'package:projects/mobile/register/sign_up/cubit/state.dart';
import 'package:projects/shared/component/component.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return buildSignUpForm();
            // return signUpWebAndMobile(context: context);
            // return ScreenTypeLayout(
            //     mobile: Builder(builder:(context) {
            //       CashHelper.putData(key: "isWeb", value: false);
            //       return signUpWebAndMobile(context: context);}),
            //     desktop: Builder(builder:(context) {
            //       CashHelper.putData(key: "isWeb", value: true).then((value){
            //         print(CashHelper.getBool(key: "isWeb").toString());
            //         print("--------------------------------------------------------------------");
            //       });
            //       return signUpWebAndMobile(context: context);}),
            //     breakpoints: ScreenBreakpoints(
            //       desktop: 600,
            //       tablet: 600,
            //       watch: 100,
            //     ),
            //   );
          }),
    );
  }
}

Widget buildSignUpForm() {
  return Container(
    color: Colors.lightBlue,
  );
}

//vi
Widget signUpWebAndMobile({
  required BuildContext context,
}) =>
    Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 80,
              bottom: 40,
              right: 50,
              left: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                //sign up text
                signUpText(),
                SizedBox(
                  height: 8,
                ),
                //sign up form
                /*CashHelper.getBool(key: "isWeb")
                ? signupWebScreen(
              context: context,
            )
                : */
                signupMobileScreen(
                  context: context,
                ),
                //already have an account button
                haveAnAccountButton(context: context),
              ],
            ),
          ),
    ),
  ),
);
//sign up web screen
Widget signupWebScreen({
  required BuildContext context,
})=>Row(
  children: [
    Expanded(
      child: Column(
        children: [
          Form(
            key: SignUpCubit.get(context).formKey,
            child: signUpForm(
              user_name: SignUpCubit.get(context).user_name,
              email: SignUpCubit.get(context).email,
              password1: SignUpCubit.get(context).password1,
              password2: SignUpCubit.get(context).password2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //sign up button
          Row(
            children: [
              Expanded(
                  child: signUpButton(
                    context: context,
                  )),
              Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    ),
    //or text
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: orText(),
    ),
    //sign up with
    Expanded(
      child: Column(
        children: [
              //sign up with google
              signUpWith(
                onTap: () {},
                text: "Sign up with Google",
                image: "assets/icons/google.png",
                context: context,
              ),
              SizedBox(
                height: 16,
              ),
              //sign up with linkedin
              signUpWith(
                onTap: () {},
                text: "Sign up with LinkedIN",
                image: "assets/icons/linkedin.png",
                context: context,
              ),
            ],
          ),
    ),
  ],
);

//sign up mobile screen
Widget signupMobileScreen({
  required BuildContext context,
})=>Column(
  children: [
    Form(
      key: SignUpCubit.get(context).formKey,
      child: Column(
        children: [
          signUpForm(
            user_name: SignUpCubit.get(context).user_name,
            email: SignUpCubit.get(context).email,
            password1: SignUpCubit.get(context).password1,
            password2: SignUpCubit.get(context).password2,
          ),
          SizedBox(
            height: 13,
          ),
          //sign up button
          signUpButton(
            context: context,
          ),
        ],
      ),
    ),
    //or text
    orText(),
    //sign up with
    Column(
      children: [
            //sign up with google
            signUpWith(
              onTap: () {},
              text: "Sign up with Google",
              image: "assets/icons/google.png",
              context: context,
            ),
            SizedBox(
              height: 8,
            ),
            //sign up with linkedin
            signUpWith(
              onTap: () {},
              text: "Sign up with LinkedIN",
              image: "assets/icons/linkedin.png",
              context: context,
            ),
          ],
        ),
  ],
);




