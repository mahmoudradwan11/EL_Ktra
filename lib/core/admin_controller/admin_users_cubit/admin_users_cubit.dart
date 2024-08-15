import 'package:lp/admin/models/messages_model.dart';
import 'package:lp/admin/models/users_model.dart';
import 'package:lp/admin/screens/users.dart';
import 'package:lp/core/admin_controller/admin_users_cubit/admin_users_states.dart';
import 'package:lp/core/mangers/routes.dart';
import 'package:lp/core/mangers/values.dart';
import 'package:lp/core/network/local/cache_helper.dart';
import 'package:lp/core/network/remote/api_constants.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lp/user/models/user_model.dart';
import 'package:lp/user/screens/login.dart';

class AdminUsersCubit extends Cubit<AdminUsersStates>{
  AdminUsersCubit() : super(AdminUsersInitState());
  static AdminUsersCubit get(context)=>BlocProvider.of(context);
  UsersModel? usersModel;
  void getUsers(){
    DioHelperStore.postData(url:ApiConstants.getUsersApi, data:{}).then((value){
      usersModel = UsersModel.fromJson(value.data);
      print(usersModel!.user!.length);
      emit(GetAllUsers());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetAllUsers());
    });
  }
  void deleteUser(email){
    DioHelperStore.delData(url:ApiConstants.deleteUserApi,data: {
      "email": email
    }).then((value){
      getUsers();
     emit(DeleteUser());
    }).catchError((error){
      print(error.toString());
      emit(ErrorDeleteUser());
    });
  }
  void userLayout(context){

    DioHelperStore.postData(
      url: ApiConstants.logoutApi,
      data: {"token": token},
    ).then((value) {
      CacheHelper.removeData(key: 'token').then((value) {
        if (value) {
          navigateAndFinishThisScreen(context, LoginScreen());
        }
        emit(UserLogoutState());
      }).catchError((error) {
        print(error.toString());
        emit(UserLogoutFailedState());
      });
    });
  }
  UserModel? profileModel;

  void getUserData() {
    DioHelperStore.postData(
      url: ApiConstants.profileApi,
      data: {"token": token},
    ).then((value) {
      profileModel = UserModel.fromJson(value.data);
      print(profileModel!.user!.name);
      print(profileModel!.user!.email);
      emit(UserDataSuccessState(profileModel));
    }).catchError((error) {
      print(error.toString());
      emit(UserDataFailedState());
    });
  }
  void update({String? name, String? phone, String? email}) {
    DioHelperStore.putData(url: ApiConstants.editProfile, data: {
      "token": token,
      "name": name,
      "email": email,
      "phone": phone,
      "password": "12345678",
      "gender": 'male'
    }).then((value) {
      profileModel = UserModel.fromJson(value.data);
      print(profileModel!.user!.name!);
      getUserData();
      emit(UpdateUserData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateUserData());
    });
  }
}