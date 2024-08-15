import 'package:flutter/material.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/painter.dart';
Widget buildSettingGeneralItem({required title,required subtitle,required icon,required context,required screen})=> ClipRRect(
  borderRadius:BorderRadius.circular(10),
  child: Container(
    height: 66,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1))
    ),
    child: CustomPaint(
      painter: ElktraCubit.get(context).dark?MyPainterGeneralSettingDarkTheme():MyPainterGeneralSettingLightTheme(),
      child: Row(
        children: [
          const SizedBox(width:10),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
            child:Icon(
              icon,
              size: 25,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(title,style: const TextStyle(color: Colors.black54),),
                Text(subtitle),
              ],
            ),
          ),
          const SizedBox(width: 16),
          if(title=='Mode')
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 25,
              width: 45,
            ),
          ),
          if(title!='Mode' && title!='Chats'&&title !='Product' && title !='Orders')
            InkWell(
              onTap:(){
                navigateToNextScreen(context,screen);
              },
              child: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
              ),
            ),
          if(title=='Chats')
            Switch(value:true, onChanged:(value){},
            activeColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
          if(title=='Product')
            Switch(value:true, onChanged:(value){},
                activeColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
          if(title=='Orders')
            Switch(value:true, onChanged:(value){},
                activeColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
          const SizedBox(width: 16),

        ],
      ),
    ),
),
);