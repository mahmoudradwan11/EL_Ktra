import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/user/models/tapbar_model.dart';

Widget buildTapBar(TapBarModel customTapBar,index,context)=>InkWell(
    onTap: (){
      AppUiCubit.get(context).changeTapBarView(index);
    },
    child: Container(
      width: 63,
      height: 40,
      decoration: BoxDecoration(
          gradient:AppUiCubit.get(context).chooseColorTapBar(index,context),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Center(child: Text(customTapBar.title!,style:TextStyle(color:AppUiCubit.get(context).tapBarTitleIndex==index?Colors.white:HexColor('#000000')),)),
    )
);