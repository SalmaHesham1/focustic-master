import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendAMessageScreen extends StatelessWidget {
  const SendAMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("SEND A MESSAGE"),
      ),
    );
    // return  ScreenTypeLayout(
    //   mobile: Builder(builder:(context) {
    //     CashHelper.putData(key: "isWeb", value: false);
    //     return Scaffold(
    //       appBar: AppBar(),
    //       body: Center(
    //         child: Text("SEND A MESSAGE"),
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
    //         child: Text("SEND A MESSAGE"),
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
