import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_heeker.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/user/models/cart_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());
  static CartCubit get(context) => BlocProvider.of(context);
  CartModel? cartModel;
  void getMyCart() {
    DioHeekerStore.getData(url: ApiConstants.geyMyCartApi, data: {
      "nationalId":nationalId,
    }).then((value) {
      cartModel = CartModel.fromJson(value.data);
      print('Number Of Products In Cart =${cartModel!.products!.length}');
      emit(GetCart());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetCart());
    });
  }
  TotalCart? totalCart;
  void getTotaekrice(){
    DioHeekerStore.getData(url: ApiConstants.getTotaekriceApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      totalCart = TotalCart.fromJson(value.data);
      print("Total=${totalCart!.totaekrice!}");
      emit(GetTotal());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetTotal());
    });
  }

  void deleteFromCart(productId) {
    DioHeekerStore.delData(
        url: ApiConstants.deleteCartApi,
        data: {"nationalId": nationalId, "productId": productId}).then((value) {
      print('Deleted');
      emit(DeleteCart());
      getMyCart();
      getTotaekrice();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteCart());
    });
  }

  void addToMyCart(productId) {
    DioHeekerStore.postData(url: ApiConstants.addToCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": "1"
    }).then((value) {
      print('Add');
      emit(AddToCart());
      getMyCart();
      getTotaekrice();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddToCart());
    });
  }

  void updateQuantity(productId, quantity) {
    DioHeekerStore.putData(url: ApiConstants.updateQuantityApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": quantity
    }).then((value) {
      print('Update');
      emit(UpdateQuantity());
      getMyCart();
      getTotaekrice();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateQuantity());
    });
  }
}