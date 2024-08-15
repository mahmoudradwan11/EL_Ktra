import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/local/cache_Helper.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_Helper.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:ek/user/models/home/accessories.dart';
import 'package:ek/user/models/home/laptop.dart';
import 'package:ek/user/models/home/smart_tvs.dart';
import 'package:ek/user/models/home/smartphone.dart';
import 'package:ek/user/models/home/smartwatch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/user/models/seller.dart';
import 'package:ek/user/models/top_seller.dart';

class ElktraCubit extends Cubit<ElktraStates> {
  ElktraCubit() : super(ElktraInitState());
  static ElktraCubit get(context) => BlocProvider.of(context);
  int currentHomeScreenIndex = 0;
  void changeUserHomeScreen(index) {
    currentHomeScreenIndex = index;
    emit(ChangeHomeScreenIndex());
  }

  bool dark = true;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      dark = fromShared;
      emit(ChangeAppMode());
    } else {
      dark = !dark;
      CacheHelper.putBoolData(key: 'mode', value: dark).then((value) {
        emit(ChangeAppMode());
      });
    }
  }

  HomeLaptops? homeLaptops;
  HomeSmartPhone? homeSmartPhone;
  HomeTVS? homeTVS;
  HomeSmartWatch? homeSmartWatch;
  HomeAccessories? homeAccessories;
  void getHomeLaptop() {
    DioHelperStore.getData(url: ApiConstants.homeLaptopApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      homeLaptops = HomeLaptops.fromJson(value.data);
      print(homeLaptops!.allProduct!.length);
      print(homeLaptops!.newProduct!.length);
      print(homeLaptops!.usedProduct!.length);
      emit(GetHomeLaptops());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomeLaptops());
    });
  }

  void getHomeSmartPhone() {
    DioHelperStore.getData(url: ApiConstants.homeSmartPhoneApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      homeSmartPhone = HomeSmartPhone.fromJson(value.data);
      print(homeSmartPhone!.allProduct!.length);
      print(homeSmartPhone!.newProduct!.length);
      print(homeSmartPhone!.usedProduct!.length);
      emit(GetHomePhones());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomePhones());
    });
  }

  void getHomeSmartWatches() {
    DioHelperStore.getData(url: ApiConstants.homeSmartWatchApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      homeSmartWatch = HomeSmartWatch.fromJson(value.data);
      print(homeSmartWatch!.product!.length);
      emit(GetHomeWatches());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomeWatches());
    });
  }

  void getHomeSmartTvs() {
    DioHelperStore.getData(url: ApiConstants.homeSmartTvsApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      homeTVS = HomeTVS.fromJson(value.data);
      print(homeTVS!.allProduct!.length);
      print(homeTVS!.newProduct!.length);
      print(homeTVS!.usedProduct!.length);
      emit(GetHomeTvs());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomeTvs());
    });
  }

  void getHomeAcc() {
    DioHelperStore.getData(url: ApiConstants.homeAccApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      homeAccessories = HomeAccessories.fromJson(value.data);
      print(homeAccessories!.product!.length);
      emit(GetHomeAcc());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomeAcc());
    });
  }

  void start(){
    getHomeLaptop();
    getHomeSmartPhone();
    getHomeSmartWatches();
    getHomeSmartTvs();
    getHomeAcc();
    getSellerProducts('Dell');
    getTopSeller();
  }
  SellersModel? sellersModel;

  void getSellerProducts(seller) {
    DioHelperStore.getData(url: ApiConstants.sellerApi, data: {"company": seller})
        .then((value) {
      sellersModel = SellersModel.fromJson(value.data);
      print(sellersModel!.allProducts!.length);
      print(sellersModel!.usedProduct!.length);
      print(sellersModel!.newProduct!.length);
      emit(GetAllSellerProducts());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllSellerProducts());
    });
  }
  TopSellerModel? topSellerModel;
  void getTopSeller(){
    DioHelperStore.getData(url:ApiConstants.topSellerApi,data:{
      "limit": 900
    }).then((value){
      topSellerModel = TopSellerModel.fromJson(value.data);
      print(topSellerModel!.topSellingCompany![0].sId);
      if(topSellerModel!.topSellingCompany![0].sId=='HP') {
        bestSellerImage = AppImages.hpCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId =='Dell') {
        bestSellerImage = AppImages.dellCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId=='Lenovo') {
        bestSellerImage = AppImages.lenovoCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId=='Xiaomi') {
        bestSellerImage = AppImages.xiaomiCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId=='Apple') {
        bestSellerImage = AppImages.appleCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId=='Samsung') {
        bestSellerImage = AppImages.samsungCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId=='Microsoft') {
        bestSellerImage = AppImages.microsoftCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId=='LG') {
        bestSellerImage = AppImages.lgCompanyImage;
      }
      if(topSellerModel!.topSellingCompany![0].sId=='Huawei') {
        bestSellerImage = AppImages.huaweiCompanyImage;
      }
      emit(GetTopSeller());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetTopSeller());
    });
  }
}
