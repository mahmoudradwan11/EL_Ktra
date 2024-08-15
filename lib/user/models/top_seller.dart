class TopSellerModel{
  String? status;
  String? message;
  List<TopSellingCompany>? topSellingCompany;

  TopSellerModel({this.status, this.message, this.topSellingCompany});

  TopSellerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['topSellingCompany'] != null) {
      topSellingCompany =<TopSellingCompany>[];
      json['topSellingCompany'].forEach((v) {
        topSellingCompany!.add(TopSellingCompany.fromJson(v));
      });
    }
  }
}
class TopSellingCompany {
  String? sId;
  dynamic totalSales;

  TopSellingCompany({this.sId, this.totalSales});

  TopSellingCompany.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalSales = json['totalSales'];
  }
}
