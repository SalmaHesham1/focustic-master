import 'package:flutter/material.dart';

class firstboard extends StatefulWidget {
  const firstboard({Key? key}) : super(key: key);

  @override
  State<firstboard> createState() => _firstboardState();
}

class _firstboardState extends State<firstboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Let's set up and get ",
            style: TextStyle(
              color: Color.fromRGBO(6, 113, 185, 1),
              fontWeight: FontWeight.bold,
              fontSize: 29,
            ),
          ),
          Text(
            "To know your HW ",
            style: TextStyle(
                color: Color.fromRGBO(6, 113, 185, 1),
                fontWeight: FontWeight.bold,
                fontSize: 29),
          ),
          SizedBox(
            height: 18,
          ),
          Text("Tap the right arrow to start the",
              style: TextStyle(
                  color: Color.fromRGBO(0, 27, 45, 0.5), fontSize: 14)),
          Text("setup, this will take a few minutes.",
              style: TextStyle(
                  color: Color.fromRGBO(0, 27, 45, 0.5), fontSize: 14)),
        ],
      ),
    );
  }
}
