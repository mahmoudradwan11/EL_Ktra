import 'package:ek/admin/models/company_products_model.dart';

const String baseUrl = 'https://elwekala.onrender.com';
class ApiConstants {
  static const loginApi = '$baseUrl/user/login';
  static const registerApi = '$baseUrl/user/register';
  static const forgetPasswordApi = '$baseUrl/user/forget-password';
  static const profileApi = '$baseUrl/user/profile';
  static const editProfile = '$baseUrl/user/update';
  static const getUsersApi = '$baseUrl/user/display';
  static const deleteUserApi = '$baseUrl/user/delete';
  static const chatApi = '$baseUrl/chat/';
  static const homeLaptopApi = '$baseUrl/product/inCart/Laptops';
  static const homeSmartPhoneApi = '$baseUrl/product/inCart/Smart Phones';
  static const homeSmartWatchApi = '$baseUrl/product/inCart/Smart Watches';
  static const topSellerApi = '$baseUrl/product/get/top-sellers';
  static const homeSmartTvsApi = '$baseUrl/product/inCart/Smart TVs';
  static const homeAccApi = '$baseUrl/product/inCart/PC and laptop accessories';
  static const favoriteApi = '$baseUrl/favorite';
  static const sellerApi = '$baseUrl/product';
  static const addToCartApi = 'https://elwekala.onrender.com/cart/add';
  static const geyMyCartApi = 'https://elwekala.onrender.com/cart/alekroducts';
  static const getTotaekriceApi = 'https://elwekala.onrender.com/cart/total';
  static const addProductApi = '$baseUrl/product/add';
  static const deleteCartApi = 'https://elwekala.onrender.com/cart/delete';
  static const updateQuantityApi = 'https://elwekala.onrender.com/cart';
  static const logoutApi= 'https://elwekala.onrender.com/user/logout';
  static const deleteReviewApi='https://elwekala.onrender.com/review';
  static const addReviewApi = 'https://elwekala.onrender.com/review';
  static const getAllReviewApi = 'https://elwekala.onrender.com/review/allreviews';
 static const  searchApi='https://elwekala.onrender.com/product/get/search';
 static const getAlekroductsApi= 'https://elwekala.onrender.com/product/get/search';
 static const sendContactApi = '$baseUrl/report';
 static const companyProductsSales = '$baseUrl/product/get/sorted-products';
 static const String baseUrekayment = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static String idCard = '3293535';
  static String visaUrl =
      '$baseUrekayment/acceptance/iframes/722023?payment_token=$finalToken';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentKey = '/acceptance/payment_keys';
  static const paymentApiKey =
      'ZXlKaGJHY2ekaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMekwYkdWZmNHc2ekalkzTkRnek1Td2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuYzg3dG1oTi1IMi1RNWlEZ1BBdEFZUUZnbUJWTFRrLWRlYTF1OG1TMVlmNU1hTVotOUJGMUNmRTJYZElaQzFzYkhSVl8xTWZLa3dCdmRpNlNPbWdfS0E=';
}

var authToken;
var orderPaymentId;
var finalToken;
var h;
var d;
var l;
var s;
var g;
var a;
var x;
var m;
var p;
var laptops;
var watches;
var acc;
var tv;
var head;
var phones;
