import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/user/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildOnBoardingItem(OnBoardingModel onBoardingModel) => Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      height: 250,
      width: double.infinity,
      child: Lottie.asset(onBoardingModel.lottie!),
    ),
    Text(onBoardingModel.title!,style: TextStyle(color: AppColorsLightTheme.defaultColor,fontSize: AppFontsSize.fontSize30),),
    const SizedBox(
      height: 5,
    ),
    Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(onBoardingModel.body!,style:const TextStyle(color:AppColorsLightTheme.blackColor,fontSize: AppFontsSize.fontSize20),),
      ),
    )
  ],

);