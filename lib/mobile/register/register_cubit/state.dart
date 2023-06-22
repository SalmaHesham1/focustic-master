abstract class RegisterStates {}

class RegisterInitState extends RegisterStates {}

class RegisterChangeBodyState extends RegisterStates {}

class RegisterShowLoginPasswordState extends RegisterStates {}

class RegisterShowSignupPasswordState extends RegisterStates {}

class RegisterShowSignupPassword2State extends RegisterStates {}

class RegisterLoginCheckBoxState extends RegisterStates {}

class LoginLoadingState extends RegisterStates {}

class LoginSuccessState extends RegisterStates {}

class LoginFailState extends RegisterStates {
  String error;

  LoginFailState({required this.error});
}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterFailState extends RegisterStates {
  String error;

  RegisterFailState({required this.error});
}