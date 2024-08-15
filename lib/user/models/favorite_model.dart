class FavoriteModel {
  String? status;
  List<FavoriteProducts>? favoriteProducts;

  FavoriteModel({this.status, this.favoriteProducts});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['favoriteProducts'] != null) {
      favoriteProducts =<FavoriteProducts>[];
      json['favoriteProducts'].forEach((v) {
        favoriteProducts!.add(FavoriteProducts.fromJson(v));
      });
    }
  }
}
class FavoriteProducts {
  int? quantity;
  String?status;
  String? sId;
  String? category;
  String? name;
  dynamic price;
  String? description;
  String? image;
  String? company;
  dynamic countInStock;
  dynamic iV;

  FavoriteProducts({this.quantity,
    this.sId,
    this.category,
    this.name,
    this.status,
    this.price,
    this.description,
    this.image,
    this.company,
    this.countInStock,
    this.iV});

  FavoriteProducts.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    status = json['status'];
    sId = json['_id'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    company = json['company'];
    countInStock = json['countInStock'];
    iV = json['__v'];
  }
}
  class CheckFavorite{
  String? status;
  bool? isFavorite;

  CheckFavorite({this.status, this.isFavorite});

  CheckFavorite.fromJson(Map<String, dynamic> json) {
  status = json['status'];
  isFavorite = json['isFavorite'];
  }
}
