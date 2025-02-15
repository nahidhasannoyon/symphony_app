import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';
import 'package:symphony_app/app/modules/lso_query/widgets/app_bar_wid.dart';

import 'lso_query_controller.dart';

class LsoQueryPage extends GetView<LsoQueryController> {
  const LsoQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F7FF),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              const AppBarWid(),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(87, 255, 0, 43),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Service Tracking',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextWidget(
                      text: 'Enter LSO',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        hintText: 'Enter LSO : eg : PAN-00950100',
                      ),
                    ),
                    SizedBox(height: 25.h),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement get information functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF002B),
                        minimumSize: Size(147.w, 46.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          text: 'Get Information',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
