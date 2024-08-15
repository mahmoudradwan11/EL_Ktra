import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildCateItem(CategoryModel categoryModel, index, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          AppUiCubit.get(context).changeCate(index);
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: AppUiCubit.get(context).chooseColor(index, context),
              borderRadius: BorderRadius.circular(12)),
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    color: ElktraCubit.get(context).dark
                        ? AppUiCubit.get(context).categoryIndex == index
                            ?HexColor('2E8A99')
                            : Colors.transparent
                        : AppUiCubit.get(context).categoryIndex == index
                            ? HexColor('#6365A4')
                            : Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image(
                        image: AssetImage(categoryModel.image),
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(categoryModel.title,
                            style: TextStyle(
                                color: AppUiCubit.get(context).categoryIndex ==
                                        index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15)),
                        const SizedBox(
                          height: 3,
                        ),
                        if(categoryModel.title=='Laptop')
                        Text(
                          '${ElktraCubit.get(context).homeLaptops!.allProduct!.length} product',
                          style: TextStyle(
                            color:
                                AppUiCubit.get(context).categoryIndex == index
                                    ? Colors.white
                                    : HexColor('#5C5C5D'),
                          ),
                        ),
                        if(categoryModel.title=='Smart phone')
                          Text(
                            '${ElktraCubit.get(context).homeSmartPhone!.allProduct!.length} product',
                            style: TextStyle(
                              color:
                              AppUiCubit.get(context).categoryIndex == index
                                  ? Colors.white
                                  : HexColor('#5C5C5D'),
                            ),
                          ),
                        if(categoryModel.title=='Smart watch')
                          Text(
                            '${ElktraCubit.get(context).homeSmartWatch!.product!.length} product ',
                            style: TextStyle(
                              color:
                              AppUiCubit.get(context).categoryIndex == index
                                  ? Colors.white
                                  : HexColor('#5C5C5D'),
                            ),
                          ),
                        if(categoryModel.title=='Smart Tvs')
                          Text(
                            '${ElktraCubit.get(context).homeTVS!.allProduct!.length} product ',
                            style: TextStyle(
                              color:
                              AppUiCubit.get(context).categoryIndex == index
                                  ? Colors.white
                                  : HexColor('#5C5C5D'),
                            ),
                          ),
                        if(categoryModel.title=='Accessories')
                          Text(
                            '${ElktraCubit.get(context).homeAccessories!.product!.length} product',
                            style: TextStyle(
                              color:
                              AppUiCubit.get(context).categoryIndex == index
                                  ? Colors.white
                                  : HexColor('#5C5C5D'),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
