import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/db_cubit/db_cubit.dart';
import 'package:ek/core/user_controller/db_cubit/db_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';

class OrderDetails extends StatelessWidget {
  Map order;
  OrderDetails({Key? key, required this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ElktraCubit.get(context).dark
              ? AppColorsDarkTheme.scaffoldBackGroundColor
              : AppColorsLightTheme.scaffoldBackGroundColor,
          appBar: AppBar(
            title: const Text(
              'Order Detials',
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
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.whiteColor
                            : AppColorsLightTheme.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppFontsSize.fontSize25),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'SHOP TO',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.whiteColor
                            : AppColorsLightTheme.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'MY HOME',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                   order['address'],
                    style:const TextStyle(
                        color: AppColorsLightTheme.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'PHONE',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    order['phone'],
                    style:const TextStyle(
                        color: AppColorsLightTheme.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'ORDER DATE',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    order['date'],
                    style:const TextStyle(
                        color: AppColorsLightTheme.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'ORDER STATUS',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (order['date'] ==
                      DateFormat('dd / MM / yyyy').format(DateTime.now()))
                    Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Waiting',
                            style: TextStyle(
                                color: AppColorsDarkTheme.whiteColor),
                          ),
                        )),
                  if (order['date'] !=
                      DateFormat('dd / MM / yyyy').format(DateTime.now()))
                    Container(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Delivered',
                            style: TextStyle(
                                color: AppColorsDarkTheme.whiteColor),
                          ),
                        )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColorsLightTheme.greyColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'PAYMENT',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.whiteColor
                            : AppColorsLightTheme.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'PAYMENT METHOD',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    order['paymentMethod'],
                    style:const TextStyle(
                        color: AppColorsLightTheme.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'CARD NO',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    order['cardNo'],
                    style:const TextStyle(
                        color:AppColorsLightTheme.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'CVV',
                    style:TextStyle(
                        color:ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    order['cvv'],
                    style:const TextStyle(
                        color:AppColorsLightTheme.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'EXPIRY',
                    style:TextStyle(
                        color:ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    order['expiry'],
                    style:const TextStyle(
                        color:AppColorsLightTheme.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColorsLightTheme.greyColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'SUBTOTAL',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.whiteColor
                            : AppColorsLightTheme.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontsSize.fontSize20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Items Count',
                        style:TextStyle(
                            color:AppColorsLightTheme.greyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize18),
                      ),
                      Spacer(),
                      Text(
                        order['itemsCount'],
                        style:TextStyle(
                            color:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Discount',
                        style:TextStyle(
                            color:AppColorsLightTheme.greyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize18),
                      ),
                      const Spacer(),
                      Text(
                        '10',
                        style:TextStyle(
                            color:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'sub total',
                        style:TextStyle(
                            color:AppColorsLightTheme.greyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize18),
                      ),
                      Spacer(),
                      Text(
                        order['subTotal'],
                        style:TextStyle(
                            color:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColorsLightTheme.greyColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'TOTAL',
                        style:TextStyle(
                            color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize30),
                      ),
                      Spacer(),
                      Text(
                        order['total'],
                        style:TextStyle(
                            color:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize18),
                      ),
                    ],
                  ),



                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
