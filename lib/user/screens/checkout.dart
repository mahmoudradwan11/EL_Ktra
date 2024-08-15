import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/icon_broken.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/payment/payment_cubit/payment_cubit.dart';
import 'package:ek/core/user_controller/db_cubit/db_cubit.dart';
import 'package:ek/core/user_controller/db_cubit/db_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/text_form_feild.dart';
import 'package:slide_action/slide_action.dart';

class CheckOutScreen extends StatelessWidget {
  var addressController = TextEditingController();
  var total;
  var subtotal;
  var itemCount;
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var paymentMethodController = TextEditingController();
  var cardNumberController = TextEditingController();
  var cvvController = TextEditingController();
  var expiryController = TextEditingController();
  CheckOutScreen(
      {Key? key,
      required this.total,
      required this.subtotal,
      required this.itemCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseStates>(
        listener: (context, state) {
      if (state is InsertDatabaseState) {
        if (DatabaseCubit.get(context).paymentSelected == 'Visa') {
          print(firstNameController.text);
          print(lastNameController.text);
          print(emailController.text);
          print(phoneController.text);
          print(total.toString());
          PaymentCubit.get(context).getOrderId(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              email: emailController.text,
              price: total.toString(),
              phone: phoneController.text,
              context: context);
        }
      }
    }, builder: (context, state) {
      var cubit = DatabaseCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Checkout',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: ElktraCubit.get(context).dark
              ? AppColorsDarkTheme.defaultColor
              : AppColorsLightTheme.defaultColor,
          leading: const Icon(
            Icons.abc,
            color: Colors.transparent,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Details',
                  style: TextStyle(
                      color: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.whiteColor
                          : AppColorsLightTheme.blackColor,
                      fontSize: AppFontsSize.fontSize20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultFieldForm(
                  label: 'Address',
                  controller: addressController,
                  keyboard: TextInputType.text,
                  valid: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Address';
                    }
                    return null;
                  },
                  prefix: IconBroken.Home,
                  hint: 'Address',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(
                      color: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.defaultColor
                          : AppColorsLightTheme.defaultColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultFieldForm(
                  label: 'Phone',
                  controller: phoneController,
                  keyboard: TextInputType.phone,
                  valid: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Phone';
                    }
                    return null;
                  },
                  prefix: IconBroken.Call,
                  hint: 'Phone',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(
                      color: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.defaultColor
                          : AppColorsLightTheme.defaultColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DefaultFieldForm(
                        label: 'First Name',
                        controller: firstNameController,
                        keyboard: TextInputType.name,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        prefix: Icons.person,
                        hint: 'First Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DefaultFieldForm(
                        label: 'Last Name',
                        controller: lastNameController,
                        keyboard: TextInputType.name,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        prefix: Icons.person,
                        hint: 'Last Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultFieldForm(
                  label: 'Email',
                  controller: emailController,
                  keyboard: TextInputType.emailAddress,
                  valid: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your email';
                    }
                    return null;
                  },
                  prefix: Icons.email,
                  hint: 'Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(
                      color: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.defaultColor
                          : AppColorsLightTheme.defaultColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Payment Details',
                  style: TextStyle(
                      color: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.whiteColor
                          : AppColorsLightTheme.blackColor,
                      fontSize: AppFontsSize.fontSize20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(
                          color: ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.whiteColor
                              : AppColorsLightTheme.blackColor),
                    ),
                    Spacer(),
                    Container(
                      height: 50,
                      width: 100,
                      color: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.scaffoldBackGroundColor
                          : AppColorsLightTheme.scaffoldBackGroundColor,
                      child: DropdownButton(
                        dropdownColor: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.greyColor),
                        items: ["Cash", "Visa"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          cubit.selectedPayment(value);
                        },
                        value: cubit.paymentSelected,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (cubit.paymentSelected == 'Visa')
                  DefaultFieldForm(
                    label: 'Card Number',
                    controller: cardNumberController,
                    keyboard: TextInputType.number,
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your cardNo';
                      }
                      return null;
                    },
                    prefix: Icons.payment,
                    hint: 'Payment',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor),
                  ),
                const SizedBox(
                  height: 15,
                ),
                if (cubit.paymentSelected == 'Visa')
                  Row(
                    children: [
                      Expanded(
                        child: DefaultFieldForm(
                          label: 'CVV',
                          controller: cvvController,
                          keyboard: TextInputType.name,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your CvvNo';
                            }
                            return null;
                          },
                          prefix: Icons.numbers,
                          hint: 'Cvv',
                          hintStyle: const TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (cubit.paymentSelected == 'Visa')
                        Expanded(
                          child: DefaultFieldForm(
                            label: 'Expiry',
                            controller: expiryController,
                            keyboard: TextInputType.text,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Expiry';
                              }
                              return null;
                            },
                            prefix: Icons.numbers,
                            hint: 'Expiry',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelStyle: TextStyle(
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.defaultColor
                                    : AppColorsLightTheme.defaultColor),
                          ),
                        ),
                    ],
                  ),
                SizedBox(height: 100),
                Padding(
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
                            state.isPerformingAction
                                ? "Loading..."
                                : "Slide to Confirm",
                          ),
                        ),
                      );
                    },
                    thumbBuilder: (context, state) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: ElktraCubit.get(context).dark
                              ? AppColorsDarkTheme.defaultColor
                              : AppColorsLightTheme.defaultColor,
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
                          () => cubit.insertOrder(
                                address: addressController.text,
                                date: DateFormat('dd / MM / yyyy')
                                    .format(DateTime.now())
                                    .toString(),
                                phone: phoneController.text,
                                cardNumber: cubit.paymentSelected == "Visa"
                                    ? cardNumberController.text
                                    : 'No Number',
                                expiry: cubit.paymentSelected == "Visa"
                                    ? expiryController.text
                                    : 'No Number',
                                cvv: cubit.paymentSelected == "Visa"
                                    ? cvvController.text
                                    : 'No Number',
                                itemsCount: itemCount.toString(),
                                total: total.toString(),
                                subTotal: subtotal.toString(),
                              ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
