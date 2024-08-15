import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/lottie.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/forget_password_cubit/forget_password_cubit.dart';
import 'package:ek/core/user_controller/forget_password_cubit/forget_password_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/reset_password.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  var newPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ElktraCubit.get(context).dark
              ? AppColorsDarkTheme.scaffoldBackGroundColor
              : AppColorsLightTheme.scaffoldBackGroundColor,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: ElktraCubit.get(context).dark
                  ? AppColorsDarkTheme.scaffoldBackGroundColor
                  : AppColorsLightTheme.scaffoldBackGroundColor,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.forgetPassword,
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.blackColor,
                              fontSize: AppFontsSize.fontSize30)),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: 300,
                        child: Text(
                          AppStrings.forgetPasswordText,
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.blackColor,
                              fontSize: AppFontsSize.fontSize20),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Lottie.asset(AppLottieAssets.forgetPasswordNew),
                      ),
                      DefaultFieldForm(
                        controller: newPasswordController,
                        keyboard: TextInputType.visiblePassword,
                        hint: 'New Password',
                        label: 'New Password',
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Enter New Password';
                          }
                          return null;
                        },
                        labelStyle: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor),
                        prefix: Icons.password,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      DefaultButton(
                          backgroundColor: ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.defaultColor
                              : AppColorsLightTheme.defaultColor,
                          buttonWidget: Text(
                            'Reset',
                            style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsDarkTheme.whiteColor,
                            ),
                          ),
                          function: () {
                            if (formKey.currentState!.validate()) {
                              navigateToNextScreen(
                                  context,
                                  ResetPasswordScreen(
                                      newPassword: newPasswordController.text));
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
