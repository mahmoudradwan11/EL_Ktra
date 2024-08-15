import 'package:ek/user/models/user_model.dart';

abstract class AdminUsersStates{}
class AdminUsersInitState extends AdminUsersStates{}
class GetAllUsers extends AdminUsersStates{}
class ErrorGetAllUsers extends AdminUsersStates{}
class DeleteUser extends AdminUsersStates{}
class ErrorDeleteUser extends AdminUsersStates{}
class UserLogoutState extends AdminUsersStates{}
class UserLogoutFailedState extends AdminUsersStates{}
class UserDataSuccessState extends AdminUsersStates {
  UserModel? userModel;
  UserDataSuccessState(this.userModel);
}
class UserDataFailedState extends AdminUsersStates{}
class UpdateUserData extends AdminUsersStates{}
class ErrorUpdateUserData extends AdminUsersStates{}