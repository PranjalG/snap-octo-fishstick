import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/services/text_styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.buttonText,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 14.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            buttonText,
            style: kohinoorMedium.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
