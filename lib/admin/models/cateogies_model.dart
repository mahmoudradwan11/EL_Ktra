class CategiesModels{
  List<Products>? products;
  List<Products>? laptops;
  List<Products>? smartPhones;
  List<Products>? watches;
  List<Products>? accessories;
  List<Products>? headPhone;
  List<Products>? tvs;
  CategiesModels({this.products});

  CategiesModels.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      laptops = <Products>[];
      smartPhones = <Products>[];
      watches = <Products>[];
      accessories = <Products>[];
      headPhone = <Products>[];
      tvs = <Products>[];
      json['products'].forEach((v) {
        if (v['category'] == 'PC and laptop accessories') {
          accessories!.add(Products.fromJson(v));
        }
        if (v['category'] == 'Smart Watches') {
          watches!.add(Products.fromJson(v));
        }
        if (v['category'] == 'Smart Phones') {
          smartPhones!.add(Products.fromJson(v));
        }
        if (v['category'] == 'Laptops') {
          laptops!.add(Products.fromJson(v));
        }
        if (v['category'] == 'Smart TVs') {
          tvs!.add(Products.fromJson(v));
        }
        if (v['category'] == 'HeadPhone') {
          headPhone!.add(Products.fromJson(v));
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