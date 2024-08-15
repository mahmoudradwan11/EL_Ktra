import 'package:flutter/material.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';

class BuildProductDetailsView extends StatelessWidget {
  Function() function;
  String titleText;
  int flex;
  int checkIndex;
  int currentProductDetailsView;
  BuildProductDetailsView({
    Key? key,
    required this.function,
    required this.checkIndex,
    required this.flex,
    required this.titleText,
    required this.currentProductDetailsView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: function,
        child: Container(
            decoration: BoxDecoration(
              border: currentProductDetailsView == checkIndex
                  ? const Border()
                  : null,
            ),
            child: Column(
              children: [
                Text(
                  titleText,
                  style: TextStyle(
                      color: currentProductDetailsView == checkIndex
                          ? ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.defaultColor
                              : AppColorsLightTheme.defaultColor
                          : ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.whiteColor.withOpacity(0.3)
                              : AppColorsLightTheme.blackColor.withOpacity(0.3),
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontsSize.fontSize12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: 55,
                  color: currentProductDetailsView == checkIndex
                      ? ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.defaultColor
                          : AppColorsLightTheme.defaultColor
                      : Colors.transparent,
                )
              ],
            )),
      ),
    );
  }
}
