import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';
import 'package:symphony_app/app/routes/lso_query_routes.dart';
import 'package:symphony_app/app/routes/service_center_routes.dart';
import 'package:symphony_app/app/routes/specification_routes.dart';

import 'check_support_controller.dart';

class CheckSupportPage extends GetView<CheckSupportController> {
  const CheckSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F7FF),
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Get.toNamed(ServiceCenterRoutes.serviceCenter);
                        // Get.toNamed(LsoQueryRoutes.lsoQuery);
                        Get.toNamed(SpecificationRoutes.specification);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(62, 70, 112, 252),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              fit: BoxFit.contain,
                              image: const AssetImage(Asset.imagesCall),
                              height: 40.h,
                              width: 40.w,
                            ),
                            const Spacer(),
                            CustomTextWidget(
                              text: 'Book An Appointment',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
