import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/library/cubit/state.dart';
import 'package:projects/model/exercises_model.dart';
import 'package:projects/shared/network/end_points.dart';

class LibraryCubit extends Cubit<LibraryStates> {
  LibraryCubit() : super(LibraryInitState());

  static LibraryCubit get({required BuildContext context}) =>
      BlocProvider.of(context);

  final dio = Dio();
  ExercisesModel? exercisesModel;

  Future getLibrary({required var token, required BuildContext context}) async {
    emit(LibraryLoadingDataState());
    return await dio!
        .get(
      options: Options(headers: {
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json",
        "Authorization": "Bearer $token",
      }),
      EXERCISES,
    )
        .then((value) {
      // print(value.data.toString());
      exercisesModel = ExercisesModel.fromJson(value.data!);
      print(exercisesModel!.data![0].relationships!.exercise!.length);
      print("----------------------------");
      emit(LibraryGetDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LibraryGetDataFailState(error: error.toString()));
    });
  }

  int index = 0;

  changeBody({
    required int page,
  }) {
    index = page;
    print(index);
    emit(ChangeLibraryBodyState());
  }
}
