import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

abstract final class AppTextStyles {
  static TextStyle _poppins(double size, FontWeight weight, Color color) =>
      GoogleFonts.poppins(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: 1.4,
      );

  static final heading = _poppins(26, FontWeight.w600, AppColors.textPrimary);
  static final title = _poppins(20, FontWeight.w600, AppColors.textPrimary);
  static final body = _poppins(14, FontWeight.w400, AppColors.textSecondary);
  static final bodySmall = _poppins(
    13,
    FontWeight.w400,
    AppColors.textSecondary,
  );
  static final input = _poppins(14, FontWeight.w400, AppColors.textPrimary);
  static final hint = _poppins(14, FontWeight.w400, AppColors.textHint);
  static final link = _poppins(14, FontWeight.w600, AppColors.primary);
  static final linkSmall = _poppins(12, FontWeight.w500, AppColors.primary);
  static final button = _poppins(16, FontWeight.w600, AppColors.white);
  static final buttonSmall = _poppins(14, FontWeight.w600, AppColors.white);
  static final socialButton = _poppins(
    14,
    FontWeight.w500,
    AppColors.textPrimary,
  );
  static final captcha = _poppins(13, FontWeight.w400, AppColors.textPrimary);
  static final navLabel = _poppins(10, FontWeight.w400, AppColors.navInactive);
  static final navLabelActive = _poppins(
    10,
    FontWeight.w600,
    AppColors.primary,
  );
  static final badge = _poppins(12, FontWeight.w600, AppColors.white);
}
