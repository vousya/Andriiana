import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 48,
    fontWeight: FontWeight.w900,
    color: AppColors.white,
    letterSpacing: -1,
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle body = GoogleFonts.montserrat(
    fontSize: 16,
    color: AppColors.lightGrey,
    height: 1.6,
  );

  static TextStyle gameHeader = GoogleFonts.pressStart2p(
    fontSize: 12,
    color: AppColors.white,
  );
}