import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:flutter/material.dart';

Widget buildUserProfileItem(String title,String content)=>Container(
  width: double.infinity,
  child: Card(
    shadowColor: AppColorsLightTheme.defaultColor,
    elevation: 1,
    margin: const EdgeInsets.all(10),
    child:Padding(
      padding: const EdgeInsets.only(left: 20.0,bottom: 10,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            title,
            style:const TextStyle(
              fontSize: AppFontsSize.fontSize18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            content,
            style: const TextStyle(
              fontSize: AppFontsSize.fontSize14,
              color: AppColorsLightTheme.greyColor
            ),
          ),
        ],
      ),
    ),
  ),
);