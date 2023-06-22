import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/welcome_back/cubit/states.dart';

class WelcomeBackCubit extends Cubit<WelcomeBackStates> {
  WelcomeBackCubit() : super(WelcomeBackInitState());

  static WelcomeBackCubit get(context) => BlocProvider.of(context);

  var formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
}
