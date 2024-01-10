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

abstract class AppFonts {
  static String mainFont = 'PlusJakartaSans';
}

ThemeData theme(BuildContext context, bool isMobile) {
  // final textTheme = Theme.of(context).textTheme;
  return ThemeData(
      scaffoldBackgroundColor: AppColors.bgGrey,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: isMobile
                  ? mobileTextTheme().bodyMedium!.fontSize
                  : desktopTextTheme().bodyMedium!.fontSize)),
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
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: AppFonts.mainFont,
              ),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w))),
      dataTableTheme: DataTableThemeData(
          decoration: const BoxDecoration(color: AppColors.cardGrey),
          headingRowColor: MaterialStateProperty.all(AppColors.cardGrey),
          dataRowColor: MaterialStateProperty.all(AppColors.cardGrey)),
      textTheme: isMobile ? mobileTextTheme() : desktopTextTheme(),
      splashColor: AppColors.primaryColor,
    
      // styling for appbar
      listTileTheme: ListTileThemeData(
          textColor: AppColors.txtColor,
          titleTextStyle: TextStyle(fontFamily: AppFonts.mainFont)),
      appBarTheme: appBarTheme());
}

TextTheme desktopTextTheme() {
  return TextTheme(
    //used in header logo
    headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.mainFont,
        color: AppColors.headingColor,
        fontSize: 26),
    // used in menu items
    titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.mainFont,
        color: AppColors.headingColor),
    //main body font
    bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
        height: 1.8,
        color: AppColors.txtColor),
    //body small font
    bodySmall: TextStyle(
      height: 1.8,
      color: AppColors.txtColor,
      fontFamily: AppFonts.mainFont,
    ),
    // used in hero section title
    displayLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.mainFont,
        color: AppColors.headingColor,
        fontSize: 75),
    displaySmall: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.headingColor,
        fontFamily: AppFonts.mainFont,
        fontSize: 20),
    // container main headings
    displayMedium: TextStyle(
        fontFamily: AppFonts.mainFont,
        fontWeight: FontWeight.w700,
        color: AppColors.headingColor,
        fontSize: 60),

    //hero section description
    bodyLarge: TextStyle(
      fontFamily: AppFonts.mainFont,
      fontSize: 20,
      color: AppColors.txtColor,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: AppColors.txtColor,
      fontFamily: AppFonts.mainFont,
    ),
    labelMedium: TextStyle(
      color: AppColors.txtColor,
      fontFamily: AppFonts.mainFont,
    ),
  );
}

TextTheme mobileTextTheme() {
  return TextTheme(
    //used in header logo
    headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.mainFont,
        color: AppColors.headingColor,
        fontSize: 18.sp), 
    // used in menu items
    titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.mainFont,
        color: AppColors.headingColor),
    //main body font
    bodyMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
        height: 1.8,
        color: AppColors.txtColor),
    //body small font
    bodySmall: TextStyle(
      height: 1.8,
      color: AppColors.txtColor,
      fontSize: 10.sp,
      fontFamily: AppFonts.mainFont,
    ),
    // used in hero section title
    displayLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.mainFont,
        color: AppColors.headingColor,
        fontSize: 35.sp),
    displaySmall: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.headingColor,
        fontFamily: AppFonts.mainFont,
        fontSize: 20.sp),
    // container main headings
    displayMedium: TextStyle(
        fontFamily: AppFonts.mainFont,
        fontWeight: FontWeight.w700,
        color: AppColors.headingColor,
        fontSize: 30.sp),

    //hero section description
    bodyLarge: TextStyle(
      fontFamily: AppFonts.mainFont,
      fontSize: 12.sp,
      color: AppColors.txtColor,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
        color: AppColors.txtColor,
        fontFamily: AppFonts.mainFont,
        fontSize: 14.sp),
    labelMedium: TextStyle(
        color: AppColors.txtColor,
        fontFamily: AppFonts.mainFont,
        fontSize: 13.sp),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: AppColors.cardGrey,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.txtColor),
      titleTextStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700, color: AppColors.txtColor));
}

// //font sizes for smaller device
// class MobileTextSizes{
//   //body
//   static double bodyMedium = 16.sp;
//   static double bodyLarge = 18.sp;
//   static double bodySmall = 14.sp;
//   //display 
//   static double displayLarge = 75.sp;
//   static double displayMedium = 60.sp;
//   static double displaySmall = 20.sp;
//   //label
//   static double labelLarge = 12.sp;
//   static double labelMedium = 11.sp;
//   static double labelSmall = 10.sp;
//   //headline
//   static double headlinelarge = 28.sp;
//   static double headlineMedium = 26.sp;
//   static double headlineSmall = 24.sp;
//   //title
//   static double titleMedium = 18.sp;
// }
