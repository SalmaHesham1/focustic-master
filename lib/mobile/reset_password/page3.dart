import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/reset_password/cubit/cubit.dart';
import 'package:projects/mobile/reset_password/cubit/state.dart';
import 'package:projects/mobile/reset_password/reset_password_screen.dart';

class ResetPasswordPage3 extends StatelessWidget {
  const ResetPasswordPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordCubit.get(context: context).sizeOfScreen(context: context);
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ResetPasswordCubit.get(context: context)
              .sizeOfScreen(context: context);
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
                      SizedBox(height: 10),
                      Text("Check your email",
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Enter your new password",
                              style: TextStyle(
                                color: Color(0xff003151),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left),
                        ],
                      ),
                      SizedBox(height: 10),
                      // login form
                      Form(
                          key: ResetPasswordCubit.get(context: context).formKey,
                          child: Column(
                            children: [
                              resetPasswordTextForm(
                                controller:
                                    ResetPasswordCubit.get(context: context)
                                        .oldPasswordController,
                                hintText: "Password",
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock_person_outlined,
                                validator: "Enter Your Old Password",
                                context: context,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    ResetPasswordCubit.get(context: context)
                                        .ShowPassword(index: 0);
                                  },
                                  icon: ResetPasswordCubit.get(context: context)
                                          .showPassword[0]
                                      ? Icon(
                                          Icons.visibility_outlined,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.visibility_off_outlined,
                                          color: Colors.black,
                                        ),
                                ),
                                obscureText:
                                    ResetPasswordCubit.get(context: context)
                                        .showPassword[0],
                                showPassword:
                                    ResetPasswordCubit.get(context: context)
                                        .showPassword[0],
                                index: 0,
                              ),
                              SizedBox(height: 10),
                              resetPasswordTextForm(
                                controller:
                                    ResetPasswordCubit.get(context: context)
                                        .newPasswordController,
                                hintText: "Enter password again",
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock_person_outlined,
                                validator: "Enter Your New Password",
                                context: context,
                                obscureText:
                                    ResetPasswordCubit.get(context: context)
                                        .showPassword[1],
                                showPassword:
                                    ResetPasswordCubit.get(context: context)
                                        .showPassword[1],
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    ResetPasswordCubit.get(context: context)
                                        .ShowPassword(index: 1);
                                  },
                                  icon: ResetPasswordCubit.get(context: context)
                                          .showPassword[1]
                                      ? Icon(
                                          Icons.visibility_outlined,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.visibility_off_outlined,
                                          color: Colors.black,
                                        ),
                                ),
                                index: 1,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: mainTextButton(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        context: context,
                                        child: Text(
                                          "Create new password",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (ResetPasswordCubit.get(
                                                  context: context)
                                              .formKey
                                              .currentState!
                                              .validate()) {
                                            print("________");
                                            ResetPasswordCubit.get(
                                                    context: context)
                                                .changePage(page: 4);
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResetPasswordScreen(
                                                            lastIndex: true)),
                                                (route) => false);
                                            // Navigator.pushAndRemoveUntil(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           ResetPasswordScreen(
                                            //             lastIndex: true,
                                            //           )),
                                            //   (route) => false,
                                            // );
                                          }
                                        }),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          )),
                      // login as visitor button
                      backToLoginButton(context: context),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  width: ResetPasswordCubit.get(context: context).width,
                  padding: EdgeInsets.only(
                    top: ResetPasswordCubit.get(context: context).height *
                        0.0334,
                    bottom:
                        ResetPasswordCubit.get(context: context).height * 0.018,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Didn't get an email?",
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Check your spam, or contact",
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Customer support",
                            style: TextStyle(color: Color(0xffF29972)),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Text(
                        "Terms and conditizons",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    ;
  }
}

resetPasswordTextForm({
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
  required index,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    controller: controller,
    obscureText: !(obscureText ?? true),
    validator: (String? value) {
      if (value!.isEmpty) {
        return validator;
      }
    },
    cursorColor: Color(0xff0A66C2),
    style: TextStyle(color: Color(0xff0A66C2)),
    decoration: InputDecoration(
        prefixIconColor: Color(0xff0A66C2),
        suffixIcon: suffixIcon,
        prefixIcon: Icon(
          prefixIcon,
          color: Color(0xff0A66C2),
        ),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0A66C2)),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0A66C2)),
            borderRadius: BorderRadius.circular(10))),
  );
}
