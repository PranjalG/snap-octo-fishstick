import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layout/bloc/sld_image/sld_image_bloc.dart';
import 'package:layout/services/app_colors.dart';
import 'package:layout/services/strings.dart';
import 'package:layout/services/text_styles.dart';
import 'package:layout/widgets/custom_pop_up.dart';

class ViewInstallationScreen extends StatefulWidget {
  const ViewInstallationScreen({super.key});

  @override
  State<ViewInstallationScreen> createState() => _ViewInstallationScreenState();
}

class _ViewInstallationScreenState extends State<ViewInstallationScreen> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  bool imageAdded = false;
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 200,
    );

    if (pickedFile != null) {
      setState(() {
        imageAdded = true;
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Installation Details'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                child: Text('View Installation Screen'),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Organisation Name',
                                style: kohinoorSemiBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                              Text(
                                'industry name',
                                style: kohinoorRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                Strings.industryType,
                                style: kohinoorSemiBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                              Text(
                                'industry type',
                                style: kohinoorRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.factory,
                                style: kohinoorSemiBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                              Text(
                                'factory name',
                                style: kohinoorRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                Strings.smeCategory,
                                style: kohinoorSemiBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                              Text(
                                'sme category',
                                style: kohinoorRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.lightTextColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person,
                              color: AppColors.gaugeColor3,
                            ),
                          ),
                          Text(
                            'Assignee',
                            style: kohinoorSemiBold.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.lightTextColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 40.w),
                          Text(
                            'Lokesh Paliwal',
                            style: kohinoorSemiBold.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.lightTextColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.check_box,
                              color: AppColors.gaugeColor3,
                            ),
                          ),
                          Text(
                            'Task Assigned',
                            style: kohinoorSemiBold.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.lightTextColor),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Cell - 11'),
                                Text('Cell - 21'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Cell - 12'),
                                Text('Cell - 22'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text('SLD'),
                              // if (_selectedImage != null)
                              //   Image.file(
                              //     _selectedImage!,
                              //     width: 200,
                              //     height: 200,
                              //     fit: BoxFit.cover,
                              //   ),
                              imageAdded
                                  ? Row(
                                      children: [
                                        Icon(Icons.attach_file_rounded),
                                        SizedBox(width: 5.h),
                                        //Text(_selectedImage)
                                      ],
                                    )
                                  : ElevatedButton(
                                      onPressed: ()
                                      => showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomPopUpDialog(
                                              onTapCamera: () => _pickImage(
                                                  ImageSource.camera),
                                              // SldImageBloc().add(AddSldImageEvent()),
                                              onTapGallery: () => _pickImage(
                                                  ImageSource.gallery),
                                              alertTitle: 'Select Photo',
                                            );
                                          }),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.camera_alt_rounded,
                                            color: AppColors.gaugeColor3,
                                          ),
                                          Text('Add Image')
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                child: Text('View Installation Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
