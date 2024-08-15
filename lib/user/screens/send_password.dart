import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/lottie.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/login.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SendPasswordScreen extends StatelessWidget {
  const SendPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Reset Done',style: TextStyle(color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
              fontSize: AppFontsSize.fontSize30),),
              Lottie.asset(AppLottieAssets.sendNewPassword),
              const SizedBox(
                height: 50,
              ),
              DefaultButton(
                  backgroundColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                  buttonWidget: Text('Back To Login',style: TextStyle(color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
              ),), function:(){
                navigateAndFinishThisScreen(context, LoginScreen());
              })
            ],
          ),
        ),
      ),
    );
  }
}
