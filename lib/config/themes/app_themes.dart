import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xFFd41cee);
  static const Color primaryColor2 = Color(0xFF7208fe);
  // bg dark #161616
  static const Color bgGrey = Color(0xFF161616);

  // dark card bg #111011
  static const Color cardGrey = Color(0xFF111011);
// text color
  static const Color txtColor = Color(0xFFfffeff);
  static const Color headingColor = Color(0xFFfffeff);

  static const Color greenBg = Color.fromARGB(255, 54, 133, 56);
  static const Color lightGreen = Colors.greenAccent;
  static const Color white = Color.fromARGB(255, 245, 245, 245);
}

ThemeData theme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
      scaffoldBackgroundColor: AppColors.bgGrey,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(AppColors.txtColor),
          backgroundColor: MaterialStateProperty.all(
              Colors.transparent), // Remove background
          padding: MaterialStateProperty.all(EdgeInsets.zero), // Remove padding
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              // Optional: Add a border
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Customize the border radius if needed
              ),
              textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w))),
      dataTableTheme: DataTableThemeData(
          decoration: const BoxDecoration(color: AppColors.cardGrey),
          headingRowColor: MaterialStateProperty.all(AppColors.cardGrey),
          dataRowColor: MaterialStateProperty.all(AppColors.cardGrey)),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(textTheme).copyWith(
          //used in header logo
          headlineMedium: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              color: AppColors.headingColor,
              fontSize: 26),
          // used in menu items
          titleMedium: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.headingColor),
          //main body font
          bodyMedium: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.8,
              color: AppColors.txtColor),
          // used in hero section title
          displayLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              color: AppColors.headingColor,
              fontSize: 75),
          displaySmall: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              color: AppColors.headingColor,
              fontSize: 20),
          // container main headings
          displayMedium: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              color: AppColors.headingColor,
              fontSize: 60),

          //hero section description
          bodyLarge: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            color: AppColors.txtColor,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: GoogleFonts.plusJakartaSans(color: AppColors.txtColor),
          labelMedium: GoogleFonts.plusJakartaSans(color: AppColors.txtColor)),
      // styling for appbar
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700, color: AppColors.txtColor));
}
