import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/user_controller/db_cubit/db_cubit.dart';
import 'package:ek/core/user_controller/db_cubit/db_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/build_order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit,DatabaseStates>(listener:(context,state){},
    builder:(context,state){
      var cubit = DatabaseCubit.get(context);
      return Scaffold(
        backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.scaffoldBackGroundColor:AppColorsLightTheme.scaffoldBackGroundColor,
        appBar: AppBar(
          title: const Text(
            'My Orders',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ElktraCubit.get(context).dark
              ? AppColorsDarkTheme.defaultColor
              : AppColorsLightTheme.defaultColor,
          leading: InkWell(
            onTap:(){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.separated(itemBuilder:(context,index)=>buildOrderItem(cubit.userOrders[index],context),
          separatorBuilder:(context,index)=>const SizedBox(
          height: 1,
      ),
          itemCount:cubit.userOrders.length
      ),
      );

    },
    );
  }
}
