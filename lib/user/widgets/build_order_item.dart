import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/order_detials.dart';
import 'package:ek/user/widgets/button.dart';

Widget buildOrderItem(Map order, context) => InkWell(
    onTap: () {
    },
    child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: ElktraCubit.get(context).dark
                ? AppColorsDarkTheme.defaultColor.withOpacity(0.8)
                : AppColorsLightTheme.defaultColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Order ID :',
                      style: TextStyle(color: AppColorsDarkTheme.whiteColor),
                    ),
                    const Spacer(),
                    Text(
                      order['id'].toString(),
                      style: TextStyle(color: AppColorsDarkTheme.whiteColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Customer ID :',
                      style: TextStyle(color: AppColorsDarkTheme.whiteColor),
                    ),
                    const Spacer(),
                    Text(
                      nationalId,
                      style: TextStyle(color: AppColorsDarkTheme.whiteColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Order Status :',
                      style: TextStyle(color: AppColorsDarkTheme.whiteColor),
                    ),
                    Spacer(),
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
                          ))

                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Total :',
                      style: TextStyle(color: AppColorsDarkTheme.whiteColor),
                    ),
                    const Spacer(),
                    Text(
                      order['total'],
                      style: TextStyle(color: AppColorsDarkTheme.whiteColor),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                DefaultButton(
                    buttonWidget:const Text(
                      'Check',
                      style: TextStyle(color: AppColorsLightTheme.blackColor),
                    ),
                    backgroundColor: Colors.white,
                    function: () {
                      navigateToNextScreen(context,OrderDetails(order: order));
                    })
              ],
            ),
          ),
        )));
