import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/register/login/cubit/cubit.dart';
import 'package:projects/mobile/register/login/cubit/states.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildLoginForm(
            context: context,
          );
        },
      ),
    );
  }

  //v2 of login screen of mobile
  Widget buildLoginForm({
    required BuildContext context,
  }) =>
      Container(
        color: Colors.green,
      );

// v1 of login scree of mobile

// Widget buildLoginScreen({
//   required BuildContext context,
// }) =>
//     Scaffold(
//       body: SafeArea(
//         child: Container(
//           height: double.infinity,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: /*CashHelper.getBool(key: "isWeb")? 160:*/ 15,
//                   vertical: /*CashHelper.getBool(key: "isWeb")? 100:*/ 8,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     //login form
//                     mainContainer(
//                       radius: 20.0,
//                       color: Color(0xff0864A2),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 40,
//                           horizontal: 25,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text(
//                                       "START YOUR OWN PATH FOR A HEAL THEIR WORK",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .caption!
//                                           .copyWith(
//                                             color: Colors.white,
//                                           ),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "ENVIRONMENT",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline4!
//                                           .copyWith(
//                                             color: Colors.white,
//                                           ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       "PLEASE ENTER YOUR EMAIL AND PASSWORD",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .caption!
//                                           .copyWith(
//                                             color: Colors.white,
//                                           ),
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     Form(
//                                       key: LoginCubit.get(context).formkey,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           TextFormField(
//                                             keyboardType:
//                                                 TextInputType.emailAddress,
//                                             controller:
//                                                 LoginCubit.get(context).email,
//                                             validator: (value) {
//                                               if (value!.isEmpty) {
//                                                 return "email is required";
//                                               } else if (value.length < 6) {
//                                                 return "enter a valid email";
//                                               }
//                                             },
//                                             decoration: InputDecoration(
//                                               hintText: "E-mail",
//                                               enabledBorder:
//                                                   OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: BorderSide(
//                                                   color: Colors.black,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                               disabledBorder:
//                                                   OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: BorderSide(
//                                                   color: Colors.black,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                               focusedBorder:
//                                                   OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: BorderSide(
//                                                   color: Colors.black,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           //password
//
//                                           TextFormField(
//                                             // obscureText: true,
//                                             controller:
//                                                 LoginCubit.get(context)
//                                                     .password,
//                                             validator: (value) {
//                                               if (value!.isEmpty) {
//                                                 return "password is required";
//                                               } else if (value.length < 5) {
//                                                 return "Password should have at least 5 letters";
//                                               }
//                                             },
//                                             keyboardType:
//                                                 TextInputType.visiblePassword,
//                                             decoration: InputDecoration(
//                                               hintText: "password",
//                                               enabledBorder:
//                                                   OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: BorderSide(
//                                                   color: Colors.black,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                               disabledBorder:
//                                                   OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: BorderSide(
//                                                   color: Colors.black,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                               focusedBorder:
//                                                   OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: BorderSide(
//                                                   color: Colors.black,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Row(
//                                     children: [
//                                       Checkbox(
//                                         value: LoginCubit.get(context)
//                                             .isRememberMe,
//                                         checkColor: Colors.grey,
//                                         activeColor: Colors.white,
//                                         onChanged: (value) {
//                                           LoginCubit.get(context)
//                                               .changeCheckbox();
//                                         },
//                                       ),
//                                       Text(
//                                         "Remember me",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .caption!
//                                             .copyWith(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: MaterialButton(
//                                     onPressed: () {
//                                       /* Navigator.of(context)
//                                               .push(MaterialPageRoute(builder: (context) {
//                                             return ForgetScreen();
//                                           }));*/
//                                     },
//                                     child: Text(
//                                       " Forget the password ? ",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .caption!
//                                           .copyWith(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: mainContainer(
//                                     color: Theme.of(context)
//                                         .scaffoldBackgroundColor,
//                                     child: MaterialButton(
//                                       onPressed: () {
//                                         if (LoginCubit.get(context)
//                                             .formkey
//                                             .currentState!
//                                             .validate()) {
//                                           Navigator.pushAndRemoveUntil(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     HomeScreen()),
//                                             (route) => false,
//                                           );
//                                         }
//                                       },
//                                       child: Text(
//                                         'Login',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .button,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     //login using
//                     mainContainer(
//                         color: Color(0xff0864A2),
//                         radius: 20,
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 "Login using ",
//                                 style: Theme.of(context).textTheme.headline6,
//                               ),
//                               Row(
//                                 children: [
//                                   MaterialButton(
//                                     minWidth: 1,
//                                     child: Container(
//                                       width: 40,
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/icons/linkedin.png"),
//                                               fit: BoxFit.cover),
//                                           color:
//                                               Theme.of(context).primaryColor),
//                                     ),
//                                     onPressed: () {},
//                                   ),
//                                   MaterialButton(
//                                     minWidth: 1,
//                                     child: Container(
//                                       width: 40,
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                                 "assets/icons/google.png"),
//                                             fit: BoxFit.cover,
//                                           ),
//                                           color: Colors.white),
//                                     ),
//                                     onPressed: () {},
//                                   ),
//                                 ],
//                               ),
//                             ])),
//                     SizedBox(height: 20),
//                     //sign up button
//                     Text("DON’T HAVE AN ACCOUNT ? ",
//                         style:
//                             TextStyle(color: Colors.white70, fontSize: 17)),
//                     signupNowButton(context: context, screen: SignUpScreen()),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
}
