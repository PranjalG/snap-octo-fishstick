import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/services/app_colors.dart';
import 'package:layout/services/text_styles.dart';
import 'package:layout/widgets/custom_text.dart';

class CustomAlertConfirmationDialog extends StatelessWidget {
  const CustomAlertConfirmationDialog({
    super.key,
    required this.onTapNegative,
    required this.onTapPositive,
    required this.alertTitle,
  });

  final VoidCallback onTapPositive;
  final VoidCallback onTapNegative;
  final String alertTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: CustomTextWidget(
          alertTitle,
          style: kohinoorMedium.copyWith(
            fontSize: 18.sp,
            color: AppColors.lightTextColor,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      actionsAlignment: MainAxisAlignment.center,
      alignment: Alignment.center,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                )),
            onPressed: onTapNegative,
            child: const CustomTextWidget('No')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                )),
            onPressed: onTapPositive,
            child: const CustomTextWidget('Yes')),
      ],
    );
  }
}
