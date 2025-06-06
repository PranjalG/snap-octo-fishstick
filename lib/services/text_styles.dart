import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/services/app_colors.dart';

const fontKohinoorBold = "KohinoorDevanagari-Bold";
const fontKohinoorLight = "KohinoorDevanagari-Light";
const fontKohinoorMedium = "KohinoorDevanagari-Medium";
const fontKohinoorRegular = "KohinoorDevanagari-Regular";
const fontKohinoorSemiBold = "KohinoorDevanagari-Semibold";

const kohinoorBold = TextStyle(fontFamily: fontKohinoorBold);

const kohinoorMedium = TextStyle(fontFamily: fontKohinoorMedium);

const kohinoorRegular = TextStyle(fontFamily: fontKohinoorRegular);

const kohinoorLight = TextStyle(fontFamily: fontKohinoorLight);

const kohinoorSemiBold = TextStyle(fontFamily: fontKohinoorSemiBold);
TextStyle hintStyle = kohinoorRegular.copyWith(
  fontSize: 14.sp,
  color: AppColors.hintTextColor,
);
TextStyle textStyle = kohinoorMedium.copyWith(fontSize: 16.sp, color: AppColors.alertTimeColor);
TextStyle errorStyle = kohinoorRegular.copyWith(
  color: AppColors.errorColor,
  fontSize: 14.sp,
);
TextStyle labelStyle = kohinoorRegular.copyWith(
  color: AppColors.hintTextColor,
  fontSize: 16.sp,
);
