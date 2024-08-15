import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;

import 'package:ek/core/mangers/colors.dart';
class MyPainterSettingUnSelectedLightTheme extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = ui.Gradient.linear(
          const Offset(0, 0), Offset(0, size.height), [
        HexColor('#0E0F31').withOpacity(0.2),
        HexColor('#662C95').withOpacity(.2),
      ]);
    final path = Path()
      ..lineTo(size.width * 0.3, 0)..lineTo(15, size.height)..lineTo(
          0, size.height);
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class MyPainterGeneralSettingLightTheme extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = ui.Gradient.linear(
          const Offset(0, 0), Offset(0, size.height), [
        HexColor('#0E0F31').withOpacity(0.2),
        HexColor('#662C95').withOpacity(.2),
      ]);
    final path = Path()
      ..lineTo(size.width * 0.12, 0)..lineTo(15, size.height)..lineTo(
          0, size.height);
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class MyPainterGeneralSettingDarkTheme extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = ui.Gradient.linear(
          const Offset(0, 0), Offset(0, size.height), [
        AppColorsDarkTheme.defaultColor.withOpacity(0.2),
        HexColor('#0E0F31').withOpacity(.2),
      ]);
    final path = Path()
      ..lineTo(size.width * 0.12, 0)..lineTo(15, size.height)..lineTo(
          0, size.height);
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class MyPainterSettingSelectedLightTheme extends CustomPainter{
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..shader=ui.Gradient.linear(const Offset(0,0),Offset(0,size.height), [
      HexColor('#07094D'),
      HexColor('#101237'),
    ]);

    final path = Path()
      ..lineTo(size.width * 0.3, 0)..lineTo(15, size.height)..lineTo(0, size.height);
    canvas.drawPath(path, paint1);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class MyPainterSettingUnSelectedDarkTheme extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = ui.Gradient.linear(
          const Offset(0, 0), Offset(0, size.height), [
        AppColorsDarkTheme.defaultColor.withOpacity(0.2),
        HexColor('#662C95').withOpacity(.2),
      ]);
    final path = Path()
      ..lineTo(size.width * 0.3, 0)..lineTo(15, size.height)..lineTo(
          0, size.height);
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class MyPainterSettingSelectedDarkTheme extends CustomPainter{
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..shader=ui.Gradient.linear(const Offset(0,0),Offset(0,size.height), [
      AppColorsDarkTheme.defaultColor,
      Colors.teal,
    ]);

    final path = Path()
      ..lineTo(size.width * 0.3, 0)..lineTo(15, size.height)..lineTo(0, size.height);
    canvas.drawPath(path, paint1);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


