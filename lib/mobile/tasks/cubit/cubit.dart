import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/tasks/cubit/state.dart';
import 'package:projects/model/tasks_model.dart';
import 'package:projects/shared/network/end_points.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class TasksCubit extends Cubit<TasksStates>{
  TasksCubit():super(TasksInitState());
  static TasksCubit get({required BuildContext context})=>BlocProvider.of(context);

  final TextEditingController _textFieldController = TextEditingController();
  String selectedItemTask = "Daily";
  int indexTask = 0;
  List kindListTask = ["Daily", "Weekly", "Monthly"];
  String tdataTask = DateFormat("hh:mm a").format(DateTime.now());
  List itemsTask = [];
  TasksModel? tasksModel;
  DataTask? dailyTasksModel;
  DataTask? weeklyTasksModel;
  DataTask? monthlyTasksModel;
  List dailyList = [];
  List weeklyList = [];
  List monthlyList = [];
  var dio=Dio();
  var listOfTasksTask = [];

  changeTasksList({
    required BuildContext context,
    required var newVal,
}){
    selectedItemTask=newVal;
    selectedItemTask  == "Daily"
        ? listOfTasksTask  = dailyList
        : (selectedItemTask  == "Weekly"
        ? listOfTasksTask  =weeklyList
        : listOfTasksTask  = monthlyList);
    emit(TasksChangeTasksListState());
  }
  changeBody({
    required BuildContext context,
    required var newVal,
}){
    selectedItemTask = newVal.toString();
    selectedItemTask == "Daily"
        ? listOfTasksTask = dailyList
        : (selectedItemTask == "Weekly"
        ? listOfTasksTask =
        weeklyList
        : listOfTasksTask =
        monthlyList);
    emit(TasksChangeBodyState());
  }


  Future getAllTasks(
      {required var token, required BuildContext context})
  async {
    emit(TasksAllTasksLoadingState());
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
        if (tasksModel!.data[i].attributes.kind == "daily") {
          dailyTasksModel = DataTask.fromJson(value.data!["data"][i]);
          dailyList.add(dailyTasksModel);
          print(dailyList[0].id);
          print("daily");
        } else if (value.data["data"][i]["attributes"]["kind"] == "weekly") {
          weeklyTasksModel = DataTask.fromJson(value.data!["data"][i]);
          weeklyList.add(weeklyTasksModel);
          print(weeklyList[0].id);
          print("weekly");
        } else if (value.data["data"][i]["attributes"]["kind"] == "monthly") {
          monthlyTasksModel = DataTask.fromJson(value.data!["data"][i]);
          monthlyList.add(monthlyTasksModel);
          print(monthlyList[0].id);
          print("monthly");
        }
      }
      print("----------------------------");
      emit(TasksAllTasksSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TasksAllTasksFailState( error.toString()));
    });
  }

  Future updateTask({
    required String token,
    required String id,
    required String name,
    required String note,
    required String state,
    required String duration,
    // required String reminder,
    // required String reminder_date,
    required String kind,
    // required String repeat,
    required String initiated_at,
    // required String due_date,
    required BuildContext context,
})
  async {
    print(state);
    emit(TasksUpdateTaskLoadingState());
    return await dio!
        .patch(
      "$ALLTASKS/$id}",
      options: Options(
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${CashHelper.getString(key: "token")}",
        },
      ),
      data: {
        "name": name,
        "note": note,
        "state": state=="Done"?"completed":"active",
        "duration": duration=="30 min"?"30": (duration=="45 min"?"45":"90"),
        // "reminder": reminder,
        // "reminder_date": "2023-04-01 00:00",
        "kind": kind=="Daily"?"daily":(kind=="Weekly"?"weekly":"monthly"),
        // "repeat":repeat,
        "initiated_at":"2023-02-01 00:00",
        // "due_date": "2023-02-02 00:00",
      },
    )
        .then((value) {
         HomeCubit.get(context).changeBody(index: 0);
      emit(TasksUpdateTaskSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TasksUpdateTaskFailState( error.toString()));
    });
  }
  Future deleteTask({
    required String token,
    required String id,
})
  async {
    print(id);
    emit(TasksDeleteTaskLoadingState());
    return await dio!
        .delete(
      "$ALLTASKS/$id",
      options: Options(
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${CashHelper.getString(key: "token")}",
        },
      ),
    )
        .then((value) {

      emit(TasksDeleteTaskSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TasksDeleteTaskFailState( error.toString()));
    });
  }


  DateTime selectTimeEdit = DateTime.now();
  TextEditingController textareaEdit = TextEditingController();
  TextEditingController nameEdit = TextEditingController();
  String? selectedstateItemEdit;
  String? selectedItemEdit;
  List kindListEdit = ["Daily", "Weekly", "monthly"];
  List StateListEdit = ["Active", "Done"];
  String? durationitemEdit;
  List DurationListEdit = ["30 min", "45 min", "90 min"];
  var DurationtimeEdit = "1hr,30min";
  var DateEdit = "2/3/2023";
  String? defultEdit = "30 min";
  DateTime? selectedDateEdit;
  Color? fontcolorEdit = Colors.grey.shade300;
  var editFormKey=GlobalKey<FormState>();

  var mydateEdit = "Date";
  editTaskDatePicker({required var value}){
      selectedDateEdit = value;
      mydateEdit = "${selectedDateEdit?.day}-${selectedDateEdit?.month}-${selectedDateEdit?.year}";
      fontcolorEdit = Color.fromRGBO(10, 102, 194, 1);
    emit(TasksDatePickerState());
  }
  editTaskDuration({required var value}){
      durationitemEdit = value as String?;
      defultEdit = durationitemEdit;
    emit(TasksDurationState());
  }
  editTaskSelectedItem({required var value}){
      selectedstateItemEdit = value as String?;
    emit(TasksSelectedItemState());
  }

  editTaskSelectedItemKind({required var value}){
      selectedItemEdit = value as String?;
    emit(TasksSelectedItemKindState());
  }

  String editTaskId="0";
  changeEditTaskId({required String id}){
    editTaskId=id;
    emit(ChangeEditTaskIdState());
  }
}