abstract class EditProfileStates{}

class EditProfileInitState extends EditProfileStates{}

class EditProfileLoadingState extends EditProfileStates{}

class EditProfileSuccessState extends EditProfileStates{}

class EditProfileFailState extends EditProfileStates{
  String error;
  EditProfileFailState({required this.error});
}