abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HoveFeature1State extends HomeStates {}

class ExitHoveFeature1State extends HomeStates {}

class HoveFeature2State extends HomeStates {}

class ExitHoveFeature2State extends HomeStates {}

class HoveFeature3State extends HomeStates {}

class ExitHoveFeature3State extends HomeStates {}

class HoveFeature4State extends HomeStates {}

class ExitHoveFeature4State extends HomeStates {}

class JoinButtonTappedState extends HomeStates {}

class ChangBodyState extends HomeStates {}

class SpeedDialChangeColorState extends HomeStates {}

class isJoinCommunityScreenState extends HomeStates {}

class ChangeTaskDurationState extends HomeStates {}

class SuccessStartHardwareState extends HomeStates {}

class LogOutLoadingState extends HomeStates {}

class LogOutSuccessState extends HomeStates {}

class LogOutFailState extends HomeStates {
  String error;

  LogOutFailState({required this.error});
}
class GetCommunityInfoLoadingState extends HomeStates {}

class GetCommunityInfoSuccessState extends HomeStates {}

class GetCommunityInfoFailState extends HomeStates {
  String error;

  GetCommunityInfoFailState({required this.error});
}

class GetUserCommunityInfoLoadingState extends HomeStates {}

class GetUSerCommunityInfoSuccessState extends HomeStates {}

class GetUserCommunityInfoFailState extends HomeStates {
  String error;

  GetUserCommunityInfoFailState({required this.error});
}

class AllTasksLoadingState extends HomeStates {}

class AllTasksSuccessState extends HomeStates {}

class AllTasksFailState extends HomeStates {
  String error;

  AllTasksFailState({required this.error});
}

class HomeProfileLoadingState extends HomeStates {}

class HomeProfileSuccessState extends HomeStates {}

class HomeProfileFailState extends HomeStates {
  String error;

  HomeProfileFailState({required this.error});
}

class ChangeJoinButtonState extends HomeStates {}
