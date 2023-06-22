import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/profile/cubit/states.dart';
import 'package:projects/model/report_model.dart';
import 'package:projects/model/user_model.dart';
import 'package:projects/shared/network/end_points.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  var scaffoldKey = GlobalKey<ScaffoldState>();

  static ProfileCubit get(context) => BlocProvider.of(context);

  //animate when tap on text
  bool isTasksTaped = false;
  bool isCommunicateTaped = false;

  animateWhenTap({required bool isTabbed}) {
    if (isTabbed) {
      isTasksTaped = !isTasksTaped;
      emit(AnimateTextState());
    } else {
      isCommunicateTaped = !isCommunicateTaped;
      emit(AnimateTextState());
    }
  }

  bool isTasksHover = false;
  bool isCommunicateHover=false;
  bool isEditHover=false;
  Widget animateTasks({
    required Widget text,
}){
    return MouseRegion(
      child: text,
      cursor: SystemMouseCursors.click,
      onHover: (context){
        isTasksHover=true;
        print(isTasksHover.toString());
        print("hoverd");
        emit(HoveTasksState());
        },
      onExit: (context){
        isTasksHover=false;
        print("end hower");
        emit(ExitHoveTasksState());
      },
    );
  }
  Widget animateCommunicate({
    required Widget text,
}){
    return MouseRegion(
      child: text,
      cursor: SystemMouseCursors.click,
      onHover: (context){
        isCommunicateHover=true;
        print(isTasksHover.toString());
        print("hoverd");
        emit(HoveCommunicateState());
        },
      onExit: (context){
        isCommunicateHover=false;
        print("end hower");
        emit(ExitHoveCommunicateState());
      },
    );
  }
  Widget animateEdit({
    required Widget child,
}){
    return MouseRegion(
      child: child,
      cursor: SystemMouseCursors.click,
      onHover: (context){
        isEditHover=true;
        print(isTasksHover.toString());
        print("hoverd");
        emit(HoveAnimateState());
      },
      onExit: (context) {
        isEditHover = false;
        print("end hower");
        emit(ExitHoveAnimateState());
      },
    );
  }

  bool appBarActionTaped = false;

  changeAppBarActionColor({
    required bool tap,
  }) {
    tap = !tap;
    ;
    emit(ChangeAppBarActionColorState());
  }

  var myProfile;

  myProfileState({required bool isMyProfile}) {
    myProfile = isMyProfile;
    emit(MyProfileState());
  }

  var isCoachProfile = false;

  coachProfile({required bool isCoach}) {
    isCoachProfile = isCoach;
    emit(CoachProfileScreen());
  }

  UserModel? userModel;
  ReportModel? reportModel;
  var dio = Dio();

  showProfile({required var token, required BuildContext context}) {
    String id = CashHelper.getString(key: "id");
    emit(ShowProfileLoadingState());
    print(token);
    dio
        .get("$USER/$id",
            options: Options(receiveDataWhenStatusError: true, headers: {
              "Accept": "application/vnd.api+json",
              "Content-Type": "application/vnd.api+json",
              "Authorization": "Bearer $token",
            }))
        .then((value) {
      print(value.data["data"]);
      userModel = UserModel.fromJson(value.data);
      print(userModel!.data.id);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => RegisterScreen()),
      //       (route) => false,
      // );
      emit(ShowProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShowProfileFailState(error: error.toString()));
    });
  }

  showReport(
      {
      // required var token,
      required BuildContext context}) {
    String id = CashHelper.getString(key: "id");
    emit(ShowReportLoadingState());
    // print(token);
    dio
        .get("$REPORT/$id",
            options: Options(receiveDataWhenStatusError: true, headers: {
              "Accept": "application/vnd.api+json",
              "Content-Type": "application/vnd.api+json",
              // "Authorization": "Bearer $token",
            }))
        .then((value) {
      print(value.data);
      reportModel = ReportModel.fromJson(value.data);
      print(reportModel!.attributes.completedTasks);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => RegisterScreen()),
      //       (route) => false,
      // );
      emit(ShowReportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShowReportFailState(error: error.toString()));
    });
  }
}