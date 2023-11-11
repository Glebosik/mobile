import 'package:flutter/material.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/utils/text_styles.dart';

var borderWithoutBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      width: 0,
      color: MyColors.red.withAlpha(50),
    ));

final theme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    floatingLabelStyle: const TextStyle(color: MyColors.grayText),
    filled: true,
    fillColor: MyColors.red.withAlpha(50),
    focusColor: MyColors.grayText,
    enabledBorder: borderWithoutBorder,
    disabledBorder: borderWithoutBorder,
    focusedBorder: borderWithoutBorder,
    border: borderWithoutBorder,
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyles.black20,
    foregroundColor: MyColors.white,
    backgroundColor: Colors.transparent,
    shadowColor: MyColors.white,
    surfaceTintColor: MyColors.white,
    scrolledUnderElevation: 0,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: MyColors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  )),
);
