import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:ek/user/widgets/product_item.dart';

class SellersScreen extends StatelessWidget {
  SellersScreen({Key? key, this.image, this.name}) : super(key: key);
  var image;
  var name;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElktraCubit, ElktraStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElktraCubit.get(context);
          if (cubit.sellersModel == null) {
            return Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/images/setting_icon.svg',
                      height: 31,
                    ),
                  ),
                ),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/images/setting_icon.svg',
                    height: 31,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          image: NetworkImage(image),
                        )),
                  ),
                  if (cubit.topSellerModel!.topSellingCompany![0].sId ==
                      '$name')
                    const SizedBox(
                      height: 10,
                    ),
                  if (cubit.topSellerModel!.topSellingCompany![0].sId ==
                      '$name')
                    SvgPicture.asset('assets/images/top_seller.svg'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$name Official Store',
                    style:  TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600,
                    color:cubit.dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.defaultColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var cubit = AppUiCubit.get(context);
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 10, right: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    cubit.changeProductSellerView(0);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: cubit.sellerTitleIndex == 0
                                            ? const Border()
                                            : null,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Products',
                                            style: TextStyle(
                                                color:
                                                    cubit.settingTitleIndex == 0?
                                                ElktraCubit.get(context).dark ? AppColorsDarkTheme.defaultColor : AppColorsLightTheme.defaultColor
                                              : ElktraCubit.get(context).dark
                                          ? AppColorsDarkTheme.whiteColor.withOpacity(0.3)
                                          : AppColorsLightTheme.blackColor.withOpacity(0.3),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 1,
                                            width: 55,
                                            color: cubit.sellerTitleIndex == 0
                                                ? HexColor('#07094D')
                                                : Colors.transparent,
                                          )
                                        ],
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    cubit.changeProductSellerView(1);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: cubit.sellerTitleIndex == 1
                                            ? const Border()
                                            : null,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Newest',
                                            style: TextStyle(
                                                color:
                                                    cubit.sellerTitleIndex == 1
                                                        ? ElktraCubit.get(context).dark
                                                        ? AppColorsDarkTheme.defaultColor
                                                        : AppColorsLightTheme.defaultColor
                                                        : ElktraCubit.get(context).dark
                                                        ? AppColorsDarkTheme.whiteColor.withOpacity(0.3)
                                                        : AppColorsLightTheme.blackColor.withOpacity(0.3),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 1,
                                            width: 50,
                                            color: cubit.sellerTitleIndex == 1
                                                ? HexColor('#07094D')
                                                : Colors.transparent,
                                          )
                                        ],
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    cubit.changeProductSellerView(2);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: cubit.sellerTitleIndex == 2
                                            ? const Border()
                                            : null,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Popular',
                                            style: TextStyle(
                                                color:
                                                    cubit.sellerTitleIndex == 2
                                                        ? ElktraCubit.get(context).dark
                                                        ? AppColorsDarkTheme.defaultColor
                                                        : AppColorsLightTheme.defaultColor
                                                        : ElktraCubit.get(context).dark
                                                        ? AppColorsDarkTheme.whiteColor.withOpacity(0.3)
                                                        : AppColorsLightTheme.blackColor.withOpacity(0.3),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 1,
                                            width: 45,
                                            color: cubit.sellerTitleIndex == 2
                                                ? HexColor('#07094D')
                                                : Colors.transparent,
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var cubit = AppUiCubit.get(context);
                        return Column(
                          children: [
                            if (cubit.sellerTitleIndex == 0)
                              Container(
                                color: Colors.transparent,
                                child: GridView.count(
                                  childAspectRatio: 1 / 1.3,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  physics: const NeverScrollableScrolekhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  children: List.generate(
                                      ElktraCubit.get(context)
                                          .sellersModel!
                                          .alekroducts!
                                          .length,
                                      (index) => buildProductItem(
                                          ElktraCubit.get(context)
                                              .sellersModel!
                                              .alekroducts![index],
                                          context)),
                                ),
                              ),
                            if (cubit.sellerTitleIndex == 1)
                              Container(
                                color: Colors.transparent,
                                child: GridView.count(
                                  childAspectRatio: 1 / 1.3,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  physics: const NeverScrollableScrolekhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  children: List.generate(
                                      ElktraCubit.get(context)
                                          .sellersModel!
                                          .newProduct!
                                          .length,
                                      (index) => buildProductItem(
                                          ElktraCubit.get(context)
                                              .sellersModel!
                                              .newProduct![index],
                                          context)),
                                ),
                              ),
                            if (cubit.sellerTitleIndex == 2)
                              Container(
                                color: Colors.transparent,
                                child: GridView.count(
                                  childAspectRatio: 1 / 1.3,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  physics: const NeverScrollableScrolekhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  children: List.generate(
                                      ElktraCubit.get(context)
                                          .sellersModel!
                                          .usedProduct!
                                          .length,
                                      (index) => buildProductItem(
                                          ElktraCubit.get(context)
                                              .sellersModel!
                                              .usedProduct![index],
                                          context)),
                                ),
                              ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}
