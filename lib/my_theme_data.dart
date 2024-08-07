import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: AppColor.backgroundColorLight,
      appBarTheme: AppBarTheme(
        color: AppColor.primaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 30,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColor.blackLightColor,
            fontWeight: FontWeight.bold),
        displayLarge: GoogleFonts.inter(
            fontSize: 20,
            color: AppColor.blackLightColor,
            fontWeight: FontWeight.w600),
        displayMedium: GoogleFonts.inter(
            fontSize: 18,
            color: AppColor.blackLightColor,
            fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.inter(
            fontSize: 20,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w400),
        bodySmall: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.primaryColor,

        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme:
            IconThemeData(color: AppColor.primaryColor, size: 35),
        unselectedIconTheme: IconThemeData(color: AppColor.grayColor, size: 35),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
          iconSize: 35,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(
                color: AppColor.whiteColor,
                width: 5,
              ))),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.backgroundColorLight,
      ));





  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: AppColor.backgroundColorDark,
      appBarTheme: AppBarTheme(
        color: AppColor.primaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColor.blackLightColor,
            fontWeight: FontWeight.bold),
        displayLarge: GoogleFonts.inter(
            fontSize: 20,
            color: AppColor.blackLightColor,
            fontWeight: FontWeight.w600),
        displayMedium: GoogleFonts.inter(
            fontSize: 18,
            color: AppColor.blackLightColor,
            fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.inter(
            fontSize: 18,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w400),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme:
            IconThemeData(color: AppColor.primaryColor, size: 35),
        unselectedIconTheme: IconThemeData(color: AppColor.grayColor, size: 35),
        selectedItemColor: AppColor.primaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
          iconSize: 35,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(
                color: AppColor.whiteColor,
                width: 5,
              ))),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.backgroundColorDark,
      ));
}
