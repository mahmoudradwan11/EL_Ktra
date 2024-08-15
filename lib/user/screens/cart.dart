import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/lottie.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_cubit.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/screens/checkout.dart';
import 'package:ek/user/widgets/build_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          if (cubit.cartModel == null || cubit.cartModel!.products!.isEmpty||cubit.totalCart==null) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text(AppStrings.cardScreenTitle),
                  centerTitle: true,
                ),
                body: Center(
                  child: Lottie.asset(
                    AppLottieAssets.emptyCartList,
                  ),
                ));
          }
          return Scaffold(
            backgroundColor: ElktraCubit.get(context).dark
                ? AppColorsDarkTheme.scaffoldBackGroundColor
                : AppColorsLightTheme.grey200,
            appBar: AppBar(
              backgroundColor: ElktraCubit.get(context).dark
                  ? AppColorsDarkTheme.defaultColor
                  : AppColorsLightTheme.grey200,
              title: const Text(AppStrings.cardScreenTitle),
              centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cubit.cartModel!.products!.length} Items',
                      style: TextStyle(
                          color: ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.whiteColor
                              : AppColorsLightTheme.defaultColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (cubit.cartModel!.products!.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => buildCartItem(
                                cubit.cartModel!.products![index], context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 30,
                                ),
                            itemCount: cubit.cartModel!.products!.length),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary'.toUpperCase(),
                            style: TextStyle(
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor,
                                fontSize: AppFontsSize.fontSize20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 33,
                            child: Row(
                              children: [
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                    color: ElktraCubit.get(context).dark
                                        ? AppColorsDarkTheme.whiteColor
                                            .withOpacity(0.6)
                                        : AppColorsLightTheme.defaultColor,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '\$${cubit.totalCart!.totalPrice.round()}',
                                  style: TextStyle(
                                      color: ElktraCubit.get(context).dark
                                          ? AppColorsDarkTheme.whiteColor
                                              .withOpacity(0.6)
                                          : AppColorsLightTheme.defaultColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 32,
                            child: Row(
                              children: [
                                Text(
                                  'Shipping',
                                  style: TextStyle(
                                    color: ElktraCubit.get(context).dark
                                        ? AppColorsDarkTheme.whiteColor
                                            .withOpacity(0.6)
                                        : AppColorsLightTheme.defaultColor,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Free',
                                  style: TextStyle(
                                      color: ElktraCubit.get(context).dark
                                          ? AppColorsDarkTheme.whiteColor
                                              .withOpacity(0.6)
                                          : AppColorsLightTheme.defaultColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 33,
                            child: Row(
                              children: [
                                Text(
                                  'Discount',
                                  style: TextStyle(
                                    color: ElktraCubit.get(context).dark
                                        ? AppColorsDarkTheme.whiteColor
                                            .withOpacity(0.6)
                                        : AppColorsLightTheme.defaultColor,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '10',
                                  style: TextStyle(
                                      color: ElktraCubit.get(context).dark
                                          ? AppColorsDarkTheme.whiteColor
                                              .withOpacity(0.6)
                                          : AppColorsLightTheme.defaultColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 33,
                      child: Row(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor,
                                fontSize: AppFontsSize.fontSize20),
                          ),
                          const Spacer(),
                          Text(
                            '${cubit.totalCart!.totalPrice!.round() - 10}',
                            style: TextStyle(
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor,
                                fontWeight: FontWeight.w600,
                                fontSize: AppFontsSize.fontSize18),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: ElktraCubit.get(context).dark
                                ? LinearGradient(colors: [
                                    HexColor('#83c5be'),
                                    AppColorsDarkTheme.defaultColor,
                                  ])
                                : LinearGradient(colors: [
                                    AppColorsLightTheme.defaultColor,
                                    HexColor('#7F3BA8'),
                                  ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'data',
                              style: TextStyle(color: Colors.transparent),
                            ),
                            InkWell(
                                onTap: () {
                                    navigateToNextScreen(context,CheckOutScreen(itemCount: cubit.cartModel!.products!.length,
                                      total:cubit.totalCart!.totalPrice!.round() - 10,
                                      subtotal:cubit.totalCart!.totalPrice.round(),
                                    ));
                                   //navigateTo(context,(price:cubit.totalCart!.totaekrice.round()+10,));
                                },
                                child: const Text(
                                  'Checkout',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.defaultColor
                                      : AppColorsLightTheme.defaultColor,
                                  borderRadius: BorderRadius.circular(12)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ))
                  ],
                )),
          );
        });
  }
}
