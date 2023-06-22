import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/mobile/register/sign_up/cubit/state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  TextEditingController user_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  navigateUsingSignupButton({
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    }
  }
}