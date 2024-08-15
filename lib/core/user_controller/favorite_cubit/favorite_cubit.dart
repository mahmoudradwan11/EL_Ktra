import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_heeker.dart';
import 'package:ek/core/user_controller/favorite_cubit/favorite_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/models/favorite_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoriteInitState());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  FavoriteModel? favoriteModel;

  void getMyFavorite() {
    DioHeekerStore.getData(url: ApiConstants.favoriteApi, data: {
      'nationalId': nationalId,
    }).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      print(favoriteModel!.favoriteProducts!.length);
      // print(favoriteModel!.favoriteProducts![0].name);
      emit(GetFavorite());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetFavorite());
    });
  }

  void addToMyFavorite(String? id,context) {
    DioHeekerStore.postData(
        url: ApiConstants.favoriteApi,
        data: {"nationalId": nationalId, "productId": id}).then((value) {
      print('Added');
      emit(AddToFavorite());
      showToast('Added', ToastStates.SUCCESS);
      getMyFavorite();
      ElktraCubit.get(context).start();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddFavorite());
    });
  }

  void deleteFavorite(String? id,context) {
    DioHeekerStore.delData(url: ApiConstants.favoriteApi, data: {
      "nationalId": nationalId,
      "productId": id,
    }).then((value) {
      print('Deleted');
      emit(DeleteFavorite());
      showToast('Deleted', ToastStates.ERROR);
      getMyFavorite();
      ElktraCubit.get(context).start();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteFavorite());
    });
  }
}