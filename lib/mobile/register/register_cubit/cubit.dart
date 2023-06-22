import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/onboarding/onboarding_screen.dart';
import 'package:projects/mobile/register/login/login_screen.dart';
import 'package:projects/mobile/register/register_cubit/state.dart';
import 'package:projects/mobile/register/sign_up/sign_up.dart';
import 'package:projects/model/login_model.dart';
import 'package:projects/shared/network/end_points.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get({
    required BuildContext context,
  }) =>
      BlocProvider.of(context);
  List<Widget> screen = [LoginScreen(), SignUpScreen()];
  List image = [
    "assets/images/login.jpeg",
    "assets/images/signup.jpeg",
  ];
  var width;
  var height;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool showLoginPassword = false;
  bool loginRememberMe = false;
  var loginFormKey = GlobalKey<FormState>();

  TextEditingController signupUsernameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupPassword2Controller = TextEditingController();
  bool signupRememberMe = false;
  var signupFormKey = GlobalKey<FormState>();
  bool showSignupPassword = false;
  bool showSignupPassword2 = false;

  sizeOfScreen({
    required BuildContext context,
  }) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  bool isInLoginScreen = true;

  changeRegisterBody() {
    isInLoginScreen = !isInLoginScreen;
    emit(RegisterChangeBodyState());
  }

  loginShowPassword() {
    showLoginPassword = !showLoginPassword;
    emit(RegisterShowLoginPasswordState());
  }

  signupShowPassword() {
    showSignupPassword = !showSignupPassword;
    emit(RegisterShowSignupPasswordState());
  }

  signupShowPassword2() {
    showSignupPassword2 = !showSignupPassword2;
    emit(RegisterShowSignupPassword2State());
  }

  checkBox() {
    loginRememberMe = !loginRememberMe;
    emit(RegisterLoginCheckBoxState());
  }

  final dio = Dio();
  LoginAndRegisterModel? loginModel;
  LoginAndRegisterModel? registerModel;

  login({
    required var email,
    required var password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    print(email);
    dio
        .post(LOGIN,
            data: {
              "email": email,
              "password": password,
            },
            options: Options(receiveDataWhenStatusError: true, headers: {
              "Accept": "application/vnd.api+json",
              "Content-Type": "application/vnd.api+json",
            }))
        .then((value) {
      emit(LoginSuccessState());
      print(value.data["data"]["token"]);
      loginModel = LoginAndRegisterModel.fromJson(value.data);
      CashHelper.putData(key: "token", value: loginModel!.data.token);
      CashHelper.putData(key: "id", value: loginModel!.data.user.id.toString());
      print(CashHelper.getString(key: "token"));
      print(CashHelper.getString(key: "id"));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
        (route) => false,
      );
    }).catchError((error) {
      print(error.toString());
      emit(LoginFailState(error: error.toString()));
    });
  }

  register({
    required var name,
    required var email,
    required var password,
    required var password_confirmation,
    required BuildContext context,
  }) {
    emit(RegisterLoadingState());
    print(email);
    dio
        .post(REGISTER,
            data: {
              "name": name,
              "email": email,
              "password": password,
              "password_confirmation": password_confirmation,
            },
            options: Options(receiveDataWhenStatusError: true, headers: {
              "Accept": "application/vnd.api+json",
              "Content-Type": "application/vnd.api+json",
            }))
        .then((value) {
      emit(RegisterSuccessState());
      print(value.data["data"]["token"]);
      registerModel = LoginAndRegisterModel.fromJson(value.data);
      CashHelper.putData(key: "token", value: registerModel!.data.token);
      CashHelper.putData(key: "id", value: registerModel!.data.user.id);
      print(CashHelper.getString(key: "token"));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
        (route) => false,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterFailState(error: error.toString()));
    });
  }
//   DioHelper.dio!.post(
//       LOGIN,
//       data: {
//     "email": email,
//     "password": password,
//   },
//   options: Options(
//   headers:  {
//       "Accept":"application/vnd.api+json",
//       "Content-Type":"application/vnd.api+json",
//       }
//   )).then((value) {
//     print(value.data);
//     print(value.toString());
//     return value.data;
//   }).catchError((error){
//     print( error.toString());
//   });
// }
}
