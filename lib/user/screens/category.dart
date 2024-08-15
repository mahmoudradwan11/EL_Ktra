import 'package:flutter/material.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/user_controller/search_cubit/search_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/new_products_category_screen.dart';
import 'package:ek/user/screens/used_products_category_screen.dart';
import 'package:ek/user/widgets/build_category_item.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElktraCubit.get(context).dark
        ? AppColorsDarkTheme.scaffoldBackGroundColor
        : AppColorsLightTheme.grey200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ElktraCubit.get(context).dark
            ? AppColorsDarkTheme.defaultColor
            : AppColorsLightTheme.grey200,
        title:const Text(AppStrings.categoryScreenTitle),
      ),
      body:Column(
        children: [
          InkWell(
            onTap: (){
             navigateToNextScreen(context,const NewsProductsCategoryScreen());
            },
            child: buildCategoryScreenItem('News Products',context,SearchCubit.get(context).searchModel!.newProducts!.length),),
          InkWell(
              onTap:(){
                navigateToNextScreen(context,const UsedProductsCategoryScreen());
              },
              child: buildCategoryScreenItem('Used Products',context,SearchCubit.get(context).searchModel!.usedProducts!.length))
        ],
      ),
    );
  }
}
