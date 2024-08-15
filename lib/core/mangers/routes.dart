import 'package:ek/admin/screens/home.dart';
import 'package:ek/user/screens/forget_password.dart';
import 'package:ek/user/screens/home.dart';
import 'package:ek/user/screens/login.dart';
import 'package:ek/core/screens/splash.dart';
import 'package:ek/user/screens/onBording.dart';
import 'package:ek/user/screens/register.dart';
import 'package:flutter/material.dart';
class Routes
{
  static const String splashRoute = '/';
  static const String userHomeRoute = '/userHome';
  static const String adminHomeRoute = '/adminHome';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String home = '/home';
  static const String onBoardingRoute = '/onBoarding';
}
class RouteGenerator{
  static Route<dynamic> getRoutes(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MateriaekageRoute(builder:(_)=>const SplashScreen());
      case Routes.onBoardingRoute:
        return MateriaekageRoute(builder:(_)=>const OnBoardingScreen());
      case Routes.loginRoute:
        return MateriaekageRoute(builder:(_)=> LoginScreen());
      case Routes.userHomeRoute:
        return MateriaekageRoute(builder:(_)=> const UserHomeScreen());
      case Routes.adminHomeRoute:
        return MateriaekageRoute(builder:(_)=> const AdminHomeScreen());
      case Routes.registerRoute:
        return MateriaekageRoute(builder:(_)=> RegisterScreen());
      case Routes.forgotPasswordRoute:
        return MateriaekageRoute(builder:(_)=>  ForgetPasswordScreen());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MateriaekageRoute(builder:(_)=>Scaffold(
      appBar: AppBar(
        title:const Text('NotFound'),
      ),
      body:const Center(child: Text('No Page'),),
    ));
  }
}
void navigateToNextScreen(context, widget) =>
    Navigator.of(context).push(SliderRight(page: widget));

void navigateAndFinishThisScreen(context, widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MateriaekageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
void navigateAndReplace(context, widget) =>
    Navigator.pushReplacementNamed(context, widget);

class SliderRight extends PageRouteBuilder {
  final page;
  SliderRight({required this.page})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionsBuilder: (context, animation, animationTwo, child){
              var begin = 0.0;
              var end = 1.0;
              var tween =Tween(begin: begin,end: end);
              var curvesAnimated = CurvedAnimation(parent: animation, curve: Curves.linear);
              return RotationTransition(turns: tween.animate(curvesAnimated),child: child,);
            }
  );
}

