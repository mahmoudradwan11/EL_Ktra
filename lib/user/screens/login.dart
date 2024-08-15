import 'package:ek/admin/screens/home.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/reg/reg_exp.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/local/cache_helper.dart';
import 'package:ek/core/user_controller/login_cubit/login_cubit.dart';
import 'package:ek/core/user_controller/login_cubit/login_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/forget_password.dart';
import 'package:ek/user/screens/home.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        if (state.model.status == "success") {
          print(state.model.message);
          print(state.model.user!.token);
          CacheHelper.saveData(
                  key: 'userId', value: state.model.user!.nationalId)
              .then((value) {
            nationalId = state.model.user!.nationalId;
          });
          CacheHelper.saveData(key: 'token', value: state.model.user!.token)
              .then((value) {
            token = state.model.user!.token;
            showToast('${state.model.message}', ToastStates.SUCCESS);
            if (state.model.user!.nationalId == adminId) {
              navigateAndFinishThisScreen(context, const AdminHomeScreen());
            } else {
              ElktraCubit.get(context).currentHomeScreenIndex=0;
              navigateAndFinishThisScreen(context, const UserHomeScreen());
            }
          });
        } else {
          print(state.model.message);
        }
      }
    }, builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);
      return Scaffold(
        backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.scaffoldBackGroundColor:AppColorsLightTheme.scaffoldBackGroundColor,
        body: Column(children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImages.loginImage,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(left: 50, top: 60),
                child: Text(
                  AppStrings.appTitle,
                  style: TextStyle(
                      color:AppColorsLightTheme.scaffoldBackGroundColor,
                      fontSize: AppFontsSize.fontSize30,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50,top: 100),
                child: SizedBox(
                    width: 250,
                    child: Text(
                      AppStrings.loginText,
                      style: TextStyle(fontSize: AppFontsSize.fontSize15,color: AppColorsLightTheme.scaffoldBackGroundColor),
                    )),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Text(
                      AppStrings.login,
                      style: TextStyle(
                          color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                          fontSize: AppFontsSize.fontSize40,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15,),
                    DefaultFieldForm(
                      label: 'Email',
                    controller: emailController,
                    keyboard: TextInputType.emailAddress,
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                    labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                    prefix: Icons.email,
                    hint: 'Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    show: false),
                   const SizedBox(
                     height: 15,
                   ),
                   DefaultFieldForm(
                     label: 'Password',
                    controller: passwordController,
                    keyboard: TextInputType.emailAddress,
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                      return null;
                    },
                    prefix: Icons.password,
                    hint: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    show: cubit.passwordShow,
                  suffix: cubit.suffixIcon,
                       labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                       suffixPress: () {
                    cubit.changePasswordIcon();
                  }),
                    Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: MaterialButton(onPressed: () {
                          navigateToNextScreen(context, ForgetPasswordScreen());
                        }, child: Text('Forget Your Password ?',style: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),),)),
                    const SizedBox(
                      height: 20,
                    ),
                    state is LoadingLogin ? LoadingAnimationWidget.inkDrop(
                      color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                      size: 20,
                    ):
                    DefaultButton(
                      backgroundColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                        borderColor: Colors.transparent,
                        buttonWidget: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            if (Exp.isEmailValid(emailController.text)) {
                              cubit.loginUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                            else {
                              showToast('Please Enter Valid Email',
                                  ToastStates.WARNING);
                            }
                          }
                        }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children:[
                          Text('I don\'t Have account?',style: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor),),
                          MaterialButton(onPressed: () {
                            navigateAndReplace(context, Routes.registerRoute);
                          },
                              child: Text('Create Account',
                                style: TextStyle(color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),))
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ]),
      );
    });
  }
}
