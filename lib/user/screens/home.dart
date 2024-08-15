import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:ek/core/lists/user_home_screens.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElktraCubit, ElktraStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElktraCubit.get(context);
          return Scaffold(
            body: userHomeScreens[cubit.currentHomeScreenIndex],
            bottomNavigationBar: SnakeNavigationBar.color(
              backgroundColor:cubit.dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
              snakeViewColor: Colors.white,
              selectedItemColor:cubit.dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
              unselectedItemColor:Colors.white,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              currentIndex: cubit.currentHomeScreenIndex,
              onTap: (index) {
                cubit.changeUserHomeScreen(index);
              },
              items: bottomNavBarTabs
            ),
          );
        });
  }
}
/*
 bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor: snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,

        ///configuration for SnakeNavigationBar.gradient
        //snakeViewGradient: selectedGradient,
        //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'tickets'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.calendar), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.podcasts), label: 'microphone'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.search), label: 'search')
        ],
      ),
 */
/*
Padding(
              padding: const EdgeInsets.only(
                  left: 5, right: 5, bottom: 10, top: 8),
              child: GNav(
                tabBorderRadius:23,
                gap: 7,
                backgroundColor: Colors.transparent,
                color: Colors.white,
                activeColor:cubit.dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                tabBackgroundColor: Colors.white,
                onTabChange: (index) {
                  cubit.changeUserHomeScreen(index);
                },
                padding: const EdgeInsets.only(left: 13,bottom: 6,right: 13,top: 6),
                tabs:bottomBavBarTabs,
              ),
            ),
 */