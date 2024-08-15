import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_states.dart';
import 'package:ek/core/lists/setting.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/setting/build_general_compantant.dart';
import 'package:ek/user/widgets/setting/build_notification_item.dart';
import 'package:ek/user/widgets/setting/build_payment_componant.dart';
import 'package:ek/user/widgets/setting/build_setting_item.dart';
import 'package:ek/user/widgets/setting/clip_path_setting_container.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminUsersCubit,AdminUsersStates>(
      listener: (context,state){},
        builder:(context,state) {
        var cubit = AdminUsersCubit.get(context);
    if(cubit.profileModel==null||cubit.profileModel!.user!.profileImage==null) {
      return Center(
          child: LoadingAnimationWidget.inkDrop(
            color: Colors.black,
            size: 20,
          ));
    }
          return Scaffold(
            body: Container(
            decoration: BoxDecoration(
            gradient: ElktraCubit.get(context).dark?
          LinearGradient(
              colors: [
                AppColorsDarkTheme.defaultColor,
                HexColor('#101237')
              ]
          ):
          const LinearGradient(
              colors: [
                Colors.white,
                Colors.white
              ]
          )
          ),
              child: SingleChildScrollView(
                child: Column(
                    children: [
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                        gradient: ElktraCubit.get(context).dark?
                        LinearGradient(
                            colors: [
                              AppColorsDarkTheme.defaultColor,
                              HexColor('#101237')
                            ]
                        ):
                        const LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white
                            ]
                        )
                    ),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        buildClipContainer(context),
                        const Positioned(
                            top: 50,
                            left: 40,
                            child: Text(
                              AppStrings.settingScreenTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Jannah',
                                  fontSize: AppFontsSize.fontSize20),
                            )),
                        BlocConsumer<AppUiCubit, AppUiStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 210, left: 25),
                              child: Container(
                                height: 62,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        buildSettingItem(
                                            settingTitles[index], index, context),
                                    separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount: settingTitles.length),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 110),
                          child: Container(
                            height: 71,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30,right: 30),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(cubit.profileModel!.user!.profileImage!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text(
                                        cubit.profileModel!.user!.name!,
                                        style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cubit.profileModel!.user!.email!,
                                        style:const TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                  listener: (context, state) {},
                  builder: (context, state){
                    var cubit = AppUiCubit.get(context);
                    if(cubit.settingTitleIndex==0) {
                      return buildGeneralItems(context);
                    } else if(cubit.settingTitleIndex==1){
                    return buildPaymentComponent(context);
                    }else{
                      return buildNotfacitionItem(context);
                    }
                  }
                  )
                ]
                  ),
              ),
            )
          );
        }
    );
  }
}
