import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repairoo/controllers/tech_controller.dart';
import 'package:repairoo/views/auth/signup_view/components/document_screen.dart';

import '../../../const/color.dart';
import '../../../const/images.dart';
import '../../../const/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_fields.dart';
import '../../../widgets/drop_down_widget.dart';
import 'components/details_screen.dart';
import 'components/personal_detail.dart';
import 'components/service_screen.dart';

class TechSignup extends StatefulWidget {
  const TechSignup({super.key});

  @override
  State<TechSignup> createState() => _TechSignupState();
}

class _TechSignupState extends State<TechSignup> {
  final TechController techController = Get.put(TechController());
  List<String> index = [
    "0",
    "1",
    "2",
    "3",
  ];

  List<String> name = [
    "Personal",
    "Services",
    "Details",
    "Documents",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Close the keyboard when tapping outside
      },
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w, top: 40.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        color: AppColors.primary,
                        AppImages.bigArrow,
                        scale: 3,
                      ),
                      Image.asset(
                        color: AppColors.primary,
                        AppImages.bigArrow,
                        scale: 4.5,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        'Back',
                        style: jost600(20.sp, AppColors.primary),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 45.h,
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.r)),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: index.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, val) {
                    return GestureDetector(
                      onTap: () {
                        techController.selectedIndex.value = index[val];
                      },
                      child: Obx(() {
                        return Container(
                          width: 77.w,
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          decoration: BoxDecoration(
                              color: techController.selectedIndex.value ==
                                      index[val]
                                  ? AppColors.secondary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(7.58.r),
                              border: Border.all(
                                  color: techController.selectedIndex.value ==
                                          index[val]
                                      ? AppColors.skyBlue
                                      : Colors.transparent,
                                  width: 0.41)),
                          alignment: Alignment.center,
                          child: Text(
                            name[val],
                            style: jost700(
                                10.sp,
                                techController.selectedIndex.value == index[val]
                                    ? AppColors.primary
                                    : AppColors.secondary),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: Obx(() {
                  switch (techController.selectedIndex.value) {
                    case "0":
                      return PersonalDetailsForm();
                    case "1":
                      return ServicesScreen();
                    case "2":
                      return DetailsScreen();
                    case "3":
                      return DocumentsScreen();
                    default:
                      return Center(child: Text('Select an option.'));
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
