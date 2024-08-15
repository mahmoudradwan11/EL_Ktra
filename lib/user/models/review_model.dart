class ReviewModel {
  String? status;
  String? message;
  List<ReviewsItems>? reviews;

  ReviewModel({this.status, this.message, this.reviews});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['reviews'] != null) {
      reviews =<ReviewsItems>[];
      json['reviews'].forEach((v) {
        reviews!.add(ReviewsItems.fromJson(v));
      });
    }
  }
}

class ReviewsItems {
  String? sId;
  UserReview? user;
  String? product;
  String? title;
  String? comment;
  dynamic rating;
  String? createdAt;

  ReviewsItems(
      {this.sId,
        this.user,
        this.product,
        this.title,
        this.comment,
        this.rating,
        this.createdAt});

  ReviewsItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? UserReview.fromJson(json['user']) : null;
    product = json['product'];
    title = json['title'];
    comment = json['comment'];
    rating = json['rating'];
    createdAt = json['createdAt'];
  }
}

class UserReview {
  String? name;
  String? profileImage;

  UserReview({this.name, this.profileImage});

  UserReview.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImage = json['profileImage'];
  }
}