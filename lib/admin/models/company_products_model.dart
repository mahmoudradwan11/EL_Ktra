class CompanyProductsSalesModel{
  List<Products>? products;
  List<Products>? huawei;
  List<Products>? xiaomi;
  List<Products>? microsoft;
  List<Products>? apple;
  List<Products>? samsung;
  List<Products>? hP;
  List<Products>? lenovo;
  List<Products>? lG;
  List<Products>? dell;
  CompanyProductsSalesModel({this.products});

  CompanyProductsSalesModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      huawei = <Products>[];
      xiaomi = <Products>[];
      microsoft = <Products>[];
      apple = <Products>[];
      samsung = <Products>[];
      hP = <Products>[];
      lenovo = <Products>[];
      lG = <Products>[];
      dell = <Products>[];
      json['products'].forEach((v) {
        if (v['company'] == 'Huawei') {
          huawei!.add(Products.fromJson(v));
        }
        if (v['company'] == 'Xiaomi') {
          xiaomi!.add(Products.fromJson(v));
        }
        if (v['company'] == 'Microsoft') {
          microsoft!.add(Products.fromJson(v));
        }
        if (v['company'] == 'Apple') {
          apple!.add(Products.fromJson(v));
        }
        if (v['company'] == 'Samsung') {
          samsung!.add(Products.fromJson(v));
        }
        if (v['company'] == 'Lenovo') {
          lenovo!.add(Products.fromJson(v));
        }
        if (v['company'] == 'HP') {
          hP!.add(Products.fromJson(v));
        }
        if (v['company'] == 'LG') {
          lG!.add(Products.fromJson(v));
        }
        if (v['company'] == 'Dell') {
          dell!.add(Products.fromJson(v));
        }
      }
          );
    }
  }
}

class Products {
  dynamic sales;
  String? sId;
  String? status;
  String? category;
  String? name;
  dynamic price;
  String? description;
  String? image;
  List<String>? images;
  String? company;
  dynamic countInStock;
  dynamic iV;
  Products(
      {this.sales,
        this.sId,
        this.status,
        this.category,
        this.name,
        this.price,
        this.description,
        this.image,
        this.images,
        this.company,
        this.countInStock,
        this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sales = json['sales'];
    sId = json['_id'];
    status = json['status'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    images = json['images'].cast<String>();
    company = json['company'];
    countInStock = json['countInStock'];
    iV = json['__v'];
  }
}