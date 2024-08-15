import 'package:ek/core/lists/on_boarding.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/onboarding_cubit/onboarding_cubit.dart';
import 'package:ek/core/user_controller/onboarding_cubit/onboarding_states.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var boardController = PageController();
          var cubit = OnboardingCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.appTitle,
                    style: TextStyle(
                        color: AppColorsLightTheme.defaultColor,
                        fontSize: AppFontsSize.fontSize40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jannah'),
                  ),
                  Container(
                    height: 450,
                    child: PageView.builder(
                      onPageChanged: (int index) {
                        if (index == onboarding.length - 1) {
                          cubit.pageChangeLast(index);
                          cubit.printLast();
                        } else {
                          cubit.pageNotLast(index);
                          cubit.printLast();
                        }
                      },
                      physics: const BouncingScrollPhysics(),
                      controller: boardController,
                      itemBuilder: (context, index) =>
                          buildOnBoardingItem(onboarding[index]),
                      itemCount: onboarding.length,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  cubit.isPageLast
                      ? Padding(
                          padding: const EdgeInsets.only(left:15,right: 15,top: 8,bottom: 8),
                          child: DefaultButton(
                              buttonWidget: const Text(
                                'GetStarted',
                                style: TextStyle(
                                    color: AppColorsLightTheme.scaffoldBackGroundColor),
                              ),
                              function: () {
                                cubit.submit(context);
                              },
                            borderColor: Colors.transparent,),
                        )
                      : Padding(
                        padding: const EdgeInsets.only(left:15,right: 15,top: 8,bottom: 8),
                          child: DefaultButton(
                              buttonWidget: const Text(
                                'Next',
                                style: TextStyle(
                                    color: AppColorsLightTheme.scaffoldBackGroundColor),
                              ),
                              function: () {
                                boardController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 750,
                                    ),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                            borderColor: Colors.transparent
                          ),
                        ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40,left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      MaterialButton(onPressed: () {
                        boardController.previousPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      child: Text('back',style: TextStyle(fontSize: AppFontsSize.fontSize20,color:cubit.screenIndex==0?Colors.transparent:AppColorsLightTheme.defaultColor),)),
                      SmoothPageIndicator(
                          effect: ExpandingDotsEffect(
                            dotColor: Colors.grey[300]!,
                            activeDotColor: AppColorsLightTheme.defaultColor,
                            dotHeight: 10,
                            dotWidth: 10,
                            // expansionFactor: 4,
                            spacing: 5.0,
                          ),
                          controller: boardController,
                          count: onboarding.length),
                        MaterialButton(onPressed: () {cubit.submit(context);},
                        child: Text('Skip',style: TextStyle(fontSize: AppFontsSize.fontSize20,color:cubit.screenIndex==3?Colors.transparent:AppColorsLightTheme.defaultColor),))
                    ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
