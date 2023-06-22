import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/mobile/register/register_cubit/cubit.dart';
import 'package:projects/mobile/register/register_cubit/state.dart';
import 'package:projects/mobile/reset_password/reset_password_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  //width of ui 428px
  //height of ui 926px

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is LoginSuccessState || state is RegisterSuccessState) {
            Fluttertoast.showToast(
                msg: "Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          else if (state is LoginFailState || state is RegisterFailState) {
            Fluttertoast.showToast(
                msg: state is LoginFailState?"The given data was invalid.":"The email must be a valid email address or ""The email has already been taken.""The password must be at least 6 characters or The password confirmation does not match.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          RegisterCubit.get(context: context).sizeOfScreen(context: context);
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            body: buildRegisterBody(
              context: context,
              state: state,
            ),
          );
        },
      ),
    );
  }
}

buildRegisterBody({
  required BuildContext context,
  required var state,
}) {
  return Column(children: [
    Expanded(
      flex: 2,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Image(
                  image: AssetImage(
                    "assets/images/blue_circle.png",
                  ),
                  fit: BoxFit.cover,
                )),
                Expanded(child: SizedBox()),
              ],
            ),
            Image.asset(
              RegisterCubit.get(context: context).isInLoginScreen
                  ? "assets/images/login.png"
                  : "assets/images/signup.png",
            ),
            Image.asset("assets/images/main_logo.png"),
          ],
        ),
      ),
    ),
    Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: RegisterCubit.get(context: context).isInLoginScreen
            ? loginForm(
          context: context,
                state: state,
              )
            : signupForm(
          context: context,
                state: state,
              ),
      ),
    ),
  ]);
}

loginForm({
  required BuildContext context,
  required var state,
}) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.only(
        left: RegisterCubit.get(context: context).width * 0.098,
        right: RegisterCubit.get(context: context).width * 0.1058,
        top: RegisterCubit.get(context: context).width * 0.0459,
        bottom: RegisterCubit.get(context: context).width * 0.0097,
      ),
      child: Form(
        key: RegisterCubit.get(context: context)
            .loginFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Text("LOG INTO YOUR ACCOUNT",
                    style: TextStyle(
                      color: Color(0xff003151),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left),
              ],
            ),
            SizedBox(height: 10),
            //login form
            mainTextForm(
              controller: RegisterCubit
                  .get(context: context)
                  .loginEmailController,
              hintText: "Your Email",
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
              validator: "Enter Your Email",
              context: context,
            ),
            SizedBox(height: 10),
            mainTextForm(
              controller: RegisterCubit
                  .get(context: context)
                  .loginPasswordController,
              hintText: "Password",
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_person_outlined,
              validator: "Enter Your Password",
              context: context,
              obscureText:
              RegisterCubit
                  .get(context: context)
                  .showLoginPassword,
              showPassword:
              RegisterCubit
                  .get(context: context)
                  .showLoginPassword,
              index: 0,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      activeColor: Theme
                          .of(context)
                          .primaryColor,
                      side: BorderSide(
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                      value: RegisterCubit
                          .get(context: context)
                          .loginRememberMe,
                      onChanged: (value) {
                        RegisterCubit.get(context: context).checkBox();
                      },
                      checkColor: Colors.white,
                    ),
                    Text("Remember me",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResetPasswordScreen(
                                  lastIndex: false,
                                )),
                            (route) => false,
                      );
                    },
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          color: Colors.black,
                        )),
                    child: Text(
                      "Forget password ?",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10),
            state! is LoginLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: mainTextButton(
                            context: context,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                      ),
                      onPressed: () {
                        if (RegisterCubit
                            .get(context: context)
                            .loginFormKey
                            .currentState!
                            .validate()) {
                          RegisterCubit.get(context: context).login(
                            email: RegisterCubit.get(context: context)
                                .loginEmailController
                                .text,
                            password: RegisterCubit.get(context: context)
                                .loginPasswordController
                                .text,
                            context: context,
                          );
                          // RegisterCubit.get(context: context).login(
                          //   email: RegisterCubit
                          //       .get(context: context)
                          //       .loginEmailController.toString(),
                          //   password: RegisterCubit
                          //       .get(context: context)
                          //       .loginPasswordController.toString(),);
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ModeScreen()),
                          //       (route) => false,
                          // );
                          print("login");
                        }
                      }),
                ),
              ],
            ),
            SizedBox(height: 10),
            //login as visitor button
            // Row(
            //   children: [
            //     Spacer(),
            //     mainTextButton(
            //         context: context,
            //         child: Text("Log in as visitor",
            //             style: TextStyle(
            //               color: Colors.white,
            //             )),
            //         backgroundColor: Theme
            //             .of(context)
            //             .primaryColor,
            //         onPressed: () {
            //           Navigator.pushAndRemoveUntil(
            //               context,
            //               MaterialPageRoute(builder: (context) => HomeScreen()),
            //                   (route) => false);
            //         }),
            //     Spacer(),
            //   ],
            // ),
            SizedBox(height: 10),
            Column(
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    RegisterCubit.get(context: context).changeRegisterBody();
                  },
                  child: Text(
                    "Sign-up",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Terms and conditions",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

signupForm({
  required BuildContext context,
  required var state,
}) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.only(
        left: RegisterCubit.get(context: context).width * 0.098,
        right: RegisterCubit.get(context: context).width * 0.1058,
        top: RegisterCubit.get(context: context).width * 0.0459,
        bottom: RegisterCubit.get(context: context).width * 0.0097,
      ),
      child: Form(
        key: RegisterCubit.get(context: context).signupFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text("Sign up a new Acoount",
                    style: TextStyle(
                      color: Color(0xff003151),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left),
              ],
            ),
            SizedBox(height: 10),
            //login form
            mainTextForm(
              controller:
                  RegisterCubit.get(context: context).signupUsernameController,
              hintText: "User name",
              isPassword: false,
              keyboardType: TextInputType.name,
              prefixIcon: Icons.person_outline_rounded,
              validator: "Enter Your User name",
              context: context,
            ),
            SizedBox(height: 10),
            mainTextForm(
              controller:
                  RegisterCubit.get(context: context).signupEmailController,
              hintText: "Your Email",
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
              validator: "Enter Your Email",
              context: context,
            ),
            SizedBox(height: 10),
            mainTextForm(
              controller:
                  RegisterCubit.get(context: context).signupPasswordController,
              hintText: "Password",
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_person_outlined,
              validator: "Enter Your Password",
              context: context,
              obscureText:
                  RegisterCubit.get(context: context).showSignupPassword,
              showPassword:
                  RegisterCubit.get(context: context).showSignupPassword,
              index: 1,
            ),
            SizedBox(height: 10),
            mainTextForm(
              controller:
                  RegisterCubit.get(context: context).signupPassword2Controller,
              hintText: "Enter password again",
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_person_outlined,
              validator: RegisterCubit.get(context: context)
                          .signupPasswordController !=
                      RegisterCubit.get(context: context)
                          .signupPasswordController
                  ? "Try it again"
                  : "Enter password again",
              context: context,
              obscureText:
                  RegisterCubit.get(context: context).showSignupPassword2,
              showPassword:
                  RegisterCubit.get(context: context).showSignupPassword2,
              index: 2,
            ),
            SizedBox(height: 10),
            state! is RegisterLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: mainTextButton(
                            context: context,
                            child: Text("Create Your account",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                )),
                            onPressed: () {
                              if (RegisterCubit.get(context: context)
                            .signupFormKey
                            .currentState!
                            .validate()) {
                          print("Create Your account");
                          RegisterCubit.get(context: context).register(
                              name: RegisterCubit
                                  .get(context: context)
                                  .signupUsernameController
                                  .text,
                              email: RegisterCubit
                                  .get(context: context)
                                  .signupEmailController
                                  .text,
                              password: RegisterCubit
                                  .get(context: context)
                                  .signupPasswordController
                                  .text,
                              password_confirmation: RegisterCubit
                                  .get(context: context)
                                  .signupPassword2Controller
                                  .text,
                              context: context);
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ModeScreen()),
                          //   (route) => false,
                          // );
                        }
                      }),
                ),
              ],
            ),
            SizedBox(height: 10),
            //login as visitor button
            Row(
              children: [
                Expanded(
                  child: mainTextButton(
                      context: context,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          Text("Already have an account, Click to login",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        RegisterCubit.get(context: context)
                            .changeRegisterBody();
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => WelcomeBackScreen()),
                        //   (route) => false,
                        // );
                      }),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Terms and conditions",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

mainTextForm({
  required bool isPassword,
  required String hintText,
  required var prefixIcon,
  required String validator,
  required var controller,
  required var keyboardType,
  var suffixIcon,
  required BuildContext context,
  var obscureText,
  var showPassword,
  var index,
  var borderColor,
  var textColor,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    controller: controller,
    obscureText: !(obscureText ?? true),
    validator: (String? value) {
      if (value!.isEmpty) {
        return validator;
      } else {}
    },
    cursorColor: textColor ?? Color(0xff0A66C2),
    style: TextStyle(color: textColor ?? Color(0xff0A66C2)),
    decoration: InputDecoration(
        prefixIconColor: Color(0xff0A66C2),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () => index == 0
                    ? RegisterCubit.get(context: context).loginShowPassword()
                    : (index == 1
                        ? RegisterCubit.get(context: context)
                            .signupShowPassword()
                        : RegisterCubit.get(context: context)
                            .signupShowPassword2()),
                icon: obscureText
                    ? Icon(
                        Icons.visibility_outlined,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
              )
            : null,
        prefixIcon: Icon(
          prefixIcon,
          color: Color(0xff0A66C2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: textColor ?? Color(0xff0A66C2),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Color(0xff0A66C2)),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Color(0xff0A66C2)),
            borderRadius: BorderRadius.circular(10))),
  );
}

mainTextButton({
  required BuildContext context,
  required var child,
  var backgroundColor,
  required var onPressed,
  var borderColor,
  double? radius,
}) {
  return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        side: BorderSide(
          color: borderColor ?? Theme.of(context).primaryColor,
        ),
        backgroundColor: backgroundColor ?? Colors.white,
      ),
      child: child);
}
