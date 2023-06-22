import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/welcome_back/cubit/cubit.dart';
import 'package:projects/mobile/welcome_back/cubit/states.dart';
import 'package:projects/shared/component/component.dart';

class WelcomeBackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBackCubit(),
      child: BlocConsumer<WelcomeBackCubit, WelcomeBackStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildWelcomeBackScreen(
            context: context,
          );
        },
      ),
    );
    // return ScreenTypeLayout(
    //   mobile: Builder(builder:(context) {
    //     CashHelper.putData(key: "isWeb", value: false);
    //     return buildWelcomeBackScreen(
    //       context: context,
    //     );}),
    //   desktop: Builder(builder:(context) {
    //     CashHelper.putData(key: "isWeb", value: true).then((value){
    //       print(CashHelper.getBool(key: "isWeb").toString());
    //       print("--------------------------------------------------------------------");
    //     });
    //     return buildWelcomeBackScreen(
    //       context: context,
    //     );}),
    //   breakpoints: ScreenBreakpoints(
    //     desktop: 600,
    //     tablet: 600,
    //     watch: 100,
    //   ),
    // );
  }

  Widget buildWelcomeBackScreen({
    required BuildContext context,
  }) =>
      Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: /*CashHelper.getBool(key: "isWeb")? 400:*/ 18,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mainContainer(
                        radius: 20.0,
                        color: Color(0xff0864A2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "WELCOME BACK TO",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    "FOCUSTIC",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  profileImage(),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Form(
                                    key: WelcomeBackCubit.get(context).formkey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        mainTextForm(isPassword: false,
                                          textColor: Colors.white,
                                          borderColor: Colors.black,
                                          hintText: "E-mail",
                                          prefixIcon: null,
                                          validator: "Enter Your Email",
                                          controller: WelcomeBackCubit
                                              .get(context)
                                              .email,
                                          keyboardType: TextInputType
                                              .emailAddress,
                                          context: context,),
                                        SizedBox(
                                          height: /* CashHelper.getBool(key: "isWeb")?10:*/ 5,
                                        ),
                                        //password
                                        mainTextForm(isPassword: true,
                                          textColor: Colors.white,
                                          borderColor: Colors.black,
                                          hintText: "Password",
                                          prefixIcon: null,
                                          validator: "Enter Your passwoed",
                                          controller: WelcomeBackCubit
                                              .get(context)
                                              .password,
                                          keyboardType: TextInputType
                                              .visiblePassword,
                                          obscureText: false,
                                          context: context,),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: /*CashHelper.getBool(key: "isWeb")?30:*/ 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: mainContainer(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          child: MaterialButton(
                                            onPressed: () {
                                              if (WelcomeBackCubit.get(context)
                                                  .formkey
                                                  .currentState!
                                                  .validate()) {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen(),
                                                  ),
                                                  (route) => false,
                                                );
                                              }
                                            },
                                            child: Text(
                                              'Login',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

Widget profileImage() => Container(
      height: 200,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                            width: 65,
                            height: 65,
                            image: AssetImage("assets/images/top profile.png"))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image(
                            width: 65,
                            height: 65,
                            image:
                                AssetImage("assets/images/bottom profile.png"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/background.png"),
                radius: 60,
              ),
            ),
          ),
        ],
      ),
    );
