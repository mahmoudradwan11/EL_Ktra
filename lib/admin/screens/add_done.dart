import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ek/admin/screens/home.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/lottie.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/button.dart';

class AddProductDone extends StatelessWidget {
  const AddProductDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done',),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height/3.5,
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Lottie.asset(AppLottieAssets.addProduct),
          ),
          Text('This Product Is Added Successfully',style:
          TextStyle(color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.defaultColor,
    ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(
              backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                buttonWidget:Text('Continue',style:TextStyle(color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.defaultColor,
                ),), function:(){
              navigateAndFinishThisScreen(context,const AdminHomeScreen());
            }),
          )
        ],
      ),
    );
  }
}
