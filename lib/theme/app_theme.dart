import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData mainTheme() => ThemeData(
      appBarTheme: globalAppBarTheme(),
      elevatedButtonTheme: globalElevatedButtonStyle(),
      inputDecorationTheme: globalInputDecorationTheme(),
    );

InputDecorationTheme globalInputDecorationTheme() => InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    );

ElevatedButtonThemeData globalElevatedButtonStyle() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          backgroundColor: AppColor.kPrimaryColor,
          padding: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    );

AppBarTheme globalAppBarTheme() => const AppBarTheme(
    backgroundColor: AppColor.kWhiteColor,
    iconTheme: IconThemeData(color: AppColor.kBlackColor),
    titleTextStyle: TextStyle(color: AppColor.kTextColor),
    centerTitle: true,
    elevation: 0);
