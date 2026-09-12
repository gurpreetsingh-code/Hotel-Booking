import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle nohemiBold = TextStyle(
    fontFamily: 'Nohemi',
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const TextStyle profileTitle = TextStyle(
    fontFamily: 'Nohemi',
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColors.white,
  );

  static const TextStyle profileSubtitle = TextStyle(
    fontFamily: 'Nohemi',
    fontWeight: FontWeight.w400,
    fontSize: 8,
    color: AppColors.textSecondary,
  );
}