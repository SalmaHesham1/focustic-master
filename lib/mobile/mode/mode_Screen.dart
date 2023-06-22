import 'package:flutter/material.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/mobile/onboarding/onboarding_screen.dart';
import 'package:projects/mobile/register/register_screen.dart';

class ModeScreen extends StatelessWidget {
  const ModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildMode(context: context),
    );
  }
}

buildMode({
  required BuildContext context,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.12),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/images/mode.png"))),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.0313,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/main_logo.png")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0594,
            ),
            Text("what is the mode you would"),
            Text("prefer most ?"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0496,
            ),
            Row(
              children: [
                Expanded(
                  child: mainTextButton(
                      context: context,
                      child: Text("Light mode"),
                      borderColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoardingScreen()),
                                (route) => false);
                      }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.0378,
                ),
                Expanded(
                  child: mainTextButton(
                      context: context,
                      child: Text("dark mode"),
                      borderColor: Colors.transparent,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoardingScreen()),
                                (route) => false);
                      }),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1112,
            ),
            Text("don't worry you can change it"),
            Text("later :)"),
          ],
        ),
      ),
    ),
  );
}
// Center(
// child: mainTextButton(child: Text("Mode"),
// context: context,
// onPressed: (){
// Navigator.pushAndRemoveUntil(context,
// MaterialPageRoute(builder: (context)=>HomeScreen()),
// (route) => false);
// }),
// )
