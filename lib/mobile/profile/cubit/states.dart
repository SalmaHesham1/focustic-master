abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class AnimateTextState extends ProfileStates {}

class IsWebState extends ProfileStates{}

class HoveTasksState extends ProfileStates{}

class ExitHoveTasksState extends ProfileStates {}

class HoveCommunicateState extends ProfileStates {}

class ExitHoveCommunicateState extends ProfileStates {}

class HoveAnimateState extends ProfileStates {}

class ExitHoveAnimateState extends ProfileStates {}

class ChangeAppBarActionColorState extends ProfileStates {}

class MyProfileState extends ProfileStates {}

class CoachProfileScreen extends ProfileStates {}

class ShowProfileLoadingState extends ProfileStates {}

class ShowProfileSuccessState extends ProfileStates {}

class ShowProfileFailState extends ProfileStates {
  String error;

  ShowProfileFailState({required this.error});
}

class ShowReportLoadingState extends ProfileStates {}

class ShowReportSuccessState extends ProfileStates {}

class ShowReportFailState extends ProfileStates {
  String error;

  ShowReportFailState({required this.error});
}