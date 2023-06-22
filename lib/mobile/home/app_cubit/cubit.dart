import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projects/mobile/about/about_screen.dart';
import 'package:projects/mobile/community/community_screen.dart';
import 'package:projects/mobile/community/join_screen.dart';
import 'package:projects/mobile/edit/editProfile.dart';
import 'package:projects/mobile/home/HomeBody.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/mobile/library/library_screen.dart';
import 'package:projects/mobile/more/more_screen.dart';
import 'package:projects/mobile/onboarding/onboarding_screen.dart';
import 'package:projects/mobile/profile/communit_profile.dart';
import 'package:projects/mobile/profile/profile.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/report/report_screen.dart';
import 'package:projects/mobile/report/success_report_screen.dart';
import 'package:projects/mobile/seccions/sessions_screen.dart';
import 'package:projects/mobile/services/services_screen.dart';
import 'package:projects/mobile/settings/settings_screen.dart';
import 'package:projects/mobile/tasks/Add%20Tasks/ToDoList.dart';
import 'package:projects/mobile/tasks/myTask.dart';
import 'package:projects/model/tasks_model.dart';
import 'package:projects/shared/network/end_points.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

import '../../community/coach_profile.dart';
import '../../community/welcome_screen.dart';
import '../../notifications/notifications_screen.dart';
import '../../tasks/task_duration.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  var scaffoldKey = GlobalKey<ScaffoldState>();

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isFeature1Hover = false;
  bool isFeature2Hover = false;
  bool isFeature3Hover = false;
  bool isFeature4Hover = false;
  bool isJoinButtonClicked = false;

  List<Widget> screen = [
    HomeBody(),
    ToDo(),
    ServicesScreen(),
    AboutScreen(),
    ProfileScreen(),
    SettingsScreen(),
    MoreScreen(),
    LibraryScreen(),
    CommunityScreen(),
    CommunityProfileScreen(),
    ToDo(),
    MyTask(),
    JoinCommunityScreen(),
    CoachProfileScreen(),
    NotificationsScreen(),
    TaskDurationScreen(),
    WelcomeScreen(),
    SessionsScreen(),
    ReportScreen(),
    SuccessReportScreen(),
    EditProfile(),
  ];
  int indexOfPage = 0;
  bool isJoinCommunityScreen = false;

  joinToCommunity() {
    isJoinCommunityScreen = true;
    print(isJoinCommunityScreen);
    emit(isJoinCommunityScreenState());
  }

  changeBody({required int index}) {
    indexOfPage = index;
    print(indexOfPage.toString());
    emit(ChangBodyState());
  }

  void joinButtonClicked() {
    isJoinButtonClicked = !isJoinButtonClicked;
    emit(JoinButtonTappedState());
  }

  Widget animateFeature1({
    required Widget text,
  }) {
    return MouseRegion(
      child: text,
      cursor: SystemMouseCursors.click,
      onHover: (context) {
        isFeature1Hover = true;
        isFeature2Hover = false;
        isFeature3Hover = false;
        isFeature4Hover = false;
        print(isFeature1Hover.toString());
        print("hoverd");
        emit(HoveFeature1State());
      },
      onExit: (context) {
        isFeature1Hover = false;
        print("end hower");
        emit(ExitHoveFeature1State());
      },
    );
  }

  bool speedDialClicked = false;

  changeSpeedDialColor() {
    speedDialClicked = !speedDialClicked;
    emit(SpeedDialChangeColorState());
  }

  Widget animateFeature2({
    required Widget text,
  }) {
    return MouseRegion(
      child: text,
      cursor: SystemMouseCursors.click,
      onHover: (context) {
        isFeature2Hover = true;
        isFeature1Hover = false;
        isFeature3Hover = false;
        isFeature4Hover = false;
        print(isFeature2Hover.toString());
        print("hoverd");
        emit(HoveFeature2State());
      },
      onExit: (context) {
        isFeature2Hover = false;
        print("end hower");
        emit(ExitHoveFeature2State());
      },
    );
  }

  Widget animateFeature3({
    required Widget text,
  }) {
    return MouseRegion(
      child: text,
      cursor: SystemMouseCursors.click,
      onHover: (context) {
        isFeature3Hover = true;
        isFeature1Hover = false;
        isFeature2Hover = false;
        isFeature4Hover = false;
        print(isFeature3Hover.toString());
        print("hoverd");
        emit(HoveFeature3State());
      },
      onExit: (context) {
        isFeature3Hover = false;
        print("end hower");
        emit(ExitHoveFeature3State());
      },
    );
  }

  Widget animateFeature4({
    required Widget text,
  }) {
    return MouseRegion(
      child: text,
      cursor: SystemMouseCursors.click,
      onHover: (context) {
        isFeature4Hover = true;
        isFeature1Hover = false;
        isFeature2Hover = false;
        isFeature3Hover = false;
        print(isFeature4Hover.toString());
        print("hoverd");
        emit(HoveFeature4State());
      },
      onExit: (context) {
        isFeature4Hover = false;
        print("end hower");
        emit(ExitHoveFeature4State());
      },
    );
  }

  TextEditingController timeController = TextEditingController();
  var duration = "00:00:00";

  changeTaskDuration({required var time}) {
    duration = time;
    emit(ChangeTaskDurationState());
  }

  final dio = Dio();

  logOut({
    required BuildContext context,
  }) {
    dio.post("https://focustic-2.000webhostapp.com/api/v1/logout",
        options: Options(
          receiveDataWhenStatusError: true,
          headers: {
            'Authorization': "41|lhJfWu8kT698Cn9JNjGeG4WibXXSAIDWyzwNBRnQ"
          },
        ))
        .then((value) {
      print(value.data);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
        (route) => false,
      );
    });
  }

  List<PopupMenuItem> todayTasks = [
    PopupMenuItem(
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Color.fromRGBO(135, 199, 255, 1),
                width: 1,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Task " + '1',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    DateFormat("hh:mm a").format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )),
    ),
  ];
  List yesterdayTasks = [];
  bool startHardware = false;

  changeHardwareState({required bool success}) {
    startHardware = success;
    print(startHardware);
    emit(SuccessStartHardwareState());
  }


  logout({
    required var token,
    required BuildContext context
  }) {
    emit(LogOutLoadingState());
    print(token);
    dio
        .post(LOGOUT,
        options: Options(
            receiveDataWhenStatusError: true,
            headers: {
              "Accept": "application/vnd.api+json",
              "Content-Type": "application/vnd.api+json",
              "Authorization": "Bearer $token",

            }))
        .then((value) {
      emit(LogOutSuccessState());
      print(value.data);
      CashHelper.remove(key: "token");
      CashHelper.remove(key: "id");
      CashHelper.remove(key: "hardware");
      print(CashHelper.getString(key: "token"));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
        (route) => false,
      );
    }).catchError((error) {
      print(error.toString());
      emit(LogOutFailState(error: error.toString()));
    });
  }

  TasksModel? tasksModel;
  Data? dailyTasksModel;
  Data? weeklyTasksModel;
  Data? monthlyTasksModel;
  List dailyList = [];
  List weeklyList = [];
  List monthlyList = [];

  Future getAllTasks(
      {required var token, required BuildContext context}) async {
    emit(AllTasksLoadingState());
    return await dio!
        .get(
      options: Options(headers: {
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json",
        "Authorization": "Bearer $token",
      }),
      ALLTASKS,
    )
        .then((value) {
      // print(value.data.toString());
      tasksModel = TasksModel.fromJson(value.data!);
      // print(tasksModel!.data);
      // print(tasksModel!.data.length);
      print("lenght ${value.data["data"].length.toString()}");
      for (int i = 0; i < tasksModel!.data.length; i++) {
        print(i);
        // print(value.data["data"][i]["id"]);
        // print(value.data["data"][i]["attributes"]["kind"]=="daily");
        // print(value.data["data"][i]);
        if (tasksModel!.data[i].attributes.kind == "daily") {
          dailyTasksModel = Data.fromJson(value.data!["data"][i]);
          dailyList.add(dailyTasksModel);
          print(dailyList[0].id);
          print("daily");
        } else if (value.data["data"][i]["attributes"]["kind"] == "weekly") {
          weeklyTasksModel = Data.fromJson(value.data!["data"][i]);
          weeklyList.add(weeklyTasksModel);
          print(weeklyList[0].id);
          print("weekly");
        } else if (value.data["data"][i]["attributes"]["kind"] == "monthly") {
          monthlyTasksModel = Data.fromJson(value.data!["data"][i]);
          monthlyList.add(monthlyTasksModel);
          print(monthlyList[0].id);
          print("monthly");
        }
      }
      print("----------------------------");
      emit(AllTasksSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AllTasksFailState(error: error.toString()));
    });
  }
}
