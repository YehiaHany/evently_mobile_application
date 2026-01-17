import 'package:flutter/material.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles{
  static final TextStyle semiBold20Black = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static final TextStyle semiBold20white = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle regular14GrayDark = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grayDark,
  );
  static final TextStyle regular14GrayLight = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grayBorder,
  );
  static final TextStyle medium16Black = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static final TextStyle medium16white = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}