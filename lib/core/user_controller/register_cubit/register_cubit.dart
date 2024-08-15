import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_heeker.dart';
import 'package:ek/core/user_controller/register_cubit/register_states.dart';
import 'package:ek/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  bool? check = false;
  void changeCheck(value){
    if(check== false){
      check = true;
    }
    else{
      check = false;
    }
    emit(CheckValid());
    print(check);
  }
  void userRegister({
  required String name,
  required String phone,
  required String email,
  required String nationalID,
  required String password,
  }){
    emit(LoadingUserRegister());
    DioHeekerStore.postData(url:ApiConstants.registerApi, data:{
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'nationalId': nationalID,
      'gender': 'male',
      'profileImage': userImage
    }).then((value){
      userModel = UserModel.fromJson(value.data);
      if (userModel!.message !='User registered successfully') {
        showToast(userModel!.message!, ToastStates.ERROR);}
      emit(UserRegisterSuccessfully(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(UserFailedRegister());
    });
}
  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? userImage;
  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes!);
      print('images = $userImage');
      emit(ImageChoose());
    } else {
      print('no image selected');
    }
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }
}