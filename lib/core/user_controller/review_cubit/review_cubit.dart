import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_Helper.dart';
import 'package:ek/core/user_controller/review_cubit/review_states.dart';
import 'package:ek/user/models/review_model.dart';

class ReviewCubit extends Cubit<ReviewStates> {
  ReviewCubit() : super(ReviewInitState());
  static ReviewCubit get(context) => BlocProvider.of(context);
  void addReviewForSpecificationProduct({required productId,
    required review,
    required rate}){
    DioHelperStore.postData(url:ApiConstants.addReviewApi, data:{
      "user": nationalId,
      "productId":productId,
      "title":"Good",
      "comment":review,
      "rating":rate
    }).then((value){
      showToast('Review Added', ToastStates.SUCCESS);
      emit(AddReview());
      getAllReviews(productId);
    }).catchError((error){
      print(error.toString());
      emit(ErrorAddReview());
      showToast('Rating Must Not More Than 5', ToastStates.ERROR);
    });
  }
  ReviewModel? reviewModel;
  void getAllReviews(productId) {
    DioHelperStore.getData(
        url:'${ApiConstants.getAllReviewApi}/$productId')
        .then((value) {
      reviewModel = ReviewModel.fromJson(value.data);
      print('Reviews = ${reviewModel!.reviews!.length}');
      emit(GetAllReview());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllReview());
    });
  }
  void deleteReview(reviewId,productId){
    DioHelperStore.delData(url:'${ApiConstants.deleteReviewApi}/$reviewId',).then((value){
      emit(DeleteReview());
      getAllReviews(productId);
    }).catchError((error){
      print(error.toString());
      emit(ErrorDeleteReview());
    });
  }
}