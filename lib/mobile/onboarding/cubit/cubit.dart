import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/onboarding/cubit/state.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() :super(OnBoardingInitState());

  static OnBoardingCubit get({required BuildContext context}) =>
      BlocProvider.of(context);
  int index = 0;
  PageController pageViewController = PageController(initialPage: 0);

  changePageView({required var numOfPage}) {
    index = numOfPage;
    emit(OnBoardingChangeIndicatorState());
  }

  List <String> reason=[
    "Time Management",
    "Set Goals",
    "Improve Productivity",
    "Healthcare",
    "Monitoring Activity",
  ];

  List<bool> reasonClicked=[false,false,false,false,false,];

  List <String> exercise=[
    "General",
    "Neck and Shoulder Relief",
    "Eye Care and Vision",
    "Wrist and Hand Mobility",
    "Back and Spine",
    "Breathing and Relaxation",
    "Stretch Breaks and Micro Movements",
    "Mental Health and Mindfulness",
  ];

  List<bool> exerciseClicked=[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  changeReasonColor({required int index}){
    reasonClicked[index] = !reasonClicked[index];
    emit(ChangeReasonColorState());
  }

  changeExerciseColor({required int index}){
    exerciseClicked[index] = !exerciseClicked[index];
    emit(ChangeExerciseColorState());
  }
}