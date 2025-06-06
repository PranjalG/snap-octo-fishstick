import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/services/app_colors.dart';
import 'package:layout/services/routes.dart';
import 'package:layout/services/strings.dart';
import 'package:layout/services/text_styles.dart';
import 'package:layout/widgets/custom_appbar.dart';
import 'package:layout/widgets/custom_icon_button.dart';

class InstallationDetailScreen extends StatefulWidget {
  const InstallationDetailScreen({super.key});

  @override
  State<InstallationDetailScreen> createState() =>
      _InstallationDetailScreenState();
}

class _InstallationDetailScreenState extends State<InstallationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Strings.viewInstallationDetails,
      ),
      body: Container(
        // color: AppColors.gaugeColor1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.organisation,
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
                      Row(
                        children: [
                          const Icon(Icons.pin_drop_outlined),
                          SizedBox(width: 10.w),
                          Text(
                            Strings.address,
                            style: kohinoorSemiBold.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.lightTextColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Text(
                              'This is a long piece of text that This is a long piece of text that This is a long piece of text that This is a long piece of text that',
                              maxLines: 5,
                              style: kohinoorRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors
                                      .lightTextColor), // You can adjust the font size as needed
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            flex: 1,
                            child: CustomIconButton(
                                onTap: () {},
                                icon: Icons.open_in_new,
                                buttonText: ''),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Text(
                            Strings.contactPerson,
                            style: kohinoorSemiBold.copyWith(
                                fontSize: 14.sp,
                                color: AppColors
                                    .lightTextColor), // You can adjust the font size as needed
                          ),
                          Text(
                            ' name ',
                            style: kohinoorRegular.copyWith(
                                fontSize: 14.sp,
                                color: AppColors
                                    .lightTextColor), // You can adjust the font size as needed
                          ),
                          const Spacer(),
                          CustomIconButton(
                              onTap: () {},
                              icon: Icons.call_rounded,
                              buttonText: ''),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          const Icon(Icons.checklist_outlined),
                          SizedBox(width: 10.w),
                          Text(
                            Strings.checklist,
                            style: kohinoorSemiBold.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.lightTextColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.h),
                        child: Column(
                          children: [
                            getTableRow('Gateway', 2, null),
                            SizedBox(height: 10.h),
                            getTableRow('Load Point', 13, null),
                            SizedBox(height: 10.h),
                            getTableRow('CTs', 30, checkList1),
                            SizedBox(height: 10.h),
                            getTableRow('Consumables', null, checkList2),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RouteId.viewInstallationScreen);
                        },
                        child: Text(
                          "Go to View Installation >> ",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h)
            ],
          ),
        ),
      ),
    );
  }

  getTableRow(String title, int? quantity, List<CheckListModel>? checkList) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gaugeColor1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kohinoorSemiBold.copyWith(
                    fontSize: 14.sp, color: AppColors.lightTextColor),
              ),
              Text(
                quantity.toString(),
                style: kohinoorSemiBold.copyWith(
                    fontSize: 14.sp, color: AppColors.lightTextColor),
              ),
            ],
          ),
          checkList != null && checkList.isNotEmpty
              ? Column(
                  children: List.generate(
                    checkList.length,
                    (index) {
                      //print(checkList[index].additionalItems == null);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            checkList[index].itemName,
                            style: kohinoorRegular.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.primaryTextColor),
                          ),
                          Text(
                            checkList[index].itemQuantity,
                            style: kohinoorRegular.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.primaryTextColor),
                          ),
                          Text(
                            checkList[index].units,
                            style: kohinoorRegular.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.primaryTextColor),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class CheckListModel {
  final String itemName;
  final String itemQuantity;
  final String units;
  final String? additionalItems;

  const CheckListModel(
      {required this.itemName,
      required this.itemQuantity,
      required this.units,
      this.additionalItems});
}

List<CheckListModel> checkList1 = [
  const CheckListModel(
    itemName: 'CT ratio',
    itemQuantity: 'Item Qty',
    units: 'Unit',
  ),
  const CheckListModel(
    itemName: '25/5',
    itemQuantity: '3',
    units: 'nos',
  ),
  const CheckListModel(
    itemName: '35/5',
    itemQuantity: '3',
    units: 'nos',
  ),
  const CheckListModel(
    itemName: '50/5',
    itemQuantity: '18',
    units: 'nos',
  ),
];

List<CheckListModel> checkList2 = [
  const CheckListModel(
      itemName: 'Item Name',
      itemQuantity: 'Item Qty',
      units: 'Unit',
      additionalItems: 'Some text'),
  const CheckListModel(
    itemName: 'RS 485 Cable',
    itemQuantity: '2',
    units: 'mtr',
  ),
  const CheckListModel(
    itemName: 'Power Cable',
    itemQuantity: '4',
    units: 'mtr',
  ),
  const CheckListModel(
    itemName: 'Lugs',
    itemQuantity: '40',
    units: 'nos',
  ),
];
