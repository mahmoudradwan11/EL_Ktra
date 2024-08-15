import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/lists/category.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:ek/user/screens/search_screen.dart';
import 'package:ek/user/widgets/banner.dart';
import 'package:ek/user/widgets/category_item.dart';
import 'package:ek/user/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElktraCubit, ElktraStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElktraCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.appTitle.toUpperCase(),
                style: TextStyle(
                    color: cubit.dark
                        ? AppColorsDarkTheme.defaultColor
                        : AppColorsLightTheme.defaultColor),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        navigateToNextScreen(context,SearchScreen());
                      }, icon: const Icon(Icons.search_rounded)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    child: ElktraCubit.get(context).dark?const Icon(Icons.light):const Icon(Icons.dark_mode),
                    onTap: () {
                      ElktraCubit.get(context).changeAppMode();
                    },
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),),
                        height: 200,
                        child: buildBanner()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if(cubit.homeLaptops!=null)
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height:90,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => buildCateItem(
                                  categoryItems[index], index, context),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 5,
                              ),
                              itemCount: categoryItems.length,
                            ),
                          ),
                        );
                      }),
                  if(cubit.homeLaptops == null)
                   Center(
                  child: LoadingAnimationWidget.inkDrop(
                  color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                  size: 20
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(children: [
                      Text(
                        'Newest Products',
                        style: TextStyle(
                            color: cubit.dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor),
                      ),
                      const Spacer(),
                    ]),
                  ),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 0
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if(ElktraCubit.get(context).homeLaptops==null){
                                    return Center(
                                      child: LoadingAnimationWidget.inkDrop(
                                        color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                        size: 20
                                      ),
                                    );
                                        }
                                  else {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 250,
                                            child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    buildProductItem(
                                                        cubit.homeLaptops!
                                                            .newProduct![index],
                                                        context),
                                                separatorBuilder: (context,
                                                        index) =>
                                                    Container(
                                                      height: 200,
                                                      width: 10,
                                                      color: Colors.transparent,
                                                    ),
                                                itemCount: cubit.homeLaptops!
                                                    .newProduct!.length),
                                          ),
                                        ],
                                      ));
                                  }
                                })
                            : Container();
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 1
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if(ElktraCubit.get(context).homeSmartPhone==null){
                                return Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                      color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                      size: 20
                                  ),
                                );
                              }
                              else {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          child: ListView.separated(
                                              scrollDirection:
                                              Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  buildProductItem(
                                                      cubit.homeSmartPhone!
                                                          .newProduct![index],
                                                      context),
                                              separatorBuilder: (context,
                                                  index) =>
                                                  Container(
                                                    height: 200,
                                                    width: 10,
                                                    color: Colors.transparent,
                                                  ),
                                              itemCount: cubit.homeSmartPhone!
                                                  .newProduct!.length),
                                        ),
                                      ],
                                    ));
                              }
                            })
                            : Container();
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 2
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if(ElktraCubit.get(context).homeSmartWatch==null){
                                return Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                      color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                      size: 20
                                  ),
                                );
                              }
                              else {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          child: ListView.separated(
                                              scrollDirection:
                                              Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  buildProductItem(
                                                      cubit.homeSmartWatch!
                                                          .product![index],
                                                      context),
                                              separatorBuilder: (context,
                                                  index) =>
                                                  Container(
                                                    height: 200,
                                                    width: 10,
                                                    color: Colors.transparent,
                                                  ),
                                              itemCount: cubit.homeSmartWatch!
                                                  .product!.length),
                                        ),
                                      ],
                                    ));
                              }
                            })
                            : Container();
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 3
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if(ElktraCubit.get(context).homeTVS==null){
                                return Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                      color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                      size: 20
                                  ),
                                );
                              }
                              else {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          child: ListView.separated(
                                              scrollDirection:
                                              Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  buildProductItem(
                                                      cubit.homeTVS!
                                                          .newProduct![index],
                                                      context),
                                              separatorBuilder: (context,
                                                  index) =>
                                                  Container(
                                                    height: 200,
                                                    width: 10,
                                                    color: Colors.transparent,
                                                  ),
                                              itemCount: cubit.homeTVS!
                                                  .newProduct!.length),
                                        ),
                                      ],
                                    ));
                              }
                            })
                            : Container();
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 4
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if(ElktraCubit.get(context).homeAccessories==null){
                                return Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                      color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                      size: 20
                                  ),
                                );
                              }
                              else {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          child: ListView.separated(
                                              scrollDirection:
                                              Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  buildProductItem(
                                                      cubit.homeAccessories!
                                                          .product![index],
                                                      context),
                                              separatorBuilder: (context,
                                                  index) =>
                                                  Container(
                                                    height: 200,
                                                    width: 10,
                                                    color: Colors.transparent,
                                                  ),
                                              itemCount: cubit.homeAccessories!
                                                  .product!.length),
                                        ),
                                      ],
                                    ));
                              }
                            })
                            : Container();
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 0
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if(ElktraCubit.get(context).homeLaptops==null){
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0),
                                          child: Row(children: [
                                            Text('Used Products',
                                                style: TextStyle(
                                                    color: cubit.dark
                                                        ? Colors.white
                                                        : AppColorsLightTheme
                                                        .defaultColor)),
                                          ]),
                                        ),
                                        Center(
                                          child: LoadingAnimationWidget.inkDrop(
                                              color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                              size: 20
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  else {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0),
                                          child: Row(children: [
                                            Text('Used Products',
                                                style: TextStyle(
                                                    color: cubit.dark
                                                        ? Colors.white
                                                        : AppColorsLightTheme
                                                        .defaultColor)),
                                          ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 250,
                                            child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    buildProductItem(
                                                        cubit.homeLaptops!
                                                            .usedProduct![index],
                                                        context),
                                                separatorBuilder:
                                                    (context, index) => Container(
                                                          height: 200,
                                                          width: 10,
                                                          color: Colors.transparent,
                                                        ),
                                                itemCount: cubit.homeLaptops!
                                                    .usedProduct!.length),
                                          )),
                                      ],
                                    );
                                  }
                                })
                            : Container();
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 1
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if(ElktraCubit.get(context).homeSmartPhone==null){
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0),
                                      child: Row(children: [
                                        Text('Used Products',
                                            style: TextStyle(
                                                color: cubit.dark
                                                    ? Colors.white
                                                    : AppColorsLightTheme
                                                    .defaultColor)),
                                      ]),
                                    ),
                                    Center(
                                      child: LoadingAnimationWidget.inkDrop(
                                          color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                          size: 20
                                      ),
                                    ),
                                  ],
                                );
                              }
                              else {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0),
                                      child: Row(children: [
                                        Text('Used Products',
                                            style: TextStyle(
                                                color: cubit.dark
                                                    ? Colors.white
                                                    : AppColorsLightTheme
                                                    .defaultColor)),
                                      ]),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 250,
                                          child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  buildProductItem(
                                                      cubit.homeSmartPhone!
                                                          .usedProduct![index],
                                                      context),
                                              separatorBuilder:
                                                  (context, index) => Container(
                                                height: 200,
                                                width: 10,
                                                color: Colors.transparent,
                                              ),
                                              itemCount: cubit.homeSmartPhone!
                                                  .usedProduct!.length),
                                        )),
                                  ],
                                );
                              }
                            })
                            : Container();
                      }),
                  BlocConsumer<AppUiCubit, AppUiStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AppUiCubit.get(context).categoryIndex == 3
                            ? BlocConsumer<ElktraCubit, ElktraStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if(ElktraCubit.get(context).homeTVS==null){
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0),
                                      child: Row(children: [
                                        Text('Used Products',
                                            style: TextStyle(
                                                color: cubit.dark
                                                    ? Colors.white
                                                    : AppColorsLightTheme
                                                    .defaultColor)),
                                      ]),
                                    ),
                                    Center(
                                      child: LoadingAnimationWidget.inkDrop(
                                          color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                          size: 20
                                      ),
                                    ),
                                  ],
                                );
                              }
                              else {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0),
                                      child: Row(children: [
                                        Text('Used Products',
                                            style: TextStyle(
                                                color: cubit.dark
                                                    ? Colors.white
                                                    : AppColorsLightTheme
                                                    .defaultColor)),
                                      ]),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 250,
                                          child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  buildProductItem(
                                                      cubit.homeTVS!
                                                          .usedProduct![index],
                                                      context),
                                              separatorBuilder:
                                                  (context, index) => Container(
                                                height: 200,
                                                width: 10,
                                                color: Colors.transparent,
                                              ),
                                              itemCount: cubit.homeTVS!
                                                  .usedProduct!.length),
                                        )),
                                  ],
                                );
                              }
                            })
                            : Container();
                      }),
                ],
              ),
            ),
          );
        });
  }
}
