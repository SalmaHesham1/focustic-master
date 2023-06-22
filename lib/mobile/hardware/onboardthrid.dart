import 'package:flutter/material.dart';

class thirdboard extends StatefulWidget {
  const thirdboard({Key? key}) : super(key: key);

  @override
  State<thirdboard> createState() => _thirdboardState();
}

class _thirdboardState extends State<thirdboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Turn on your HW",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 113, 185, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                SizedBox(
                  height: 18,
                ),
                Text("Press the power button ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
                Text("and Wait for a blinking red ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
                Text("light",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
              ],
            ),
          ),
          Expanded(
            child: Container(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset("assets/icons/FUC.png")),
          )
        ],
      ),
    );
  }
}
