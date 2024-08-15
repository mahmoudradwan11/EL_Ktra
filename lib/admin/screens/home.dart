import 'package:hexcolor/hexcolor.dart';
import 'package:ek/admin/screens/add_product.dart';
import 'package:ek/admin/screens/product_screen.dart';
import 'package:ek/admin/screens/users.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_states.dart';
import 'package:ek/core/admin_controller/admin_version_cubit/admin_version_cubit.dart';
import 'package:ek/core/admin_controller/admin_version_cubit/admin_version_states.dart';
import 'package:ek/core/lists/companies.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/screens/seller.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminVersionCubit, AdminVersionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminVersionCubit.get(context);
        if (cubit.userModel == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator(
                color: AppColorsLightTheme.defaultColor,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
              title: const Text('DashBoard'),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<AdminUsersCubit, AdminUsersStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              AdminUsersCubit.get(context).userLayout(context);
                            },
                            icon: const Icon(Icons.logout));
                      }),
                ),
              ]),
          drawer: Drawer(
            backgroundColor:ElktraCubit.get(context).dark
                ? AppColorsDarkTheme.defaultColor
                : AppColorsLightTheme.defaultColor,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  arrowColor:ElktraCubit.get(context).dark
                ? AppColorsDarkTheme.defaultColor
                : AppColorsLightTheme.defaultColor,
                  accountName: Text('${cubit.userModel!.user!.name}'),
                  accountEmail: Text('${cubit.userModel!.user!.email}'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage('${cubit.userModel!.user!.profileImage}'),
                  ),
                ),
                ListTile(
                  title: const Text('Users',style: TextStyle(color: Colors.white),),
                  leading: const Icon(Icons.person,color: Colors.white,),
                  onTap: () {
                    navigateToNextScreen(context, const UsersScreen());
                  },
                ),
                ListTile(
                  title: const Text('AddProduct',style: TextStyle(color: Colors.white),),
                  leading: const Icon(Icons.add,color: Colors.white,),
                  onTap: () {
                    navigateToNextScreen(context, AddProductScreen());
                  },
                ),
                ListTile(
                  title: const Text('Alekroduct',style: TextStyle(color: Colors.white),),
                  leading: const Icon(Icons.production_quantity_limits,color: Colors.white,),
                  onTap: () {
                    navigateToNextScreen(context, const ProductsScreen());
                  },
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(

                gradient: ElktraCubit.get(context).dark
                    ? LinearGradient(colors: [
                        HexColor('#000428'),
                        HexColor('#004e92').withOpacity(0.5),
                      ])
                    : const LinearGradient(
                        colors: [Colors.white, Colors.white])),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Best Seller',
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontsSize.fontSize25),
                      ),
                    ),
                  BlocConsumer<ElktraCubit, ElktraStates>(
    listener: (context, state) {},
    builder: (context, state) {
      var cubit = ElktraCubit.get(context);
      return Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ElktraCubit.get(context).dark
                ? AppColorsDarkTheme.defaultColor
                : HexColor('#E3E3E3'),
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                image: NetworkImage(bestSellerImage)))),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      ElktraCubit.get(context).getSellerProducts(cubit.topSellerModel!.topSellingCompany![0].sId);
                      navigateToNextScreen(
                          context,
                          SellersScreen(
                            name:cubit.topSellerModel!.topSellingCompany![0].sId,
                            image:bestSellerImage,
                          ));

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.topSellerModel!.topSellingCompany![0].sId} ${AppStrings.storeName}',
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.blackColor,
                              fontSize: AppFontsSize.fontSize15,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          AppStrings.storeView,
                          style: TextStyle(
                              fontSize: AppFontsSize.fontSize10,
                              fontWeight: FontWeight.w600,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  .withOpacity(0.7)
                                  : AppColorsLightTheme.greyColor
                                  .withOpacity(0.7)),
                        ),

                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircularPercentIndicator(
                      radius: 35.0,
                      center:Text(
                        '${cubit.topSellerModel!.topSellingCompany![0].totalSales}',
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize15),
                      ),
                      animation: true,
                      animationDuration: 3000,
                      lineWidth: 10.0,
                      percent:0.88,
                      footer: Text(
                        'Total Sales',
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontsSize.fontSize15),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor:ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.defaultColor.withOpacity(0.9)
                          : AppColorsLightTheme.greyColor,
                      progressColor:ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.whiteColor
                          : AppColorsLightTheme.defaultColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Products Details',
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontsSize.fontSize25),
                      ),
                    ),
                    PieChart(
                      dataMap: companiesDetails,
                      animationDuration: const Duration(milliseconds: 3000),
                      chartLegendSpacing: 60,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: companiesColors,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 100,
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: true,
                        chartValueStyle: TextStyle(color: Colors.white),
                        decimalPlaces: 1,
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.all(20.0),
                      child: Text(
                        'Categories Details',
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontsSize.fontSize25),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: PieChart(
                        dataMap: categoriesDetails,
                        animationDuration: const Duration(milliseconds: 3000),
                        chartLegendSpacing: 100,
                        chartRadius: MediaQuery.of(context).size.width / 3,
                        colorList: categoriesColors,
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 100,
                        legendOptions:  LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor),
                        ),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValueBackground: false,
                          showChartValues: true,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: true,
                          chartValueStyle: TextStyle(color: Colors.white),
                          decimalPlaces: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:const EdgeInsets.all(20.0),
                      child: Text(
                        'Sales Details',
                        style: TextStyle(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontsSize.fontSize25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularPercentIndicator(
                            radius: 50.0,
                            center:Text(
                              '7',
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppFontsSize.fontSize15),
                            ),
                            animation: true,
                            animationDuration: 3000,
                            lineWidth: 10.0,
                            percent: .70,
                            footer: Text(
                              'Weakly',
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppFontsSize.fontSize15),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.greyColor,
                            progressColor:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                          ),
                          CircularPercentIndicator(
                            radius: 50.0,
                            center:Text(
                              '88',
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppFontsSize.fontSize15),
                            ),
                            animation: true,
                            animationDuration: 3000,
                            lineWidth: 10.0,
                            percent: .88,
                            footer: Text(
                              'Monthly',
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppFontsSize.fontSize15),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.greyColor,
                            progressColor:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                          ),
                          CircularPercentIndicator(
                            radius: 50.0,
                            center:Text(
                              '153',
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppFontsSize.fontSize15),
                            ),
                            animation: true,
                            animationDuration: 3000,
                            lineWidth: 10.0,
                            percent: .54,
                            footer: Text(
                              'yearly',
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppFontsSize.fontSize15),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.greyColor,
                            progressColor:ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.defaultColor
                                : AppColorsLightTheme.defaultColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
