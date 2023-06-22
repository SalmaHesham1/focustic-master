// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projects/mobile/splash/splash_screen.dart';
import 'package:projects/shared/network/local/cash_helper.dart';
import 'package:projects/shared/network/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CashHelper.init();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff003151),
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xff0A66C2),
        ),
        primaryColor: Colors.blue,
        hintColor: Color(0xff0A66C2),
        focusColor: Color(0xff0A66C2),
        iconTheme: IconThemeData(
          color: Color(0xff0A66C2),
        ),
      ),
      home: SplashScreen(),
      // Builder(builder: (context){
      //
      //   if(MediaQuery.of(context).size.width <=560){
      //     CashHelper.putData(key: "isWeb", value: false);
      //     print("mobile");
      //   }
      //   else{
      //     CashHelper.putData(key: "isWeb", value: true);
      //     print("web");
      //   }
      //   return screenType(
      //     context: context,
      //     screen: LoginScreen(),);
      //
      // }),
    );
  }
}
