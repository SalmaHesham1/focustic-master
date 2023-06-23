// abstract class SessionsStates {}

// class SessionsInitState extends HomeStates {}

import 'package:projects/mobile/home/app_cubit/state.dart';

class SessionsChangeScreenState extends HomeStates {}

class SessionsChangeFromTimeState extends HomeStates {}

class SessionsChangeToTimeState extends HomeStates {}

class SessionsGetAllSessionsLoadingState extends HomeStates {}

class SessionsGetAllSessionsSuccessState extends HomeStates {}

class SessionsGetAllSessionsFailState extends HomeStates {
  String error;

  SessionsGetAllSessionsFailState({required this.error});
}

class SessionsAddSessionsLoadingState extends HomeStates {}

class SessionsAddSessionsSuccessState extends HomeStates {}

class SessionsAddSessionsFailState extends HomeStates {
  String error;

  SessionsAddSessionsFailState({required this.error});
}
class SessionsEditSessionsLoadingState extends HomeStates {}

class SessionsEditSessionsSuccessState extends HomeStates {}

class SessionsEditSessionsFailState extends HomeStates {
  String error;

  SessionsEditSessionsFailState({required this.error});
}

class ChangeIdOfEditSessionState extends HomeStates{}
