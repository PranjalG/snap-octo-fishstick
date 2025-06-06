import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/services/app_colors.dart';
import 'package:layout/services/text_styles.dart';
import 'package:layout/widgets/custom_text.dart';

class CustomPopUpDialog extends StatelessWidget {
  const CustomPopUpDialog({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
    required this.alertTitle,
  });

  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;
  final String alertTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: CustomTextWidget(
        alertTitle,
        style: kohinoorMedium.copyWith(
          fontSize: 18.sp,
          color: AppColors.lightTextColor,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      actionsAlignment: MainAxisAlignment.center,
      alignment: Alignment.center,
      actions: [
        Column(
          children: [
            ElevatedButton(
              onPressed: onTapCamera,
              child: Row(
                children: [
                  Icon(Icons.camera_alt_rounded),
                  SizedBox(width: 5.h),
                  CustomTextWidget('Camera'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onTapGallery,
              child: Row(
                children: [
                  Icon(Icons.photo),
                  SizedBox(width: 5.h),
                  CustomTextWidget('Gallery'),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
