import 'package:ek/core/mangers/icon_broken.dart';
import 'package:ek/user/screens/cart.dart';
import 'package:ek/user/screens/category.dart';
import 'package:ek/user/screens/favorite.dart';
import 'package:ek/user/screens/products.dart';
import 'package:ek/user/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
List<Widget> userHomeScreens =const[
  ProductsScreen(),
  FavoriteScreen(),
  CartScreen(),
  CategoryScreen(),
  SettingsScreen(),
];
List<GButton> bottomBavBarTabs =const [
  GButton(
    icon: IconBroken.Home,
    text: 'Home',
  ),
   GButton(
    icon: Icons.favorite,
    text: 'Favorite',
  ),
  GButton(
    icon:IconBroken.Bag_2,
    text: 'Cart',
  ),
  GButton(
    icon: IconBroken.Category,
    text: 'Category',
  ),
   GButton(icon: Icons.settings, text: 'Setting')
];
List<BottomNavigationBarItem>bottomNavBarTabs = const [
  BottomNavigationBarItem(
      icon: Icon(IconBroken.Home),
      label: 'Home'),
  BottomNavigationBarItem(
      icon: Icon(IconBroken.Heart),
      label: 'Favorite'),
  BottomNavigationBarItem(
      icon: Icon(IconBroken.Bag),
      label: 'Cart'),
  BottomNavigationBarItem(
      icon: Icon(IconBroken.Category),
      label: 'Category'),
  BottomNavigationBarItem(
      icon: Icon(IconBroken.Setting),
      label: 'Setting'),

];