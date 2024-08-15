import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/toast.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_heeker.dart';
import 'package:ek/core/user_controller/contact_cubit/contact_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:slide_action/slide_action.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactInitState());
  static ContactUsCubit get(context) => BlocProvider.of(context);
  void showAlert(context, no, text, title) {
    QuickAlert.show(
      context: context,
      type: no == 1 ? QuickAlertType.success : QuickAlertType.error,
      confirmBtnTextStyle: const TextStyle(color: Colors.white),
      confirmBtnColor: ElktraCubit.get(context).dark
          ? AppColorsDarkTheme.defaultColor
          : AppColorsLightTheme.defaultColor,
      barrierColor: Colors.transparent,
      title: title,
      text: text,
      headerBackgroundColor: ElktraCubit.get(context).dark
          ? AppColorsDarkTheme.defaultColor
          : AppColorsLightTheme.defaultColor,
    );
  }

  void sendReport(problem, context) {
    DioHeekerStore.postData(
        url: ApiConstants.sendContactApi,
        data: {"nationalId": nationalId, "problem": problem}).then((value) {
      emit(SendContactUs());
      showAlert(context, 1, 'Send', 'We Will Work On Your Complaint');
    }).catchError((error) {
      print(error.toString());
      emit(ErrorContactUs());
      showAlert(context, 2, 'Error Occur', 'Please Write Your Complaint');
    });
  }
}
