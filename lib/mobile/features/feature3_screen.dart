import 'package:flutter/material.dart';

class Feature3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("FEATURE 3"),
      ),
    );
    // return  ScreenTypeLayout(
    //   mobile: Builder(builder:(context) {
    //     CashHelper.putData(key: "isWeb", value: false);
    //     return Scaffold(
    //       appBar: AppBar(),
    //       body: Center(
    //         child: Text("FEATURE 3"),
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
    //         child: Text("FEATURE 3"),
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
