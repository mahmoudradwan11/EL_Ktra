import 'package:cached_network_image/cached_network_image.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/cart_cubit/cart_cubit.dart';
import 'package:ek/core/user_controller/favorite_cubit/favorite_cubit.dart';
import 'package:ek/core/user_controller/review_cubit/review_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/user/screens/product_details.dart';
Widget buildProductItem(product,context) =>InkWell(
  onTap:(){
    if(product.company=='Dell'){
      companyImage = AppImages.dellCompanyImage;
    }
    if(product.company=='HP'){
      companyImage = AppImages.hpCompanyImage;
    }
    if(product.company=='Lenovo'){
      companyImage = AppImages.lenovoCompanyImage;
    }
    if(product.company=='Xiaomi'){
      companyImage = AppImages.xiaomiCompanyImage;
    }
    if(product.company=='Apple'){
      companyImage = AppImages.appleCompanyImage;
    }
    if(product.company=='Samsung'){
      companyImage = AppImages.samsungCompanyImage;
    }
    if(product.company=='Microsoft'){
      companyImage = AppImages.microsoftCompanyImage;
    }
    if(product.company=='LG'){
      companyImage = AppImages.lgCompanyImage;
    }
    if(product.company=='Huawei'){
      companyImage = AppImages.huaweiCompanyImage;
    }
   ReviewCubit.get(context).getAllReviews(product.sId);
   navigateToNextScreen(context,ProductDetails(model: product,companyImage: companyImage,));
  },
  child:  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        width: 180,
        height: 200,
        //color: Colors.green,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20))),
                      height: 125,
                      child: Center(
                        child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              product.status!,
                              style:const TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20)),
                            color: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor.withOpacity(0.6):AppColorsLightTheme.defaultColor.withOpacity(0.6),
                          ),
                          height: 125,
                          child: Padding(
                            padding:const EdgeInsets.only(right: 30, left: 10),
                            child: CachedNetworkImage(
                                imageUrl: product.image!,
                                imageBuilder: (context,imageProvider)=>Image(image: imageProvider),
                                placeholder:(context,url)=>const Center(child: CircularProgressIndicator(color: Colors.black,),),
                                errorWidget: (context,url,error){
                                  print(error.toString());
                                  return Center(child: CircularProgressIndicator(color: HexColor('#07094D'),),);
                                }
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            product.inFavorite?FavoriteCubit.get(context).deleteFavorite(product.sId,context):FavoriteCubit.get(context).addToMyFavorite(product.sId,context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundColor: HexColor('#BFC0E4'),
                              radius: 10,
                              child:Icon(
                                  Icons.favorite,
                                  size: 15,
                                  color:product.inFavorite?Colors.red:Colors.grey
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                product.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            if(product.status=='New')
                              Expanded(
                                child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: HexColor('#C70000'),
                                        borderRadius:
                                        const BorderRadius.horizontal(
                                            left: Radius.circular(20))),
                                    child: const Center(
                                        child: Text(
                                          '10% Off',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 8),
                                        ))),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:const EdgeInsets.only(left: 10.0),
                        child: Text(
                          product.company!,
                          style:const TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '\$${product.price}',
                              style:const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                          const Spacer(),
                          Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: MaterialButton(
                                onPressed: () {
                                  CartCubit.get(context).addToMyCart(product.sId);
                                  showToast('Added', ToastStates.SUCCESS);
                                 // ElWekalaCubit.get(context).addSales(product.sId);
                                },
                                child: Text(
                                  'Buy'.toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
  ),
);
