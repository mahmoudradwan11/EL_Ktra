class UsersModel {
  String? status;
  String? message;
  List<User>? user;
  UsersModel({this.status, this.message, this.user});

  UsersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
  }
}

class User{
  String? sId;
  String? name;
  String? profileImage;
  String? email;
  String? phone;
  String? nationalId;
  String? gender;
  String? password;
  String? token;
  int? iV;

  User(
      {this.sId,
        this.name,
        this.email,
        this.profileImage,
        this.phone,
        this.nationalId,
        this.gender,
        this.password,
        this.token,
        this.iV});
  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];
    nationalId = json['nationalId'];
    gender = json['gender'];
    password = json['password'];
    token = json['token'];
    iV = json['__v'];
  }
}