import 'package:lp/admin/models/cateogies_model.dart';
import 'package:lp/admin/models/company_products_model.dart';
import 'package:lp/core/admin_controller/admin_version_cubit/admin_version_states.dart';
import 'package:lp/core/mangers/values.dart';
import 'package:lp/core/network/remote/api_constants.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:lp/user/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminVersionCubit extends Cubit<AdminVersionStates>{
  AdminVersionCubit() : super(AdminInitState());
  static AdminVersionCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void getAdminData(){
    DioHelperStore.postData(url: ApiConstants.profileApi,data:{
      'token':token
    }).then((value){
     userModel = UserModel.fromJson(value.data);
     print(userModel!.user!.email!);
     emit(GetAdminData());
    }).catchError((error){
     print(error.toString());
     emit(ErrorGetAdminData());
    });
  }
  CompanyProductsSalesModel? companyProductsSalesModel;
  void getCompaniesSales(){
    DioHelperStore.getData(url:ApiConstants.companyProductsSales).then((value){
      companyProductsSalesModel = CompanyProductsSalesModel.fromJson(value.data);
      print('Huwaia = ${companyProductsSalesModel!.huawei!.length}');
      h = companyProductsSalesModel!.huawei!.length;
      s = companyProductsSalesModel!.samsung!.length;
      l = companyProductsSalesModel!.lenovo!.length;
      g = companyProductsSalesModel!.lG!.length;
      m = companyProductsSalesModel!.microsoft!.length;
      d = companyProductsSalesModel!.dell!.length;
      a = companyProductsSalesModel!.apple!.length;
      p = companyProductsSalesModel!.hP!.length;
      x = companyProductsSalesModel!.xiaomi!.length;
      emit(GetCompaniesSales());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetCompaniesSales());
    });
  }
  CategiesModels? categiesModels;
  void getCategriesProducts(){
    DioHelperStore.getData(url:ApiConstants.companyProductsSales).then((value){
      categiesModels = CategiesModels.fromJson(value.data);
      print('laptops = ${categiesModels!.laptops!.length}');
      laptops = categiesModels!.laptops!.length;
      phones = categiesModels!.smartPhones!.length;
      tv = categiesModels!.tvs!.length;
      watches = categiesModels!.watches!.length;
      head = categiesModels!.headPhone!.length;
      acc = categiesModels!.accessories!.length;
      emit(GetCategories());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetCategories());
    });
  }
}