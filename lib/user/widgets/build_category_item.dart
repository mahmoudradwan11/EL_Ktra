import 'package:flutter/material.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';

Widget buildCategoryScreenItem(String text,context,va)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
      height:52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ElktraCubit.get(context).dark
          ? AppColorsDarkTheme.defaultColor
          : AppColorsLightTheme.defaultColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child:Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(text,style:TextStyle(color: AppColorsDarkTheme.whiteColor,fontWeight: FontWeight.w500,fontSize: 16),),
            const Spacer(),
            Text('$va Products',style:const TextStyle(color: Colors.grey),),
            const SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(Icons.arrow_forward_ios,color:AppColorsDarkTheme.whiteColor),
            )
          ],
        ),
      )
  ),
);