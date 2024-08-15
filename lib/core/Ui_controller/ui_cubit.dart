import 'package:ek/core/Ui_controller/ui_states.dart';
import 'package:ek/core/lists/category.dart';
import 'package:ek/core/lists/setting.dart';
import 'package:ek/core/lists/tapbar.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/user/widgets/painter.dart';

class AppUiCubit extends Cubit<AppUiStates> {
  AppUiCubit() : super(AppUiInitState());
  static AppUiCubit get(context) => BlocProvider.of(context);
  int categoryIndex = 0;
  void changeCate(int cateIndex) {
    categoryIndex = cateIndex;
    print(categoryIndex);
    emit(ChangeCategoryIndex());
  }
  chooseColor(int index,context) {
    if (categoryItems[index].index == categoryIndex) {
      return ElktraCubit.get(context).dark?
          LinearGradient(colors:[
            HexColor('#006d77'),
            HexColor('#1F6E8C'),
          ]):
         LinearGradient(
          colors: [HexColor('#7832A3'), HexColor('##07094D')]);
    } else {
      return LinearGradient(colors: [
        HexColor('#E6E7E8'),
        HexColor('#E6E7E8'),
      ]);
    }
  }
  int settingTitleIndex = 0;
  CustomPainter chooseColorSetting(int index,context) {
    if (settingTitles[index].index == settingTitleIndex) {
      return ElktraCubit.get(context).dark?MyPainterSettingSelectedDarkTheme():MyPainterSettingSelectedLightTheme();
    } else {
      return ElktraCubit.get(context).dark?MyPainterSettingUnSelectedDarkTheme():MyPainterSettingUnSelectedLightTheme();
    }


  }
  void changeSetting(int settingIndex) {
    settingTitleIndex = settingIndex;
    print(settingTitleIndex);
    emit(ChangeSettingTitleIndex());
  }
  int productDetailsTitleIndex = 0;
  void changeProductDetailsView(int index) {
    productDetailsTitleIndex = index;
    emit(ChangeProductDetialsIndex());
  }
  int tapBarTitleIndex = 0;
  LinearGradient chooseColorTapBar(int index,context) {
    if (tapBarTitles[index].index == tapBarTitleIndex) {
      if(ElktraCubit.get(context).dark) {
        return LinearGradient(colors: [
          HexColor('#83c5be'),
          AppColorsDarkTheme.defaultColor,
        ]);
      }else{
        return LinearGradient(colors: [HexColor('#7832A3'),
    AppColorsLightTheme.defaultColor]);
      }
    } else {
      return LinearGradient(colors: [
        HexColor('#DBDBDB'),
        HexColor('#DBDBDB'),
      ]);
    }
  }
    void changeTapBarView(int tapIndex) {
      tapBarTitleIndex = tapIndex;
      print(tapBarTitleIndex);
      emit(ChangeTapBarTitleIndex());
    }
    int sellerTitleIndex = 0;
    void changeProductSellerView(int index) {
    sellerTitleIndex = index;
    emit(ChangeProductSellerIndex());
  }
}