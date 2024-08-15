import 'package:flutter/material.dart';
import 'package:ek/core/Ui_controller/ui_cubit.dart';
import 'package:ek/user/models/setting_model.dart';

Widget buildSettingItem(SettingModel settingModel, index, context) => InkWell(
  onTap: () {
    AppUiCubit.get(context).changeSetting(index);
  },
  child: Card(
    color: Colors.transparent,
    elevation: 5,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: index == 2 ? 150 : 130,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: CustomPaint(
            painter: AppUiCubit.get(context).chooseColorSetting(index,context),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        settingModel.icon,
                        color: Colors.black,
                        size: 20,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(settingModel.title!,style: TextStyle(fontWeight: FontWeight.w500),)
                ],
              ),
            )),
      ),
    ),
  ),
);
