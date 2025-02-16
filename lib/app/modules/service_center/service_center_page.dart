import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';
import 'package:symphony_app/app/modules/service_center/widgets/map_wid.dart';

import 'service_center_controller.dart';

class ServiceCenterPage extends GetView<ServiceCenterController> {
  const ServiceCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate the height available for the list container.
    final double topOffset = kToolbarHeight + 20.h + 270.h;
    final double containerHeight = Get.size.height - topOffset;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  right: 10.w,
                  child: const AppBarWidget(
                    title: 'Service Center',
                  ),
                ),
                Positioned(
                  top: kToolbarHeight + 20.h,
                  left: 0.w,
                  right: 0.w,
                  child: const MapWid(),
                ),
                Positioned(
                  top: topOffset,
                  left: 0.w,
                  right: 0.w,
                  child: Container(
                    height: containerHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.w),
                          child: GestureDetector(
                            child: CustomTextWidget(
                              text: 'Service Centers',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.headingText,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 9, // Adjust count as needed.
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(15.w),
                                decoration: const BoxDecoration(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextWidget(
                                      text: "Badda (CC) - Dhaka",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.subHeadingTextB,
                                    ),
                                    SizedBox(height: 8.h),
                                    CustomTextWidget(
                                      text:
                                          "Service Touch Point, Configure Bepari Shopping Complex, Badda, Dhaka - 1212",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.bodyText,
                                    ),
                                    SizedBox(height: 8.h),
                                    CustomTextWidget(
                                      text: "2.71 KM",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.bodyTextR,
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.buttonBgR,
                                            minimumSize: Size(133.w, 46.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                          ),
                                          onPressed: () {
                                            // Add your Directions logic here.
                                          },
                                          icon: const Icon(
                                            Icons.directions,
                                            color: AppColor.buttonIconW,
                                          ),
                                          label: CustomTextWidget(
                                            text: "Directions",
                                            color: AppColor.buttonTextW,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        OutlinedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.buttonBgW,
                                            minimumSize: Size(105.w, 46.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                          ),
                                          onPressed: () {
                                            // Add your Share logic here.
                                          },
                                          icon: const Icon(
                                            Icons.share,
                                            color: AppColor.iconR,
                                          ),
                                          label: const CustomTextWidget(
                                            text: "Share",
                                            color: AppColor.textButtonR,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    Divider(
                                      color: Colors.grey,
                                      thickness: 0.5.h,
                                    ),
                                  ],
                                ),
                              );
                            },
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
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
