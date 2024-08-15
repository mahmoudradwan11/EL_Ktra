import 'package:ek/admin/models/users_model.dart';
import 'package:ek/admin/screens/chats.dart';
import 'package:ek/admin/screens/users.dart';
import 'package:ek/admin/widgets/build_user_profile_item.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_states.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
class UserProfileScreen extends StatelessWidget {
  User userModel;
  UserProfileScreen({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminUsersCubit, AdminUsersStates>(
        listener: (context, state) {
          if(state is DeleteUser){
            showToast('Deleted', ToastStates.SUCCESS);
            navigateAndFinishThisScreen(context,const UsersScreen());
          }
        },
        builder: (context, state) {
          var cubit = AdminUsersCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SvgPicture.asset(AppImages.userProfileImage),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: CircleAvatar(
                            radius: 68,
                            backgroundImage:
                                NetworkImage(userModel.profileImage!),
                          ),
                        ),
                        Positioned(
                            top: 55,
                            left: 30,
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(AppImages.backImage))),
                      ],
                    ),
                  ),
                  buildUserProfileItem('UserName', userModel.name!),
                  const SizedBox(
                    height: 1,
                  ),
                  buildUserProfileItem('EmailAddress', userModel.email!),
                  const SizedBox(
                    height: 1,
                  ),
                  buildUserProfileItem('UserPhone', '+2 ${userModel.phone!}'),
                  const SizedBox(
                    height: 1,
                  ),
                  buildUserProfileItem('National ID', userModel.nationalId!),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: AppColorsLightTheme.defaultColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: MaterialButton(
                                onPressed: () {
                                  navigateToNextScreen(context,ChatScreen(userModel: userModel));
                                },
                                child: const Text(
                                  'Chat',
                                  style: TextStyle(
                                      color: AppColorsLightTheme.scaffoldBackGroundColor,
                                      fontSize: AppFontsSize.fontSize18),
                                ),
                              )),
                          Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: AppColorsLightTheme.defaultColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: MaterialButton(
                                onPressed: () {
                                  cubit.deleteUser(userModel.email!);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: AppColorsLightTheme.scaffoldBackGroundColor,
                                      fontSize: AppFontsSize.fontSize18),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
