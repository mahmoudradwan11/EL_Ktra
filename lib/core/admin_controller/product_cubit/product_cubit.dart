import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ek/admin/models/product_model.dart';
import 'package:ek/core/admin_controller/admin_version_cubit/admin_version_cubit.dart';
import 'package:ek/core/admin_controller/product_cubit/product_states.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_helper.dart';
import 'package:ek/user/models/search_model.dart';
import 'package:ek/user/screens/search_screen.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitStats());
  static ProductCubit get(context) => BlocProvider.of(context);
  ImagePicker picker1 = ImagePicker();
  File? image1;
  Uint8List? bytes1;
  String? img641;
  Future<void> addImage1() async {
    final pickedFile = await picker1.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image1 = File(pickedFile.path);
      bytes1 = File(image1!.path).readAsBytesSync();
      img641 = base64Encode(bytes1!);
      print('images = $img641');
      emit(ImageChoose1());
    } else {
      print('no image selected');
    }
  }
  ImagePicker picker2 = ImagePicker();
  File? image2;
  Uint8List? bytes2;
  String? img642;
  Future<void> addImage2() async {
    final pickedFile = await picker2.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image2 = File(pickedFile.path);
      bytes2 = File(image2!.path).readAsBytesSync();
      img642 = base64Encode(bytes2!);
      print('images = $img642');
      emit(ImageChoose2());
    } else {
      print('no image selected');
    }
  }
  ImagePicker picker3 = ImagePicker();
  File? image3;
  Uint8List? bytes3;
  String? img643;
  Future<void> addImage3() async {
    final pickedFile = await picker3.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image3 = File(pickedFile.path);
      bytes3 = File(image3!.path).readAsBytesSync();
      img643 = base64Encode(bytes3!);
      print('images = $img643');
      emit(ImageChoose3());
    } else {
      print('no image selected');
    }
  }
  ImagePicker picker4 = ImagePicker();
  File? image4;
  Uint8List? bytes4;
  String? img644;
  Future<void> addImage4() async {
    final pickedFile = await picker4.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image4 = File(pickedFile.path);
      bytes4 = File(image4!.path).readAsBytesSync();
      img644 = base64Encode(bytes4!);
      print('images = $img644');
      emit(ImageChoose4());
    } else {
      print('no image selected');
    }
  }
  String? productCompany = "Dell";
  selectedCompany(Company){
    productCompany = Company;
    print(productCompany);
    emit(ChooseProductCompany());
  }
  String? productCategory = "Laptops";
  selectedCategory(category){
    productCategory = category;
    print(productCategory);
    emit(ChooseCategoryCompany());
  }
  bool isNew = true;
  void changeToNew() {
    isNew = true;
    emit(IsNewChoose());
  }

  void changeToUsed() {
    isNew = false;
    emit(IsUsedChoose());
  }
  void addProduct(name,price,description,countInStock,context){
    emit(AddProductLoading());
    DioHelperStore.postData(url:ApiConstants.addProductApi, data:{
      "status": isNew ? 'New' : 'Used',
      "category":productCategory,
      "name":name,
      "images":[img642,img643,img644],
      "price":price,
      "description":description,
      "image":img641,
      "company":productCompany,
      "countInStock":countInStock
    }).then((value){
      print('Product added');
      emit(AddProduct());
      showToast('Products Added Successfully', ToastStates.SUCCESS);
      getAllProduct(keyword:'');
      AdminVersionCubit.get(context).getCategriesProducts();
      AdminVersionCubit.get(context).getCompaniesSales();
    }).catchError((error){
      print(error.toString());
      emit(ErrorAddProduct());
    });
  }
  ProductsModel? productsModel;
    void getAllProduct({required keyword}){
      DioHelperStore.getData(url:ApiConstants.searchApi,data: {
        'keyword':keyword
      }).then((value){
        productsModel = ProductsModel.fromJson(value.data);
        print(productsModel!.products!.length);
        emit(GetAllProduct());
      }).catchError((error){
        print(error.toString());
        emit(ErrorGetAllProduct());
      });
    }
  void deleteProducts(productId,context){
    DioHelperStore.delData(url:'https://elwekala.onrender.com/product/$productId',
        data:{}).
    then((value){
      showToast('Products Deleted Successfully', ToastStates.SUCCESS);
      emit(DeleteProduct());
      getAllProduct(keyword:'');
      AdminVersionCubit.get(context).getCategriesProducts();
      AdminVersionCubit.get(context).getCompaniesSales();
     // addNotification('Product Delete');
    }).catchError((error){
      print(error.toString());
      emit(ErrorDeleteProduct());
    });
  }
}