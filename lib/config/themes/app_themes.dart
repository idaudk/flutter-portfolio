import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xFF215fd0);
  static const Color primaryColor2 = Color(0xFF00cafc);
  // bg dark #0c0d0c
  static const Color bgGrey = Color(0xFF0c0d0c);

  // dark card bg #1b1b1b
  static const Color cardGrey = Color(0xFF1b1b1b);
// text color
  static const Color txtColor = Color(0xFF272a31);
}

ThemeData theme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
      scaffoldBackgroundColor: Colors.grey[200],
      textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
          //used in header logo
          headlineMedium: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: AppColors.txtColor,
              fontSize: 22),
          // used in menu items
          titleMedium: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.txtColor),
          //main body font
          bodyMedium: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.txtColor),
          // used in hero section title
          displayLarge: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: AppColors.txtColor,
              fontSize: 75),
          // container main headings
          displayMedium: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: AppColors.txtColor,
              fontSize: 50),

          //hero section description
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 20,
            color: AppColors.txtColor,
            fontWeight: FontWeight.w400,
          )),
      // styling for appbar
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700, color: AppColors.txtColor));
}
