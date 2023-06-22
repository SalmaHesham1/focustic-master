import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/hardware/cubit/state.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitState());

  static OnBoardingCubit get({required BuildContext context}) =>
      BlocProvider.of(context);
  int index = 0;
  PageController pageViewController = PageController(initialPage: 0);

  changePageView({required var numOfPage}) {
    index = numOfPage;
    emit(OnBoardingChangeIndicatorState());
  }

  bool showPassword = false;

  chageShowPassword() {
    showPassword = !showPassword;
    print(showPassword);
    emit(OnBoardingChaneShowPasswordState());
  }
}
