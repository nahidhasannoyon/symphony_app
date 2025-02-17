import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';
import 'package:symphony_app/app/data/models/check_support_item.dart';

import 'check_support_controller.dart';

class CheckSupportPage extends GetView<CheckSupportController> {
  const CheckSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckSupportController checkSupportCtrl =
        Get.find<CheckSupportController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bodyBg,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const AppBarWidget(
                title: 'Check Support',
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final CheckSupportItem item =
                          checkSupportCtrl.supportItems[index];
                      return GestureDetector(
                        onTap: () {
                          if (item.route.isNotEmpty) {
                            Get.toNamed(item.route);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            color: AppColor.cardBgW,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              width: 1,
                              color: AppColor.cardBorder,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                fit: BoxFit.contain,
                                image: AssetImage(item.imageUrl),
                                height: 40.h,
                                width: 40.w,
                              ),
                              const Spacer(),
                              CustomTextWidget(
                                text: item.title,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.subHeadingTextB,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
