import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_Helper.dart';
import 'package:ek/core/user_controller/search_cubit/search_states.dart';
import 'package:ek/user/models/search_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitState());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;
  void searchProduct({required keyword}) {
    DioHelperStore.getData(url: ApiConstants.searchApi, data: {'keyword': keyword})
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel!.allProducts!.length);
      print(searchModel!.allProducts!.length);
      print(searchModel!.allProducts!.length);
      emit(SearchSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearch());
    });
  }
}