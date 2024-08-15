import 'package:ek/core/mangers/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerUserScreenLoading() {
  return Shimmer.fromColors(
      baseColor: AppColorsLightTheme.shimmerBaseColor,
      highlightColor: AppColorsLightTheme.shimmerLightColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30, // Adjust the size of the avatar
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(right:80),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 14,
                    ),
                  ),
              ],
            ),
                ))
          ],
        ),
      ));
}
