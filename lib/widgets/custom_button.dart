import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/services/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isValid;
  final Function onClick;
  final bool isLoading;
  final bool isBorderedButton;
  final IconData? icon;
  final double? verticalPadding;
  final double? horizontalPadding;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.isValid,
    required this.onClick,
    required this.isLoading,
    this.isBorderedButton = false,
    this.icon,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // added so that if the  isLoading is true then thee button won't reduce the width of the loading indicator.
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 8.w, vertical: verticalPadding ?? 8.h),
      // In Consistent padding on many screen so made it optional.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(44.h),
            backgroundColor: isBorderedButton ? AppColors.backgroundColor : AppColors.primaryColor,
            foregroundColor: isBorderedButton ? AppColors.primaryColor : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
                side: BorderSide(color: isBorderedButton ? AppColors.primaryColor : Colors.transparent))),
        // to use it as a bordered button

        onPressed: isValid && !isLoading
            ? () {
          onClick();
        }
            : null,
        child: isLoading
            ? const CupertinoActivityIndicator(color: AppColors.primaryColor)
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Icon(
                icon,
                color: isBorderedButton ? AppColors.primaryColor : Colors.white,
              ),
            )
                : const SizedBox.shrink(),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
