import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/hardware/cubit/cubit.dart';
import 'package:projects/mobile/hardware/cubit/state.dart';
import 'package:projects/mobile/hardware/mainbutton.dart';

class sixboard extends StatefulWidget {
  const sixboard({Key? key}) : super(key: key);

  @override
  State<sixboard> createState() => _sixboardState();
}

class _sixboardState extends State<sixboard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Let's connect to  ",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 113, 185, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                Text(
                  "Your wi-fi",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 113, 185, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                SizedBox(
                  height: 18,
                ),
                Text("Please enter your",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 14)),
                Text(" Wifi name and password ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
                SizedBox(
                  height: 26,
                ),
                Container(
                  width: 239,
                  height: 33,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Your wifi name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(
                                  6, 113, 185, 1)), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          //<-- SEE HERE
                          borderSide: BorderSide(
                              width: 1, color: Color.fromRGBO(6, 113, 185, 1)),
                        ),
                        prefixIcon: Image.asset("assets/icons/wifiicon.png")),
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Container(
                  width: 239,
                  height: 33,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    //to hide pass
                    obscureText:
                        !OnBoardingCubit.get(context: context).showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                                Color.fromRGBO(6, 113, 185, 1)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13), //<-- SEE HERE
                        borderSide: BorderSide(
                            width: 1, color: Color.fromRGBO(6, 113, 185, 1)),
                      ),
                      prefixIcon: Image.asset("assets/icons/Passicon.png"),
                      suffixIcon: IconButton(
                        icon: Icon(
                            OnBoardingCubit.get(context: context).showPassword
                                ? Icons.visibility_sharp
                                : Icons.visibility_off_sharp),
                        onPressed: () {
                          OnBoardingCubit.get(context: context)
                              .chageShowPassword();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                    width: 180,
                    height: 42,
                    child: mainTextButton(
                        context: context,
                        child: Text("SUBMIT",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        onPressed: () {},
                        backgroundColor: Color.fromRGBO(6, 72, 116, 1),
                        radius: 13))
              ],
            ),
          );
        },
      ),
    );
  }
}
