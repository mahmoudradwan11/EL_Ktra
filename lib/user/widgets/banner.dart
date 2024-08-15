import 'package:carousel_slider/carousel_slider.dart';
import 'package:ek/core/lists/banner.dart';
import 'package:flutter/material.dart';

Widget buildBanner() => CarouselSlider(
  items: bannerImages
      .map(
        (e) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
              image: NetworkImage(e),
          fit: BoxFit.fill,
          )
          )
        ),
  )
      .toList(),
  options: CarouselOptions(
      height: 250.0,
      enableInfiniteScroll: true,
      reverse: false,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(seconds: 1),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollDirection: Axis.horizontal),
);