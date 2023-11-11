import 'package:flutter/material.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/gen/fonts.gen.dart';

abstract class TextStyles {
  TextStyles._();

  static TextStyle blue20 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w600,
      color: MyColors.blue,
      fontSize: 20);

  static TextStyle black20 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w600,
      color: MyColors.black,
      fontSize: 20);

  static TextStyle black20bold = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w700,
      color: MyColors.black,
      fontSize: 20);

  static TextStyle white18bold = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w700,
      color: MyColors.white,
      fontSize: 18);

  static TextStyle white18 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.white,
      fontSize: 18);

  static TextStyle white16 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.white,
      fontSize: 16);

  static TextStyle black16 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.black,
      fontSize: 16);

  static TextStyle gray16 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.grayText,
      fontSize: 18);

  static TextStyle red16 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.red,
      fontSize: 18);

  static TextStyle black16bold = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w700,
      color: MyColors.black,
      fontSize: 16);

  static TextStyle blue16bold = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w700,
      color: MyColors.blue,
      fontSize: 16);

  static TextStyle blue14 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.blue,
      fontSize: 14);

  static TextStyle black14 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.black,
      fontSize: 14);

  static TextStyle white14 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.white,
      fontSize: 14);

  static TextStyle white12 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.white,
      fontSize: 12);

  static TextStyle black12 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.black,
      fontSize: 12);

  static TextStyle black10 = const TextStyle(
      fontFamily: MyFonts.roboto,
      fontWeight: FontWeight.w500,
      color: MyColors.black,
      fontSize: 10);
}
