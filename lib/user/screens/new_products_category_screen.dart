import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:ek/user/screens/laptops_products.dart';
import 'package:ek/user/screens/pc_%20accessories_products.dart';
import 'package:ek/user/screens/smart_Tvs_products.dart';
import 'package:ek/user/screens/smart_phone_products.dart';
import 'package:ek/user/screens/smart_watches_products.dart';
import 'package:ek/user/widgets/build_category_item.dart';
class NewsProductsCategoryScreen extends StatelessWidget {
  const NewsProductsCategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElktraCubit, ElktraStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElktraCubit.get(context);
          return Scaffold(
            backgroundColor:  cubit.dark
                ? AppColorsDarkTheme.scaffoldBackGroundColor
                : AppColorsLightTheme.grey200,
            appBar: AppBar(
              backgroundColor: cubit.dark
                  ? AppColorsDarkTheme.scaffoldBackGroundColor
                  : AppColorsLightTheme.grey200,
              title:const Text('New Products'),
              centerTitle: true,
            ),
            body:BlocConsumer<AppUiCubit,AppUiStates>(
              listener:(context,state){},
              builder:(context,state){
                var cubit = AppUiCubit.get(context);
                return Column(
                  children: [
                    InkWell(
                        onTap: (){
                          cubit.changeTapBarView(1);
                          navigateToNextScreen(context, const LaptopsProducts());
                        },
                        child: buildCategoryScreenItem('LapTop',context,ElktraCubit.get(context).homeLaptops!.newProduct!.length)),
                    InkWell(
                        onTap:(){
                          cubit.changeTapBarView(1);
                          navigateToNextScreen(context, const SmartPhonesProducts());
                        },
                        child: buildCategoryScreenItem('Smart Phones',context,ElktraCubit.get(context).homeSmartPhone!.newProduct!.length)),
                    InkWell(
                        onTap:(){
                          cubit.changeTapBarView(1);
                          navigateToNextScreen(context,const SmartWatchesProducts());
                        },
                        child: buildCategoryScreenItem('Smart Watches',context,ElktraCubit.get(context).homeSmartWatch!.product!.length)),
                    InkWell(onTap:(){
                      cubit.changeTapBarView(1);
                      navigateToNextScreen(context,const SmartTvsProducts());

                    },
                      child:buildCategoryScreenItem('Smart TVS',context,ElktraCubit.get(context).homeTVS!.newProduct!.length),
                    ),
                    InkWell(onTap:(){
                      cubit.changeTapBarView(1);
                      navigateToNextScreen(context,const AccessoriesProducts());

                    },
                      child:buildCategoryScreenItem('PC Accessories',context,ElktraCubit.get(context).homeAccessories!.product!.length),
                    )
                  ],
                );
              },
            ),
          );
        }
    );
  }
}
