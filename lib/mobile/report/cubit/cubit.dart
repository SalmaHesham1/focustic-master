import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/report/cubit/state.dart';
import 'package:projects/shared/component/const.dart';

class ReportScreenCubit extends Cubit<ReportScreenStates> {
  ReportScreenCubit() : super(ReportScreenInitState());

  static ReportScreenCubit get({required BuildContext context}) =>
      BlocProvider.of(context);

  int index = 0;
  List<String> time = [
    // "Daily",
    "Weekly",
    "Monthly",
  ];
  List<List> date = [
    // days,
    weeks,
    months,
  ];

  changeReport({required int page}) {
    index = page;
    print(time[index]);
    emit(ReportScreenChangeReportState());
  }

  int indexOfDate = 0;

  changeDate({required bool add}) {
    if (indexOfDate >= 0 && indexOfDate < date[index].length) {
      if (add == true && indexOfDate < date[index].length - 1) {
        indexOfDate = indexOfDate + 1;
      } else if (add == false && indexOfDate > 0) {
        indexOfDate = indexOfDate - 1;
      }
    }
    print(indexOfDate);
    emit(ReportScreenChangeDateState());
  }
}
