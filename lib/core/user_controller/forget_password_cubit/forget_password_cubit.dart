import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_heeker.dart';
import 'package:ek/core/user_controller/forget_password_cubit/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>{
  ForgetPasswordCubit() : super(ForgetPasswordInitStates());
  static ForgetPasswordCubit get(context)=>BlocProvider.of(context);
  void resetPassword(nationalId,newPassword){
    emit(ResetPasswordLoadingState());
    DioHeekerStore.postData(url:ApiConstants.forgetPasswordApi, data:{
      "nationalId": nationalId,
      "newPassword": newPassword,
    }).then((value){
      emit(ResetPasswordDone());
    }).catchError((error){
      print(error.toString());
      emit(ErrorResetPassword());
    });
  }
}