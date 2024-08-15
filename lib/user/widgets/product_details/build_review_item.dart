import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ek/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/icon_broken.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/review_cubit/review_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/models/review_model.dart';

Widget buildReviewItem(ReviewsItems reviewModel, context, id) => Card(
    margin: const EdgeInsets.symmetric(horizontal: 0.8),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 0.0,
    color: ElktraCubit.get(context).dark
        ? Colors.transparent
        : AppColorsLightTheme.scaffoldBackGroundColor,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage(reviewModel.user!.profileImage!),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '${reviewModel.user!.name}',
                            style: TextStyle(
                              height: 1.4,
                              fontWeight: FontWeight.w600,
                              fontSize: AppFontsSize.fontSize12,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.whiteColor
                                  : AppColorsLightTheme.blackColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            DateFormat('dd-MM-yyyy').format(
                                DateTime.tryParse(reviewModel.createdAt!)!),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        reviewModel.comment!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppFontsSize.fontSize12,
                          color: AppColorsLightTheme.greyColor,
                        ),
                      ),
                      if (reviewModel.rating == 5)
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.blackColor,
                            ),
                            Icon(Icons.star,
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.defaultColor
                                    : AppColorsLightTheme.defaultColor),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Spacer(),
                            if (reviewModel.user!.name ==
                                AdminUsersCubit.get(context)
                                    .profileModel!
                                    .user!
                                    .name!)
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: IconButton(
                                  onPressed: () {
                                    ReviewCubit.get(context)
                                        .deleteReview(reviewModel.sId, id);
                                  },
                                  icon: Icon(IconBroken.Delete,color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,),
                                ),
                              ),
                          ],
                        ),
                      if (reviewModel.rating < 5 && reviewModel.rating >= 4)
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.defaultColor
                                    : AppColorsLightTheme.defaultColor),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Spacer(),
                            if (reviewModel.user!.name ==
                                AdminUsersCubit.get(context)
                                    .profileModel!
                                    .user!
                                    .name!)
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: IconButton(
                                  onPressed: () {
                                    ReviewCubit.get(context)
                                        .deleteReview(reviewModel.sId, id);
                                  },
                                  icon: Icon(IconBroken.Delete,color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,),
                                ),
                              ),
                          ],
                        ),
                      if (reviewModel.rating < 4 && reviewModel.rating >= 3)
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Spacer(),
                            if (reviewModel.user!.name ==
                                AdminUsersCubit.get(context)
                                    .profileModel!
                                    .user!
                                    .name!)
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: IconButton(
                                  onPressed: () {
                                    ReviewCubit.get(context)
                                        .deleteReview(reviewModel.sId, id);
                                  },
                                  icon: Icon(IconBroken.Delete,color:  ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,),
                                ),
                              ),
                          ],
                        ),
                      if (reviewModel.rating < 3 && reviewModel.rating >= 2)
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            Spacer(),
                            if (reviewModel.user!.name ==
                                AdminUsersCubit.get(context)
                                    .profileModel!
                                    .user!
                                    .name!)
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: IconButton(
                                  onPressed: () {
                                    ReviewCubit.get(context)
                                        .deleteReview(reviewModel.sId, id);
                                  },
                                  icon: Icon(IconBroken.Delete,color:ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,),
                                ),
                              ),
                          ],
                        ),
                      if (reviewModel.rating < 2 && reviewModel.rating >= 1)
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                            ),
                            const Spacer(),
                            if (reviewModel.user!.name ==
                                AdminUsersCubit.get(context)
                                    .profileModel!
                                    .user!
                                    .name!)
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: IconButton(
                                  onPressed: () {
                                    ReviewCubit.get(context)
                                        .deleteReview(reviewModel.sId, id);
                                  },
                                  icon: Icon(IconBroken.Delete,color:ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.defaultColor,),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
    ));
