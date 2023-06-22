import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/seccions/edit_sessions.dart';
import 'package:projects/mobile/seccions/cubit/state.dart';
import 'package:projects/mobile/seccions/add_sessions.dart';
import 'package:projects/mobile/seccions/list_of_sessions.dart';
import 'package:projects/model/session_model.dart';
import 'package:projects/shared/component/const.dart';
import 'package:projects/shared/network/end_points.dart';
import 'package:projects/shared/network/local/cash_helper.dart';
import 'package:intl/intl.dart';

class SessionsCubit extends Cubit<SessionsStates> {
  SessionsCubit() : super(SessionsInitState());

  static SessionsCubit get({required BuildContext context}) =>
      BlocProvider.of(context);

  String idOfEditSession="0";
  changeIdOfSession({required String index}){
    idOfEditSession=index;
    emit(ChangeIdOfEditSessionState());
  }
  int index = 0;
  List<Widget> screens = [
    ListOfSessionsScreen(),
    EditSessionsScreen(),
    AddSessionsScreen(),
  ];

  changeSessionsScreen({required int numOfScreen}) {
    index = numOfScreen;
    print(index);
    emit(SessionsChangeScreenState());
  }

  TextEditingController sessionEditName = TextEditingController();
  TextEditingController sessionName = TextEditingController();
  List? time=[time_splot[0],time_splot[1]];

  changeTime({required var from, required var to}) {
    if (time![0] != from) {
      time![0] = from;
      print(time![0]);
      print(from);
      print("from");
      emit(SessionsChangeFromTimeState());
    } else if (time![1] != to) {
      time![1] = to;
      print(time![1]);
      print(to);
      print("to");
      emit(SessionsChangeToTimeState());
    }
  }

  final dio = Dio();

  SessionsModel? sessionsModel;

  Future getAllSession({
    required var token,
    required BuildContext context,
  }) async {
    emit(SessionsGetAllSessionsLoadingState());
    return await dio!
        .get(
      options: Options(headers: {
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json",
        "Authorization": "Bearer $token",
      }),
      ALLSESSIONS,
    )
        .then((value) {
      // print(value.data.toString());
      sessionsModel = SessionsModel.fromJson(value.data!);
      print(sessionsModel!.data.length);
      print("----------------------------");
      emit(SessionsGetAllSessionsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SessionsGetAllSessionsFailState(error: error.toString()));
    });
  }

  var addFormKey = GlobalKey<FormState>();

  addSession({
    required String name,
    required var token,
    required BuildContext context,
  }) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    var task=HomeCubit.get(context).tasksModel!.data[0].id.toString();
    print(task);
    print(time![0]);
    print(time![1]);
    emit(SessionsAddSessionsLoadingState());
    dio
        .post(ALLSESSIONS,
            data: {
              "name": name,
              "state": "active",
              "start_time": "$formattedDate ${time![0]}",
              "end_time": "$formattedDate ${time![1]}",
              "task_id": [
                for(int i=0;i<HomeCubit.get(context).tasksModel!.data.length;i++)HomeCubit.get(context).tasksModel!.data[i].id.toString(),
              ],
              // "task_id[1]": "${HomeCubit.get(context).tasksModel!.data[1].id.toString()}",
              // "task_id[2]": "${HomeCubit.get(context).tasksModel!.data[2].id.toString()}",
            },
            options: Options(receiveDataWhenStatusError: true, headers: {
              "Accept": "application/vnd.api+json",
              "Content-Type": "application/vnd.api+json",
              "Authorization": "Bearer $token",
            }))
        .then((value) {
      emit(SessionsAddSessionsSuccessState());
      print(value.data);

      SessionsCubit.get(context: context).changeSessionsScreen(numOfScreen: 0);
      SessionsCubit.get(context: context).getAllSession(
          token: CashHelper.getString(key: "token"), context: context);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      //       (route) => false,
      // );
    }).catchError((error) {
      print(error.toString());
      emit(SessionsAddSessionsFailState(error: error.toString()));
    });
  }
  editSession({
    required String name,
    required var token,
    required BuildContext context,
    required String id,
  }) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    var task=HomeCubit.get(context).tasksModel!.data[0].id.toString();
    print(task);
    print(time![0]);
    print(time![1]);
    emit(SessionsEditSessionsLoadingState());
    dio
        .patch("$ALLSESSIONS/$id",
            data: {
              "name": name,
              "state": "active",
              "start_time": "$formattedDate ${time![0]}",
              "end_time": "$formattedDate ${time![1]}",
              "task_id": [
                for(int i=0;i<HomeCubit.get(context).tasksModel!.data.length;i++)HomeCubit.get(context).tasksModel!.data[i].id.toString(),
              ],
              // "task_id[1]": "${HomeCubit.get(context).tasksModel!.data[1].id.toString()}",
              // "task_id[2]": "${HomeCubit.get(context).tasksModel!.data[2].id.toString()}",
            },
            options: Options(receiveDataWhenStatusError: true, headers: {
              "Accept": "application/vnd.api+json",
              "Content-Type": "application/vnd.api+json",
              "Authorization": "Bearer $token",
            }))
        .then((value) {
      emit(SessionsEditSessionsSuccessState());
      print(value.data);

      SessionsCubit.get(context: context).changeSessionsScreen(numOfScreen: 0);
      SessionsCubit.get(context: context).getAllSession(
          token: CashHelper.getString(key: "token"), context: context);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      //       (route) => false,
      // );
    }).catchError((error) {
      print(error.toString());
      emit(SessionsEditSessionsFailState(error: error.toString()));
    });
  }
}
