import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/lists/tapbar.dart';
import 'package:ek/core/mangers/icon_broken.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_cubit.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_states.dart';
import 'package:ek/core/user_controller/search_cubit/search_cubit.dart';
import 'package:ek/core/user_controller/search_cubit/search_states.dart';
import 'package:ek/user/screens/cart.dart';
import 'package:ek/user/widgets/build_tapbar_item.dart';
import 'package:ek/user/widgets/product_item.dart';
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title:const Text('Popular Product'),
                actions:[
                  BlocConsumer<CartCubit,CartStates>(
                    listener:(context,state){},
                    builder:(context,state){
                      var cubit = CartCubit.get(context);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                            onPressed: () {
                              navigateToNextScreen(context,const CartScreen());
                            },
                            icon: badges.Badge(
                              badgeAnimation: const badges.BadgeAnimation.slide(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              position:
                              badges.BadgePosition.topEnd(top: -15, end: -12),
                              badgeStyle: badges.BadgeStyle(
                                padding: const EdgeInsets.all(3),
                                borderRadius: BorderRadius.circular(4),
                                badgeColor: Colors.red,
                              ),
                              badgeContent: Text(
                                '${cubit.cartModel!.products!.length}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              child:
                              Icon(IconBroken.Bag_2,color: HexColor('#07094D'),),
                            )),
                      );
                    },
                  ),
                ]
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      child: Center(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              contentPadding:const EdgeInsets.all(20),
                              border: InputBorder.none,
                              hintText: 'Search in Products',
                          ),
                          /*
                      onSubmitted: (value) {
                        cubit.search(value);
                        navigateTo(context, const SearchScreen());

                       */
                          onChanged:(value){
                            cubit.searchProduct(keyword: value);
                          },
                        ),
                      ),
                    ),
                  ),
                  BlocConsumer<AppUiCubit,AppUiStates>(
                    listener:(context,state){},
                    builder:(context,state){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 35,
                          child: Row(
                            children: [
                              ListView.separated(
                                shrinkWrap:true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:(context,index)=>buildTapBar(tapBarTitles[index],index,context),
                                separatorBuilder:(context,index)=>const SizedBox(
                                  width: 10,
                                ),
                                itemCount:tapBarTitles.length,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  if(AppUiCubit.get(context).tapBarTitleIndex==0)
                    cubit.searchModel!.allProducts!.isEmpty?const Text('All'):Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.searchModel!.allProducts!.length,
                                (index) =>
                                buildProductItem(cubit.searchModel!
                                    .allProducts![index],context)),
                      ),
                    ),
                  if(AppUiCubit.get(context).tapBarTitleIndex==1)
                    Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.searchModel!.newProducts!.length,
                                (index) =>
                                buildProductItem(cubit.searchModel!
                                    .newProducts![index],context)),
                      ),
                    ),
                  if(AppUiCubit.get(context).tapBarTitleIndex==2)
                    Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.searchModel!.usedProducts!.length,
                                (index) =>
                                buildProductItem(cubit.searchModel!
                                    .usedProducts![index],context)),
                      ),
                    ),
                ],
              ),
            ),
          );
        }
    );
  }
}