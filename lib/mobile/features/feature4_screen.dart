import 'package:flutter/material.dart';

class Feature4Screen extends StatelessWidget {
  const Feature4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("FEATURE 4"),
      ),
    );
    // return  ScreenTypeLayout(
    //   mobile: Builder(builder:(context) {
    //     CashHelper.putData(key: "isWeb", value: false);
    //     return Scaffold(
    //       appBar: AppBar(),
    //       body: Center(
    //         child: Text("FEATURE 4"),
    //       ),
    //     );}),
    //   desktop: Builder(builder:(context) {
    //     CashHelper.putData(key: "isWeb", value: true).then((value){
    //       print(CashHelper.getBool(key: "isWeb").toString());
    //       print("--------------------------------------------------------------------");
    //     });
    //     return Scaffold(
    //       appBar: AppBar(),
    //       body: Center(
    //         child: Text("FEATURE 4"),
    //       ),
    //     );}),
    //   breakpoints: ScreenBreakpoints(
    //     desktop: 600,
    //     tablet: 600,
    //     watch: 100,
    //   ),
    // );
  }
}
