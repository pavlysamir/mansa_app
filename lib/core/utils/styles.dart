import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansa_app/constants.dart';

abstract class Styles {
  static TextStyle textStyle20BoldPoppings = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyle32Black = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle textStyle18Black = GoogleFonts.almarai(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: kBlackColor,
  );
  static TextStyle textStyle18White = GoogleFonts.almarai(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle32White = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle32Blue = GoogleFonts.almarai(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: kDarktBlue,
  );
  // static TextStyle? textStyle32Black;
  // void initializeTextStyle32Black() {
  //   textStyle32Black = TextStyle(
  //     fontSize: 32.sp,
  //     fontWeight: FontWeight.bold,
  //     color: Colors.black,
  //   );
  // }

  static TextStyle textStyle12Black = GoogleFonts.almarai(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: kBlackColor,
  );
  static TextStyle textStyle12White = GoogleFonts.almarai(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  static TextStyle textStyle12BoldGrey = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey);

  static TextStyle textStyle12Blue = GoogleFonts.almarai(
      fontSize: 12, fontWeight: FontWeight.bold, color: kDarktBlue);

  static TextStyle textStyle12WhiteBoldPoppings = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle textStyle12Orange = GoogleFonts.almarai(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: kPrimaryKey,
  );

  static TextStyle textStyle24BoldBlack = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: kBlackColor,
  );
  static TextStyle textStyle24Black = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: kBlackColor,
  );
  static TextStyle textStyle24BoldWhite = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle20Black = GoogleFonts.poppins(
    fontSize: 20,
    color: kBlackColor,
  );
  static TextStyle textStyle20BoldWhite = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle14Grey = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static TextStyle textStyle14Blck = GoogleFonts.almarai(
      fontSize: 14.sp, fontWeight: FontWeight.normal, color: kBlackColor);

  static TextStyle textStyle14White = GoogleFonts.almarai(
      fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.white);

  static TextStyle textStyle14 = GoogleFonts.almarai(
      fontSize: 14, fontWeight: FontWeight.normal, color: kDarktBlue);

  // const TextStyle(
  //     fontSize: 14, fontWeight: FontWeight.bold, color: kPrimaryKey);

  static TextStyle textStyle16Black = GoogleFonts.almarai(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: kBlackColor,
  );
  static TextStyle textStyle16White = GoogleFonts.almarai(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle textStyle16Grey = GoogleFonts.almarai(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: const Color(0xff6B6161),
  );
}
