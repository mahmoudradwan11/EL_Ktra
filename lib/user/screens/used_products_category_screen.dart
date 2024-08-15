import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:ek/user/screens/laptops_products.dart';
import 'package:ek/user/screens/smart_Tvs_products.dart';
import 'package:ek/user/screens/smart_phone_products.dart';
import 'package:ek/user/widgets/build_category_item.dart';

class UsedProductsCategoryScreen extends StatelessWidget {
  const UsedProductsCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElktraCubit, ElktraStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElktraCubit.get(context);
          return Scaffold(
              backgroundColor:cubit.dark
                  ? AppColorsDarkTheme.scaffoldBackGroundColor
                  : AppColorsLightTheme.grey200,
              appBar: AppBar(
                backgroundColor: cubit.dark
                    ? AppColorsDarkTheme.scaffoldBackGroundColor
                    : AppColorsLightTheme.grey200,
                title:const Text('Used Products'),
                centerTitle: true,
              ),
              body:
    BlocConsumer<AppUiCubit,AppUiStates>(
    listener:(context,state){},
    builder:(context,state) {
      var cubit = AppUiCubit.get(context);
      return Column(
        children: [
          InkWell(
              onTap: () {
                cubit.changeTapBarView(2);
                navigateToNextScreen(context, const LaptopsProducts());
              },
              child: buildCategoryScreenItem('LapTop',context,ElktraCubit
                  .get(context)
                  .homeLaptops!
                  .usedProduct!
                  .length
              ,)),
          InkWell(
              onTap: () {
                cubit.changeTapBarView(2);
                navigateToNextScreen(context, const SmartPhonesProducts());
              },
              child: buildCategoryScreenItem(
                  'Smart Phones', context, ElktraCubit
                  .get(context)
                  .homeSmartPhone!
                  .usedProduct!
                  .length)),
          InkWell(
              onTap: () {
                cubit.changeTapBarView(2);
                navigateToNextScreen(context, const SmartTvsProducts());
              },
              child: buildCategoryScreenItem('Smart Tvs', context, ElktraCubit
                  .get(context)
                  .homeTVS!
                  .usedProduct!
                  .length)),
        ],
      );
    }
              )
          );
        }
    );
  }
}
