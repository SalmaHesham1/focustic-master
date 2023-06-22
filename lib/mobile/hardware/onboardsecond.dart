import 'package:flutter/material.dart';

class secondboard extends StatefulWidget {
  const secondboard({Key? key}) : super(key: key);

  @override
  State<secondboard> createState() => _secondboardState();
}

class _secondboardState extends State<secondboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Grap your HW",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 113, 185, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                SizedBox(
                  height: 18,
                ),
                Text("Your HM has advanced sensors  ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
                Text("That measure your posture more ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
                Text("Than 60 times a second",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: AlignmentDirectional.bottomEnd,
                    image: AssetImage("assets/icons/hand and fuc.png"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
