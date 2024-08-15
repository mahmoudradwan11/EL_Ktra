import 'package:ek/user/models/user_model.dart';

abstract class LoginState {}

class LoadingLogin extends LoginState {}

class LoginInitState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel model;
  LoginSuccessState(this.model);
}

class LoginFailedState extends LoginState {
  final String error;
  LoginFailedState(this.error);
}

class ChangePasswordVisState extends LoginState {}
class ChangePassword extends LoginState{}
class ErrorChange extends LoginState{}
