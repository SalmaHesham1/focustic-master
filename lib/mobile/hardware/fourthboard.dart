import 'package:flutter/material.dart';

class fourthdboard extends StatefulWidget {
  const fourthdboard({Key? key}) : super(key: key);

  @override
  State<fourthdboard> createState() => _fourthdboardState();
}

class _fourthdboardState extends State<fourthdboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Turn on your phones ",
                style: TextStyle(
                    color: Color.fromRGBO(6, 113, 185, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 29),
              ),
              Text(
                " Bluetooth",
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
                      color: Colors.black.withOpacity(0.5), fontSize: 14)),
              Text("To the app for wi-fi ",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 14)),
            ],
          )),
          Expanded(
              child: Image.asset(
            "assets/icons/bluetooth.png",
          ))
        ],
      ),
    );
  }
}
