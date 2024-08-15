import 'package:flutter/material.dart';
import 'package:ek/core/network/remote/api_constants.dart';

Map<String,double> companiesDetails = {
  'Dell': d.toDouble(),
  'HP': p.toDouble(),
  'Lenovo': l.toDouble(),
  'Apple': a.toDouble(),
  'Xiaomi': x.toDouble(),
  'Samsung': s.toDouble(),
  'Huawei': h.toDouble(),
  'LG': g.toDouble(),
  'Microsoft': m.toDouble()
};
List<Color> companiesColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.pink,
  Colors.brown,
  Colors.purple,
  Colors.orange,
];
Map<String,double> categoriesDetails  = {
  'Laptops': laptops.toDouble(),
  'Tvs': tv.toDouble(),
  'HeadPhone': head.toDouble(),
  'Smart Phones': phones.toDouble(),
  'Smart Watches': watches.toDouble(),
  'Accessories':acc.toDouble(),
};
List<Color> categoriesColors = [
Colors.red,
Colors.blue,
Colors.green,
Colors.teal,
Colors.yellow,
Colors.pink,
];