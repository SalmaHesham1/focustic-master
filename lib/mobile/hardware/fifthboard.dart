import 'package:flutter/material.dart';

class fifthboard extends StatefulWidget {
  const fifthboard({Key? key}) : super(key: key);

  @override
  State<fifthboard> createState() => _fifthboardState();
}

class _fifthboardState extends State<fifthboard> {
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
                  "Turn on your phone's ",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 113, 185, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                Text(
                  " WIFI",
                  style: TextStyle(
                      color: Color.fromRGBO(6, 113, 185, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                SizedBox(
                  height: 18,
                ),
                Text("This will allow to connect ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 14)),
                Text("Your HW to the app and continue ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
                Text("The setup ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14)),
              ],
            ),
          ),
          Expanded(
            child: Image.asset("assets/icons/wifiimage.png"),
          )
        ],
      ),
    );
  }
}
