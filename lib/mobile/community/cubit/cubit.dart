import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/community/cubit/state.dart';

class CommunityScreenCubit extends Cubit<CommunityScreenStates> {
  CommunityScreenCubit() : super(CommunityScreenInitState());

  static CommunityScreenCubit get({required BuildContext context}) =>
      BlocProvider.of(context);

  // List<String> tapBody = [
  //   "Articles",
  //   "Activity",
  //   "Posts",
  //   "Competions",
  //   "Coaches",
  // ];
  // List<Widget> body = [
  //   Articles(),
  //   Activity(),
  //   Posts(),
  //   Competions(),
  //   Coaches(),
  // ];
  int index = 0;

  onTap({required int tap}) {
    index = tap;
    emit(CommunityScreenChangeBodyState());
  }
}
