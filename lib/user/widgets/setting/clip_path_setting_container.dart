import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/setting/clipper.dart';

Widget buildClipContainer(context) => ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: ElktraCubit.get(context).dark?
          LinearGradient(colors:[
            AppColorsDarkTheme.defaultColor,
            HexColor('#101237')
          ]):
          LinearGradient(colors:[
            AppColorsLightTheme.defaultColor,
            HexColor('#101237')
          ])
        ),
        height: 300,
      ),
    );
Widget buildClipEditProfileContainer(context)=>ClipPath(
  clipper: MyCustomClipperForEditProfile(),
  child: Container(
    decoration: BoxDecoration(
        gradient: ElktraCubit.get(context).dark?
        LinearGradient(colors:[
          AppColorsDarkTheme.defaultColor,
          HexColor('#101237')
        ]):
        LinearGradient(colors:[
          AppColorsLightTheme.defaultColor,
          HexColor('#101237')
        ])
    ),
    height: 300,
  ),
);