import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/hardware/mainbutton.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/mobile/home/home_screen.dart';

class lastboard extends StatefulWidget {
  const lastboard({Key? key}) : super(key: key);

  @override
  State<lastboard> createState() => _lastboardState();
}

class _lastboardState extends State<lastboard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
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
                  "ALL SET!",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 113, 185, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                SizedBox(
                  height: 18,
                ),
                Image.asset("assets/icons/true.png"),
                SizedBox(
                  height: 26,
                ),
                Container(
                    width: 180,
                    height: 42,
                    child: mainTextButton(
                      context: context,
                      child: Text("Let’s get start",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {
                        HomeCubit.get(context)
                            .changeHardwareState(success: true);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                        );
                      },
                      backgroundColor: Color.fromRGBO(6, 72, 116, 1),
                      radius: 13,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
