import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_states.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/icon_broken.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/setting/clip_path_setting_container.dart';
import 'package:ek/user/widgets/text_form_feild.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminUsersCubit, AdminUsersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AdminUsersCubit.get(context);
          var nameController = TextEditingController();
          var emailController = TextEditingController();
          var phoneController = TextEditingController();
          var model = cubit.profileModel;
          nameController.text = model!.user!.name!;
          emailController.text = model.user!.email!;
          phoneController.text = model.user!.phone!;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 275,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        buildClipEditProfileContainer(context),
                        Positioned(
                          top: 60,
                          left: 30,
                          child: InkWell(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: CircleAvatar(
                              radius: 68,
                              backgroundImage:cubit.profileModel!.user!.profileImage==null?const NetworkImage('https://th.bing.com/th/id/OIP.bbEC4zuJyYZq2FwlY1w1kAHaHa?pid=ImgDet&rs=1'):NetworkImage(cubit.profileModel!.user!.profileImage!)
                          ),
                        ),
                        const Positioned(
                            top: 50,
                            left: 80,
                            child: Text(
                              'Profile Setting',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Jannah',
                                  fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child:DefaultFieldForm(
                      controller: nameController,
                      keyboard: TextInputType.name,
                      valid: (value) {},
                      label: 'Name',
                      prefix: Icons.person,
                      hintStyle: const TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: DefaultFieldForm(
                      prefix: Icons.email,
                      controller: emailController,
                      keyboard: TextInputType.name,
                      valid: (value) {},
                      label: 'Email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: DefaultFieldForm(
                      labelStyle: TextStyle(color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                      controller: phoneController,
                      prefix: IconBroken.Call,
                      keyboard: TextInputType.phone,
                      valid: (value) {},
                      label: 'Phone',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 20),
                    child: DefaultButton(
                      buttonWidget: const Text(
                        'confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                      function: () {
                        cubit.update(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                        );
                        showToast('Update successfully',ToastStates.SUCCESS);
                      },
                      backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor),
                    ),
                ],
              ),
            ),
          );
        });
  }
}
