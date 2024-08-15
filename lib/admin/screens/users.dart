import 'package:ek/admin/widgets/build_user_item.dart';
import 'package:ek/admin/widgets/shimmer_user.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget{
  const UsersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminUsersCubit,AdminUsersStates>(listener: (context, state) {},
      builder:(context,state){
      var cubit = AdminUsersCubit.get(context);
      if(cubit.usersModel==null){
        return Scaffold(appBar: AppBar(
        title:const Text('Users'),
        ),
          body: ListView.separated(
              itemBuilder:(context,index)=>getShimmerUserScreenLoading(),
              separatorBuilder:(context,index)=>Container(
                width: double.infinity,
                height: 1,
                color: Colors.transparent,
              ),
              itemCount:10
          ),
        );
      }
        return Scaffold(
          appBar: AppBar(
          title:const Text('Users'),
          ),
          body:ListView.separated(itemBuilder:(context,index)=>buildUserItem(cubit.usersModel!.user![index],context),
              separatorBuilder:(context,index)=>const SizedBox(
                height: 10,
              ),
              itemCount: cubit.usersModel!.user!.length),
        );
      },
    );
  }
}
