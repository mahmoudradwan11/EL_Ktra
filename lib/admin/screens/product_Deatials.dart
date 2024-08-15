import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/screens/seller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/images.dart';
import 'package:ek/core/mangers/lottie.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/favorite_cubit/favorite_cubit.dart';
import 'package:ek/core/user_controller/favorite_cubit/favorite_states.dart';
import 'package:ek/core/user_controller/review_cubit/review_cubit.dart';
import 'package:ek/core/user_controller/review_cubit/review_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/product_details/build_review_item.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/product_details/build_acc_specification.dart';
import 'package:ek/user/widgets/product_details/build_laptop_specification.dart';
import 'package:ek/user/widgets/product_details/build_phone_specification.dart';
import 'package:ek/user/widgets/product_details/build_tv_specifaction.dart';
import 'package:ek/user/widgets/product_details/build_watches_specification.dart';
import 'package:ek/user/widgets/product_details/product_details_view.dart';
import 'package:ek/user/widgets/text_form_feild.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsAdmin extends StatefulWidget {
  var model;
  var companyImage;

  ProductDetailsAdmin({Key? key, this.model, this.companyImage}) : super(key: key);

  @override
  State<ProductDetailsAdmin> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsAdmin> {
  double opacity = 0;

  var commentsController = TextEditingController();

  var rateController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  late PageController imagesController;
  @override
  void initState() {
    imagesController = PageController();
    Future.delayed(Duration.zero).then((value){
      setState(() {
        opacity=1;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            gradient: ElktraCubit.get(context).dark?
            LinearGradient(
                colors: [
                  HexColor('#000428'),
                  HexColor('#004e92').withOpacity(0.5),
                ]
            ):
            const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white
                ]
            )
        ),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppImages.backImage,
                        height: 40,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          widget.model.name,
                          style: TextStyle(
                              fontSize: AppFontsSize.fontSize18,
                              fontWeight: FontWeight.w600,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.blackColor),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: ElktraCubit.get(context).dark
                  ? Colors.transparent
                  : AppColorsDarkTheme.whiteColor,
              height: 300,
              child: PageView.builder(
                itemBuilder: (context, index) => Container(
                  //height: 100,
                  child: Image(
                    height: 100,
                    image: NetworkImage(widget.model!.images![index]),
                  ),
                ),
                itemCount: widget.model!.images!.length,
                controller: imagesController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      activeDotColor: ElktraCubit.get(context).dark
                          ? AppColorsDarkTheme.defaultColor
                          : AppColorsLightTheme.defaultColor,
                      dotWidth: 9,
                      dotColor: AppColorsLightTheme.greyColor
                    // strokeWidth: 5,
                  ),
                  controller: imagesController,
                  count: widget.model!.images!.length),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    '\$${widget.model.price.round()}',
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontsSize.fontSize20),
                  ),
                  const Text(
                    AppStrings.productVat,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontsSize.fontSize9),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Text(
                'Number in Stock : ${widget.model.countInStock}',
                style: TextStyle(
                    color: ElktraCubit.get(context).dark
                        ? AppColorsDarkTheme.whiteColor
                        : Colors.red,
                    fontSize: AppFontsSize.fontSize12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.productFree,
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontsSize.fontSize12),
                  ),
                  Text(
                    AppStrings.productOrder,
                    style: TextStyle(
                        color: ElktraCubit.get(context).dark
                            ? AppColorsDarkTheme.defaultColor
                            : AppColorsLightTheme.defaultColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontsSize.fontSize12),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ElktraCubit.get(context).dark
                        ? AppColorsDarkTheme.defaultColor
                        : HexColor('#E3E3E3'),
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.companyImage)))),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              ElktraCubit.get(context).getSellerProducts(widget.model.company!);
                              navigateToNextScreen(
                                  context,
                                  SellersScreen(
                                    name: widget.model.company,
                                    image: widget.companyImage,
                                  ));

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.model.company} ${AppStrings.storeName}',
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: AppColorsLightTheme.greyColor,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, right: 30, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.storeDescribe,
                            style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppFontsSize.fontSize12,
                            ),
                          ),
                          LinearPercentIndicator(
                            width: 140.0,
                            lineHeight: 4,
                            percent: widget.model.countInStock >= 10
                                ? 1.0
                                : (widget.model.countInStock * .10),
                            backgroundColor: HexColor('#D9D9D9'),
                            progressColor: HexColor('#00AC07'),
                          ),
                          Text(
                            '${widget.model.countInStock >= 10 ? 100 : widget.model.countInStock * 10}%',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AppFontsSize.fontSize10,
                              color: HexColor('#00AC07'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            BlocConsumer<AppUiCubit, AppUiStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = AppUiCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 10, right: 20, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BuildProductDetailsView(
                              flex: 1,
                              checkIndex: 0,
                              currentProductDetailsView:
                              cubit.productDetailsTitleIndex,
                              function: () {
                                cubit.changeProductDetailsView(0);
                              },
                              titleText: 'Overview',
                            ),
                            BuildProductDetailsView(
                              flex: 2,
                              checkIndex: 1,
                              currentProductDetailsView:
                              cubit.productDetailsTitleIndex,
                              function: () {
                                cubit.changeProductDetailsView(1);
                              },
                              titleText: 'Specification',
                            ),
                            BuildProductDetailsView(
                              flex: 1,
                              checkIndex: 2,
                              currentProductDetailsView:
                              cubit.productDetailsTitleIndex,
                              function: () {
                                cubit.changeProductDetailsView(2);
                              },
                              titleText: 'Reviews',
                            ),
                          ],
                        ),
                        if (cubit.productDetailsTitleIndex == 0)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 5, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Highlights',
                                  style: TextStyle(
                                      color: ElktraCubit.get(context).dark
                                          ? AppColorsDarkTheme.whiteColor
                                          : AppColorsLightTheme.blackColor,
                                      fontSize: AppFontsSize.fontSize12,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnimatedOpacity(
                                  opacity: opacity,
                                  curve: Curves.easeInOutSine,
                                  duration: const Duration(seconds: 3),
                                  child: Text(
                                    widget.model.description,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (cubit.productDetailsTitleIndex == 1)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 5, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Specification',
                                  style: TextStyle(
                                      color: ElktraCubit.get(context).dark
                                          ? AppColorsDarkTheme.whiteColor
                                          : AppColorsLightTheme.blackColor,
                                      fontSize: AppFontsSize.fontSize12,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                if (widget.model.category == 'Laptops')
                                  BuildLaptopsSpecifications(
                                    comapany: widget.model.company,
                                  ),
                                if (widget.model.category == 'Smart Phones')
                                  BuildPhonesSpecifications(
                                    comapany: widget.model.company,
                                  ),
                                if (widget.model.category == 'Smart Watches')
                                  BuildWatchesSpecifications(
                                    comapany: widget.model.company,
                                  ),
                                if (widget.model.category == 'Smart TVs')
                                  BuildTvsSpecifications(comapany: widget.model.company),
                                if (widget.model.category == 'PC and laptop accessories')
                                  BuildAccessoriesSpecifications(
                                      comapany: widget.model.company)
                              ],
                            ),
                          ),
                        if (cubit.productDetailsTitleIndex == 2)
                          BlocConsumer<ReviewCubit, ReviewStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              var cubit = ReviewCubit.get(context);
                              if (cubit.reviewModel == null ||
                                  cubit.reviewModel!.reviews!.isEmpty) {
                                return Center(
                                  child: Container(
                                      height: 300,
                                      width: double.infinity,
                                      child: Lottie.asset(
                                          AppLottieAssets.emptyReview)),
                                );
                              }
                              return Column(
                                children: [
                                  ListView.separated(
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          buildReviewItem(
                                              cubit.reviewModel!.reviews![index],
                                              context,
                                              widget.model.sId),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(),
                                      itemCount:
                                      cubit.reviewModel!.reviews!.length),
                                ],
                              );
                            },
                          ),
                        if (cubit.productDetailsTitleIndex == 2)
                          BlocConsumer<ReviewCubit, ReviewStates>(
                            listener: (context, state) {
                              if (state is AddReview) {
                                Navigator.pop(context);
                              }
                            },
                            builder: (context, state) {
                              var cubit = ReviewCubit.get(context);
                              return Padding(
                                padding:
                                const EdgeInsets.only(top: 20.0, left: 20.0),
                                child: DefaultButton(
                                    function: () {
                                      scaffoldKey.currentState!
                                          .showBottomSheet((context) => Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                            color:
                                            ElktraCubit.get(context)
                                                .dark
                                                ? HexColor('333739')
                                                : AppColorsLightTheme
                                                .grey200,
                                            borderRadius:
                                            BorderRadius.circular(
                                                10)),
                                        child: SingleChildScrollView(
                                            child: Form(
                                              key: formKey,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    10.0),
                                                child: Column(
                                                  children: [
                                                    DefaultFieldForm(
                                                      show: false,
                                                      controller:
                                                      commentsController,
                                                      hintStyle: TextStyle(
                                                          color: ElktraCubit.get(
                                                              context)
                                                              .dark
                                                              ? AppColorsDarkTheme
                                                              .defaultColor
                                                              : AppColorsLightTheme
                                                              .defaultColor),
                                                      labelStyle: TextStyle(
                                                          color: ElktraCubit.get(
                                                              context)
                                                              .dark
                                                              ? AppColorsDarkTheme
                                                              .defaultColor
                                                              : AppColorsLightTheme
                                                              .defaultColor),
                                                      keyboard:
                                                      TextInputType.text,
                                                      valid: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Comments Must Not Be Empty';
                                                        }
                                                        return null;
                                                      },
                                                      label: 'Comments',
                                                      prefix: Icons.comment,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    DefaultFieldForm(
                                                      show: false,
                                                      hintStyle: TextStyle(
                                                          color: ElktraCubit.get(
                                                              context)
                                                              .dark
                                                              ? AppColorsDarkTheme
                                                              .defaultColor
                                                              : AppColorsLightTheme
                                                              .defaultColor),
                                                      labelStyle: TextStyle(
                                                          color: ElktraCubit.get(
                                                              context)
                                                              .dark
                                                              ? AppColorsDarkTheme
                                                              .defaultColor
                                                              : AppColorsLightTheme
                                                              .defaultColor),
                                                      controller:
                                                      rateController,
                                                      keyboard: TextInputType
                                                          .number,
                                                      valid: (value) {
                                                        if (value.isEmpty) {
                                                          return 'rate Must Not Be Empty || More Than 5';
                                                        }
                                                        return null;
                                                      },
                                                      label: 'Rating',
                                                      prefix:
                                                      Icons.rate_review,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    DefaultButton(
                                                        buttonWidget:
                                                        const Text(
                                                          'Add Reviews',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                        ),
                                                        backgroundColor: ElktraCubit
                                                            .get(
                                                            context)
                                                            .dark
                                                            ? AppColorsDarkTheme
                                                            .defaultColor
                                                            : AppColorsLightTheme
                                                            .defaultColor,
                                                        function: () {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            cubit
                                                                .addReviewForSpecificationProduct(
                                                              productId:
                                                              widget.model.sId,
                                                              review:
                                                              commentsController
                                                                  .text,
                                                              rate:
                                                              rateController
                                                                  .text,
                                                            );
                                                            cubit
                                                                .getAllReviews(
                                                                widget.model
                                                                    .sId);
                                                          }
                                                        })
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ));
                                    },
                                    buttonWidget: const Text(
                                      'Add Review',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: ElktraCubit.get(context).dark
                                        ? AppColorsDarkTheme.defaultColor
                                        : AppColorsLightTheme.defaultColor),
                              );
                            },
                          )
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                  child:DefaultButton(
                    buttonWidget: const Text('Add To Cart',style: TextStyle(color: Colors.white),),
                    function:(){},
                  )
              ),
            ),
          ]
          ),
        ),
      ),
    );
  }
}