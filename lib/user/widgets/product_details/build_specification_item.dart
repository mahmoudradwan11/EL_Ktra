import 'package:flutter/material.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
class BuildSpecificationProductItem extends StatelessWidget {
  String? category;
  Color darkBackGroundColor;
  Color lightBackGroundColor;
  String title;
  String subTitle;
  BuildSpecificationProductItem(
      {Key? key,
       this.category,
        required this.title,
        required this.subTitle,
        required this.darkBackGroundColor,
      required this.lightBackGroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ElktraCubit.get(context).dark?darkBackGroundColor:lightBackGroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right:20),
        child: Row(
          children:  [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
              fontSize:AppFontsSize.fontSize12, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Text(subTitle,
                    style: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
                        fontSize: AppFontsSize.fontSize12, fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
