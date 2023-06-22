import 'package:flutter/material.dart';
import 'package:projects/mobile/register/sign_up/cubit/cubit.dart';
import 'package:projects/mobile/welcome_back/welcome_back_screen.dart';

//have an account button
Widget haveAnAccountButton({required BuildContext context}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: mainContainer(
        radius: 14.0,
        color: Color(0xff0864A2),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomeBackScreen()),
                (route) => false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 20,
                color: Colors.black,
              ),
              Text(
                "Already have an account, Click to login",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );

//sign up with button
Widget signUpWith({
  required var onTap,
  required String image,
  required String text,
  required BuildContext context,
}) =>
    mainContainer(
      colorOfTheBorder: Colors.grey,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: MaterialButton(
        onPressed: onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                fit: BoxFit.fill,
                width: 40,
                height: 40,
                image: AssetImage(
                  image,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );

//text form for sign up
Widget signUpTextForm({
  required String hint,
  required TextInputType type,
  required FormFieldValidator? validator,
  required TextEditingController? controller,
}) =>
    TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
      style: TextStyle(
        fontSize: 13,
      ),
      textAlignVertical: TextAlignVertical.bottom,
      keyboardType: type,
      validator: validator,
      controller: controller,
    );

//main container
Widget mainContainer({
  var color,
  double? radius,
  var colorOfTheBorder,
  required Widget? child,
  var boxShadow,
}) =>
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: colorOfTheBorder ?? Colors.white.withOpacity(0),
        ),
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 10.0),
      ),
      child: child,
    );

//signup text
Widget signUpText() => Column(
      children: [
        Text(
          "SIGN-UP",
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
            fontSize: /* CashHelper.getBool(key: "isWeb") ? 80 : */ 50,
          ),
        ),
        Text(
          "Use an of the options below to register",
          maxLines: 1,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: /*CashHelper.getBool(key: "isWeb") ? 18 :*/ 12,
          ),
        )
      ],
    );
//sign up form
Widget signUpForm({
  required TextEditingController user_name,
  required TextEditingController email,
  required TextEditingController password1,
  required TextEditingController password2,
}) =>
    Column(
      children: [
        signUpTextForm(
          hint: "USER NAME",
          type: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "ENTER YOUR USER NAME";
            }
          },
          controller: user_name,
        ),
        signUpTextForm(
          hint: "E-MAIL",
          type: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return "ENTER E-MAIL";
            }
          },
          controller: email,
        ),
        signUpTextForm(
          hint: "PASSWORD",
          type: TextInputType.visiblePassword,
          validator: (value) {
            if (value!.isEmpty) {
              return "ENTER YOUR PASSWORD";
            }
          },
          controller: password1,
        ),
        signUpTextForm(
          hint: "TYPE PASSWORD AGAIN",
          type: TextInputType.visiblePassword,
          validator: (value) {
            if (value!.isEmpty) {
              return "ENTER YOUR PASSWORD";
            } else if (password1 != password2) {
              return "ENTER YOUR PASSWORD CORRECT";
            }
          },
          controller: password2,
        ),
      ],
    );

//sign up button
Widget signUpButton({
  required BuildContext context,
}) =>
    Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: mainContainer(
              radius: 60.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  onPressed: () {
                    SignUpCubit.get(context)
                        .navigateUsingSignupButton(context: context);
                  },
                  child: Text(
                    "SIGN-UP",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3F7CA5),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

//or text
Widget orText() => Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Container(
        height: /*CashHelper.getBool(key: "isWeb") ? 300 : */ 15,
        width: /*CashHelper.getBool(key: "isWeb") ? 30 : */ 160,
        child: /* CashHelper.getBool(key: "isWeb")
            ? Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    " OR ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            : */
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Text(
              " OR ",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

//build layout
/*Widget buildLayout({
  required BuildContext context,
  required Widget screen,
}) =>
    Builder(builder: (context) {
      if (MediaQuery.of(context).size.width <= 560) {
        CashHelper.putData(key: "isWeb", value: false);
        print("mobile");
      } else {
        CashHelper.putData(key: "isWeb", value: true);
        print("web");
        MediaQuery.of(context).copyWith(
          textScaleFactor: 2,
        );
      }
      return screenType(screen: screen, context: context,);
    });*/
// Widget screenType(
// {
//   required Widget screen,
//   required BuildContext context,
//
// }
//     )=>ScreenTypeLayout(
//   mobile: Builder(builder:(context) {
//     CashHelper.putData(key: "isWeb", value: false).then((value) {
//
//       print("mobile should false L=:${CashHelper.getBool(key: "isWeb")
//           .toString()}");
//       print(value.toString());
//     }).catchError((value){
//       print(value.toString());
//       print("////////////////////////////");
//     });
//     return screen;}),
//   desktop: Builder(builder:(context) {
//     CashHelper.putData(key: "isWeb", value: true).then((value){
//       print("web should true L=:${CashHelper.getBool(key: "isWeb")
//           .toString()}");
//       print("--------------------------------------------------------------------");
//     });
//     return screen;}),
//   breakpoints: ScreenBreakpoints(
//     desktop: 600,
//     tablet: 600,
//     watch: 100,
//   ),
// );

//sign up now button
Widget signupNowButton({
  required BuildContext context,
  required Widget screen,
}) =>
    MaterialButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => screen), (route) => false);
      },
      child: Text(" SIGN-UP Now ",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      //alignment: Alignment.topLeft,
    );