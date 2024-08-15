import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/reg/reg_exp.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/local/cache_helper.dart';
import 'package:ek/core/user_controller/register_cubit/register_cubit.dart';
import 'package:ek/core/user_controller/register_cubit/register_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/home.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var confirmController = TextEditingController();
  var nationalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
      if (state is UserRegisterSuccessfully) {
        if (state.userModel.status == "success") {
          print(state.userModel.message);
          showToast(state.userModel.message!, ToastStates.SUCCESS);
          print(state.userModel.user!.token);
          CacheHelper.saveData(
                  key: 'userId', value: state.userModel.user!.nationalId)
              .then((value) {
            nationalId = state.userModel.user!.nationalId;
          });
          CacheHelper.saveData(
            key: 'token',
            value: state.userModel.user!.token,
          ).then((value) {
            token = state.userModel.user!.token!;
            navigateAndFinishThisScreen(
              context,
              const UserHomeScreen(),
            );
          });
        } else {
          print(state.userModel.message);
        }
      }
    }, builder: (context, state) {
      var cubit = RegisterCubit.get(context);
      return Scaffold(
          backgroundColor: ElktraCubit.get(context).dark
              ? AppColorsDarkTheme.scaffoldBackGroundColor
              : AppColorsLightTheme.scaffoldBackGroundColor,
          body: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            AppImages.registerImage,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 100),
                    child: cubit.image == null
                        ? MaterialButton(
                            onPressed: () {
                              cubit.addImage();
                            },
                            child: CircleAvatar(
                                radius: 40,
                                child: ClipOval(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            AppImages.userNotImage),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )))
                        : CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(cubit.image!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, bottom: 60),
                    child: Text(
                      AppStrings.appTitle,
                      style: TextStyle(
                          color: AppColorsLightTheme.defaultColor,
                          fontSize: AppFontsSize.fontSize30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, bottom: 20),
                    child: SizedBox(
                        width: 250,
                        child: Text(
                          AppStrings.registerText,
                          style: TextStyle(fontSize: AppFontsSize.fontSize15),
                        )),
                  )
                ],
              ),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Text(
                        AppStrings.register,
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                            fontSize: AppFontsSize.fontSize40,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                        controller: nameController,
                        keyboard: TextInputType.text,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                        label: 'Full Name',
                        prefix: Icons.person,
                        hint: 'Full Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                        labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter your Email';
                          }
                          return null;
                        },
                        label: 'Email Address',
                        prefix: Icons.email,
                        hint: 'Email Address',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                        labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                        controller: phoneController,
                        keyboard: TextInputType.phone,
                        label: 'Phone',
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Phone';
                          }
                          return null;
                        },
                        prefix: Icons.phone,
                        hint: 'Phone',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                          labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                          controller: passwordController,
                          keyboard: TextInputType.visiblePassword,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.password,
                          hint: 'Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: cubit.isPassword,
                          suffix: cubit.suffix,
                          suffixPress: () {
                            cubit.changePasswordVisibility();
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                          labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                          controller: confirmController,
                          keyboard: TextInputType.text,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Confirm Your Password';
                            }
                            return null;
                          },
                          label: 'Confirm Password',
                          prefix: Icons.confirmation_num,
                          hint: 'Confirm Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: cubit.isPassword,
                          suffix: cubit.suffix,
                          suffixPress: () {
                            cubit.changePasswordVisibility();
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                        labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                        controller: nationalController,
                        keyboard: TextInputType.number,
                        label: 'National ID',
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Confirm Your National Id';
                          }
                          return null;
                        },
                        prefix: Icons.video_stable,
                        hint: 'National ID',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                                activeColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                value: cubit.check,
                                onChanged: (value) {
                                  cubit.changeCheck(value);
                                },
                              hoverColor: Colors.yellow,
                                ),
                             Expanded(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'I Have read and agree to the privacy policy, terms of serice, and community guidelines.',
                                  style: TextStyle(
                                      color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      state is LoadingUserRegister
                          ? LoadingAnimationWidget.inkDrop(
                        color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                        size: 20,
                            )
                          : DefaultButton(
                          backgroundColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                          borderColor: Colors.transparent,
                              buttonWidget: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  if (cubit.check == true) {
                                    if (passwordController.text ==
                                        confirmController.text) {
                                      if (Exp.isEmailValid(
                                          emailController.text)) {
                                        if (Exp.isPhoneValid(
                                            phoneController.text)) {
                                          cubit.userRegister(
                                            email: emailController.text,
                                            name: nameController.text,
                                            phone: phoneController.text,
                                            password: passwordController.text,
                                            nationalID: nationalController.text,
                                          );
                                        } else {
                                          showToast(
                                              'Please Enter Valid Phone Number',
                                              ToastStates.WARNING);
                                        }
                                      } else {
                                        showToast('Please Enter Valid Email',
                                            ToastStates.WARNING);
                                      }
                                    } else {
                                      showToast('Please Confirm Your Password',
                                          ToastStates.WARNING);
                                    }
                                  } else {
                                    showToast('Please Confirm Policy',
                                        ToastStates.WARNING);
                                  }
                                }
                              }),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                             Text('Already have an account?',style: TextStyle(color:ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.blackColor),),
                            MaterialButton(
                                onPressed: () {
                                  navigateAndReplace(
                                      context, Routes.loginRoute);
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                      fontSize: 20),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ));
    });
  }
}
