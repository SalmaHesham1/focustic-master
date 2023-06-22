abstract class SessionsStates {}

class SessionsInitState extends SessionsStates {}

class SessionsChangeScreenState extends SessionsStates {}

class SessionsChangeFromTimeState extends SessionsStates {}

class SessionsChangeToTimeState extends SessionsStates {}

class SessionsGetAllSessionsLoadingState extends SessionsStates {}

class SessionsGetAllSessionsSuccessState extends SessionsStates {}

class SessionsGetAllSessionsFailState extends SessionsStates {
  String error;

  SessionsGetAllSessionsFailState({required this.error});
}

class SessionsAddSessionsLoadingState extends SessionsStates {}

class SessionsAddSessionsSuccessState extends SessionsStates {}

class SessionsAddSessionsFailState extends SessionsStates {
  String error;

  SessionsAddSessionsFailState({required this.error});
}
class SessionsEditSessionsLoadingState extends SessionsStates {}

class SessionsEditSessionsSuccessState extends SessionsStates {}

class SessionsEditSessionsFailState extends SessionsStates {
  String error;

  SessionsEditSessionsFailState({required this.error});
}

class ChangeIdOfEditSessionState extends SessionsStates{}
