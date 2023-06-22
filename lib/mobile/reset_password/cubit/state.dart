abstract class ResetPasswordStates {}

class ResetPasswordInitState extends ResetPasswordStates {}

class ResetPasswordShowOldPasswordState extends ResetPasswordStates {}

class ResetPasswordShowNewPasswordState extends ResetPasswordStates {}

class ResetPasswordChangePageState extends ResetPasswordStates {}

class ResetPasswordEnterEmailLoadingState extends ResetPasswordStates {}

class ResetPasswordEnterEmailSuccessState extends ResetPasswordStates {}

class ResetPasswordEnterEmailFailState extends ResetPasswordStates {
  String error;

  ResetPasswordEnterEmailFailState({required this.error});
}
