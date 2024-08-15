import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/icon_broken.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/chat_Admin.dart';
import 'package:ek/user/screens/contact_us.dart';
import 'package:ek/user/screens/edit_profile.dart';
import 'package:ek/user/screens/order_screen.dart';
import 'package:ek/user/screens/policy.dart';
import 'package:ek/user/widgets/setting/setting_general_item.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:slide_action/slide_action.dart';

Widget buildGeneralItems(context) => Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'General',
          style: TextStyle(
              fontSize: 20,
              color: ElktraCubit.get(context).dark
                  ? AppColorsDarkTheme.whiteColor
                  : AppColorsLightTheme.blackColor),
        ),
        const SizedBox(
          height: 10,
        ),
        buildSettingGeneralItem(
            screen:EditProfile(),
            context: context,
            title: 'Profile Setting',
            icon: Icons.person,
            subtitle: AdminUsersCubit.get(context).profileModel!.user!.name!),
        const SizedBox(
          height: 15,
        ),
        buildSettingGeneralItem(
            screen: const Policy(),
            context: context,
            title: 'Privacy',
            icon: Icons.privacy_tip_outlined,
            subtitle: 'Terms,Privacy'),
        const SizedBox(
          height: 15,
        ),
        buildSettingGeneralItem(
            screen: ChatBetweenAdminAndUser(),
            context: context,
            title: 'Chat',
            icon: IconBroken.Chat,
            subtitle: 'chat with our'),
        const SizedBox(
          height: 15,
        ),
        buildSettingGeneralItem(
            screen: 'lds',
            title: 'Mode',
            subtitle: ElktraCubit.get(context).dark ? 'Dark' : "Light",
            icon: Icons.dark_mode,
            context: context),
        const SizedBox(
          height: 15,
        ),
        buildSettingGeneralItem(
            title: 'Orders History',
            subtitle: 'Orders',
            icon: Icons.payment,
            context: context,
            screen:const OrderScreen()),
        const SizedBox(
          height: 15,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                     navigateToNextScreen(context,ContactUsScreen());
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.defaultColor
                          : AppColorsLightTheme.defaultColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'Contact us',
                      style: TextStyle(
                          color: ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.whiteColor
                              : AppColorsLightTheme.scaffoldBackGroundColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    confirmBtnTextStyle: const TextStyle(color: Colors.white),
                    confirmBtnText: 'Cancel',
                    confirmBtnColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                    barrierColor: Colors.transparent,
                    title: 'Warning!',
                    text: 'Are you sure you want to logout?',
                    headerBackgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                    widget:Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SlideAction(
                        trackBuilder: (context, state) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                state.isPerformingAction ? "Loading..." : "Slide to logout",
                              ),
                            ),
                          );
                        },
                        thumbBuilder: (context, state) {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              // Show loading indicator if async operation is being performed
                              child: state.isPerformingAction
                                  ? const CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                                  : const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                        action: () async {
                          // Async operation
                          await Future.delayed(
                            const Duration(seconds: 2),
                                () => AdminUsersCubit.get(context).userLayout(context)
                          );
                        },
                      ),
                    )
                  );
                },
                child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        'SignOut',
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.scaffoldBackGroundColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(height: 50,),
      ]),
    );
