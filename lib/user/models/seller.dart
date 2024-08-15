class SellersModel{
  String? status;
  String? message;
  List<SellersProducts>? allProducts;
  List<SellersProducts>? usedProduct;
  List<SellersProducts>? newProduct;
  SellersModel({this.status, this.message, this.allProducts,this.newProduct,this.usedProduct});

  SellersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      usedProduct= <SellersProducts>[];
      newProduct =<SellersProducts>[];
      allProducts =<SellersProducts>[];
      json['products'].forEach((v){
        if(v['status']=='New'){
          newProduct!.add(SellersProducts.fromJson(v));
        }else{
          usedProduct!.add(SellersProducts.fromJson(v));
        }
        allProducts!.add(SellersProducts.fromJson(v));
      });
    }
  }
}
class SellersProducts {
  String? sId;
  String? status;
  String? category;
  String? name;
  dynamic price;
  String? description;
  List<String>? images;
  String? image;
  String? company;
  dynamic countInStock;
  int? iV;
  bool? inCart = false;
  bool? inFavorite = false;
  SellersProducts(
      {this.sId,
        this.status,
        this.category,
        this.name,
        this.price,
        this.description,
        this.image,
        this.company,
        this.countInStock,
        this.iV});

  SellersProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    images = json['images'].cast<String>();
    description = json['description'];
    image = json['image'];
    company = json['company'];
    countInStock = json['countInStock'];
    iV = json['__v'];
  }

}