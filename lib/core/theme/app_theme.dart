import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
appThemeData() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor,
      ),
      listTileTheme: const ListTileThemeData(
        horizontalTitleGap: 0.0,
      ),
      dialogBackgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
        // titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        // titleSpacing: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            // backgroundColor: AppColors.primaryColor,
            minimumSize: Size.fromHeight(54),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          )),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            minimumSize: Size.fromHeight(54),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          // surfaceTintColor:  AppColors.primaryColor,
          // overlayColor: AppColors.primaryColor,
          // shadowColor: AppColors.primaryColor,
          // disabledBackgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: Size.fromHeight(54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        )
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.shade200)
    // inputDecorationTheme: InputDecorationTheme(border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)))
  );
}