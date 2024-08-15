import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/lottie.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/forget_password_cubit/forget_password_cubit.dart';
import 'package:ek/core/user_controller/forget_password_cubit/forget_password_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/send_password.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key, required this.newPassword}) : super(key: key);
  var nationalIDController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? newPassword;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
      if (state is ResetPasswordDone) {
        navigateAndFinishThisScreen(context, const SendPasswordScreen());
      }
    }, builder: (context, state) {
      var cubit = ForgetPasswordCubit.get(context);
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color:ElktraCubit.get(context).dark?AppColorsDarkTheme.scaffoldBackGroundColor:AppColorsLightTheme.scaffoldBackGroundColor,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.forgetPassword,
                        style: TextStyle(
                            color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
                            fontSize: AppFontsSize.fontSize30)),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 300,
                      child: Text(
                        AppStrings.forgetPasswordText2,
                        style: TextStyle(
                            color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
                            fontSize: AppFontsSize.fontSize20),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Lottie.asset(AppLottieAssets.resetPasswordNew),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DefaultFieldForm(
                      controller: nationalIDController,
                      keyboard: TextInputType.number,
                      hint: 'NationalID',
                      label: 'NationalID',
                      labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                      valid: (value) {
                        if (value.isEmpty) {
                          return 'Enter Your National Id';
                        }
                        return null;
                      },
                      prefix: Icons.person,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    DefaultButton(
                        backgroundColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                        buttonWidget:  Text(
                          'Send',
                          style: TextStyle(
                            color: ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
                        ),
                        ),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.resetPassword(
                                nationalIDController.text, newPassword);
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
