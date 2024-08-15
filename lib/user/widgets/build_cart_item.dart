import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/icon_broken.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/models/cart_model.dart';

Widget buildCartItem(CartProducts cartProducts, context) => Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ElktraCubit.get(context).dark
              ? HexColor('0E2954')
              : HexColor('#FEFEFE')),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: double.infinity,
              width: 120,
              decoration: BoxDecoration(
                color: ElktraCubit.get(context).dark
                    ? AppColorsDarkTheme.defaultColor.withOpacity(0.3)
                    : HexColor('#535482'),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(
                image: NetworkImage(cartProducts.image!),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Text(
                            cartProducts.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor,
                                fontSize: AppFontsSize.fontSize18),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              CartCubit.get(context)
                                  .deleteFromCart(cartProducts.sId!);
                              showToast('Deleted', ToastStates.ERROR);
                            },
                            child: Icon(IconBroken.Delete,
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      cartProducts.company!,
                      style: TextStyle(
                          color: ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.whiteColor
                              : AppColorsLightTheme.defaultColor,
                          fontSize: AppFontsSize.fontSize15),
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              cartProducts.quantity == 1
                                  ? null
                                  : CartCubit.get(context).updateQuantity(
                                      cartProducts.sId,
                                      --cartProducts.quantity);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ElktraCubit.get(context).dark
                                      ? cartProducts.quantity != 1
                                          ? AppColorsDarkTheme.defaultColor
                                          : AppColorsDarkTheme.defaultColor
                                              .withOpacity(0.4)
                                      : cartProducts.quantity != 1
                                          ? AppColorsLightTheme.defaultColor
                                          : AppColorsLightTheme.defaultColor
                                              .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(3)),
                              height: 26,
                              width: 26,
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${cartProducts.quantity!}',
                            style: TextStyle(
                              fontSize: AppFontsSize.fontSize18,
                              fontWeight: FontWeight.w500,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              CartCubit.get(context)
                                  .addToMyCart(cartProducts.sId);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.defaultColor
                                      : AppColorsLightTheme.defaultColor,
                                  borderRadius: BorderRadius.circular(3)),
                              height: 26,
                              width: 26,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$ ${cartProducts.totalPrice!.round()}',
                            style: TextStyle(
                              fontSize: AppFontsSize.fontSize18,
                              fontWeight: FontWeight.w500,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
