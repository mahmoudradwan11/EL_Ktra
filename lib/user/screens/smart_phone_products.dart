import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/lists/tapbar.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:ek/user/widgets/build_tapbar_item.dart';
import 'package:ek/user/widgets/product_item.dart';

class SmartPhonesProducts extends StatelessWidget {
  const SmartPhonesProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Phone'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          BlocConsumer<AppUiCubit,AppUiStates>(
            listener:(context,state){},
            builder:(context,state){
              return Container(
                height: 35,
                child: ListView.separated(
                  shrinkWrap:true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index)=>buildTapBar(tapBarTitles[index],index,context),
                  separatorBuilder:(context,index)=>const SizedBox(
                    width: 10,
                  ),
                  itemCount:tapBarTitles.length,
                ),
              );
            },
          ),
          BlocConsumer<AppUiCubit,AppUiStates>(
            listener:(context,state){},
            builder:(context,state){
              var cubit = AppUiCubit.get(context);
                  if(cubit.tapBarTitleIndex==0) {
                    return BlocConsumer<ElktraCubit,ElktraStates>(listener:(context,state){},
                      builder:(context,state){
                      var cubit = ElktraCubit.get(context);
                      return Container(
                        color: Colors.transparent,
                        child: GridView.count(
                          childAspectRatio: 1 / 1.3,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: List.generate(
                              cubit.homeSmartPhone!.allProduct!.length,
                                  (index) =>
                                  buildProductItem(cubit.homeSmartPhone!.allProduct![index],context)),
                        ),
                      );
                      },
                    );
                  }
              else if(cubit.tapBarTitleIndex==1) {
                return BlocConsumer<ElktraCubit,ElktraStates>(listener:(context,state){},
                  builder:(context,state){
                    var cubit = ElktraCubit.get(context);
                    return Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.homeSmartPhone!.newProduct!.length,
                                (index) =>
                                buildProductItem(cubit.homeSmartPhone!.newProduct![index],context)),
                      ),
                    );
                  },
                );
              }
              else{
                return BlocConsumer<ElktraCubit,ElktraStates>(listener:(context,state){},
                  builder:(context,state){
                    var cubit = ElktraCubit.get(context);
                    return Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.homeSmartPhone!.usedProduct!.length,
                                (index) =>
                                buildProductItem(cubit.homeSmartPhone!.usedProduct![index],context)),
                      ),
                    );
                  },
                );
              }

            },
          )
        ],
    ),
      ),
    );
  }
}
