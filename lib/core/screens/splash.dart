import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ek/core/lists/splash_color.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key,}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
  fontWeight: FontWeight.bold
);
class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startTimer(){
    _timer = Timer(const Duration(seconds: AppValuesConstant.timer),_goNext);
  }
  _goNext(){
    navigateAndReplace(context,nextScreen);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:AppColorsLightTheme.scaffoldBackGroundColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            height: 200,
            width: 200,
              child: SvgPicture.asset(AppImages.appIcon)),
          SizedBox(
          width:double.infinity,
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'ELEKTRA',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        )
        ]
      ),
    )
    );
  }
  @override
  void dispose() {
    _timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
