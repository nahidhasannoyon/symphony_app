import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/modules/service_center/widgets/app_bar_wid.dart';
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
        body: SizedBox(
          height: Get.size.height,
          child: Stack(
            children: [
              Positioned(
                top: 20.h,
                left: 10.w,
                right: 10.w,
                child: const AppBarWid(),
              ),
              Positioned(
                top: kToolbarHeight + 20.h,
                left: 0.w,
                right: 0.w,
                child: const MapWid(),
              ),
              // Container showing the list of places
              Positioned(
                top: topOffset,
                left: 0.w,
                right: 0.w,
                child: Container(
                  height: containerHeight,
                  padding: EdgeInsets.all(20.w),
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
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 9, // Adjust count as needed.
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(62, 70, 112, 252),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Badda (CC) - Dhaka",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Service Touch Point, Configure Bepari Shopping Complex, Badda, Dhaka - 1212",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "2.71 KM",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF002B),
                                      minimumSize: Size(133.w, 46.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Add your Directions logic here.
                                    },
                                    icon: const Icon(Icons.directions,
                                        color: Colors.white),
                                    label: const Text("Directions",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  SizedBox(width: 12.w),
                                  OutlinedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.grey,
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(105.w, 46.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Add your Share logic here.
                                    },
                                    icon: const Icon(Icons.share,
                                        color: Colors.red),
                                    label: const Text("Share",
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
