import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/reset_password/cubit/state.dart';
import 'package:projects/mobile/reset_password/page1.dart';
import 'package:projects/mobile/reset_password/page2.dart';
import 'package:projects/mobile/reset_password/page3.dart';
import 'package:projects/mobile/reset_password/page4.dart';
import 'package:projects/mobile/reset_password/page5.dart';
import 'package:projects/shared/network/end_points.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitState());
  TextEditingController email = TextEditingController();
  var key = GlobalKey<FormState>();

  static ResetPasswordCubit get({required BuildContext context}) =>
      BlocProvider.of(context);
  List<Widget> page = [
    ResetPasswordPage1(),
    ResetPasswordPage5(),
    ResetPasswordPage2(),
    ResetPasswordPage3(),
    ResetPasswordPage4(),
  ];
  var index = 0;

  changePage({required var page}) {
    index = page;
    print(index.toString());
    emit(ResetPasswordChangePageState());
  }

  var width;
  var height;
  var formKey = GlobalKey<FormState>();

  sizeOfScreen({
    required BuildContext context,
  }) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  List<bool> showPassword = [false, false];

  ShowPassword({required int index}) {
    showPassword[index] = !showPassword[index];
    emit(ResetPasswordShowOldPasswordState());
  }

  final dio = Dio();

  enterYourEmail({
    required var email,
    required BuildContext context,
  }) {
    emit(ResetPasswordEnterEmailLoadingState());
    print(email);
    dio
        .post(FORGET_PASSWORD,
        data: {
          "email": email,
        },
        options: Options(receiveDataWhenStatusError: true, headers: {
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
        }))
        .then((value) {
      emit(ResetPasswordEnterEmailSuccessState());
      print(value.data);
      // CashHelper.putData(key: "token", value: value.data["data"]["token"]);
      // print(CashHelper.getString(key: "token"));
      ResetPasswordCubit.get(context: context)
          .changePage(page: 2);
    }).catchError((error) {
      print(error.toString());
      emit(ResetPasswordEnterEmailFailState(error: error.toString()));
    });
  }
}
