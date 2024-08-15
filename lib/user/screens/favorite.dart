import 'package:lottie/lottie.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/lottie.dart';
import 'package:ek/core/mangers/strings.dart';
import 'package:ek/core/user_controller/favorite_cubit/favorite_cubit.dart';
import 'package:ek/core/user_controller/favorite_cubit/favorite_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/build_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = FavoriteCubit.get(context);
          if (cubit.favoriteModel == null ||
              cubit.favoriteModel!.favoriteProducts!.isEmpty) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text(AppStrings.favoriteScreenTitle),
                  centerTitle: true,
                ),
                body: Center(
                  child: Lottie.asset(
                    AppLottieAssets.emptyFavoriteList,
                  ),
                ));
          } else {
            return Scaffold(
                backgroundColor: ElktraCubit.get(context).dark
                    ? AppColorsDarkTheme.scaffoldBackGroundColor
                    : AppColorsLightTheme.grey200,
                appBar: AppBar(
                  backgroundColor: ElktraCubit.get(context).dark
                      ? AppColorsDarkTheme.defaultColor
                      : AppColorsLightTheme.grey200,
                  title: const Text(AppStrings.favoriteScreenTitle),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Container(
                    color: Colors.transparent,
                    child: GridView.count(
                      childAspectRatio: 1 / 1.3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          cubit.favoriteModel!.favoriteProducts!.length,
                          (index) => buildFavoriteItem(
                              cubit.favoriteModel!.favoriteProducts![index],
                              context)),
                    ),
                  ),
                ));
          }
        });
  }
}
