import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/edit/cubit/state.dart';
import 'package:projects/shared/network/local/cash_helper.dart';
import "package:projects/shared/network/end_points.dart";
import 'package:projects/mobile/home/app_cubit/cubit.dart';


class EditCubit extends Cubit<EditProfileStates>{
  EditCubit():super(EditProfileInitState());
  static EditCubit get({required BuildContext context})=>BlocProvider.of(context);
  var formKet=GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  Dio dio=Dio();
  editProfile({
    required String userName,
    required String email,
    required String age,
    required String job,
    required String bio,
    required String token,
    required BuildContext context,
}){
    String id = CashHelper.getString(key: "id");
    emit(EditProfileLoadingState());
    print(token);
    dio
        .post("$USER/$id",
        options: Options(receiveDataWhenStatusError: true, headers: {
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer $token",
        },
        ),
    data: {
          "_method":"patch",
          "name":userName,
          "email":email,
          "age":age,
          "job":job,
          "bio":bio,
    })
        .then((value) {
      HomeCubit.get(context).getAllTasks(token: CashHelper.getString(key: "token"), context: context);
      HomeCubit.get(context).changeBody(index: 4);
      emit(EditProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(EditProfileFailState(error: error.toString()));
    });
  }
}