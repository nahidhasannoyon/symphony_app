import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';
import 'package:symphony_app/app/modules/service_center/widgets/map_wid.dart';
import 'service_center_controller.dart';

class ServiceCenterPage extends GetView<ServiceCenterController> {
  const ServiceCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // Use a SliverAppBar to show the map (and the app bar)
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: false,
                expandedHeight: kToolbarHeight + 20.h + 270.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      // App bar widget positioned at the top.
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                        child: const AppBarWidget(title: 'Service Center'),
                      ),
                      // Map widget positioned below the app bar.
                      Positioned(
                        top: kToolbarHeight.h + 10.h,
                        left: 0.w,
                        right: 0.w,
                        child: const MapWid(),
                      ),
                      // Current location button positioned at the bottom right.
                      Positioned(
                        bottom: 10.h,
                        right: 10.w,
                        child: IconButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.buttonBgW,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: AppColor.buttonBgR,
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            // primary: AppColor.buttonBgW,
                          ),
                          onPressed: () {
                            // Add your Current Location logic here.
                          },
                          icon: const Icon(
                            Icons.my_location,
                            color: AppColor.buttonIconR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // A persistent header for the divider within the container.
              SliverPersistentHeader(
                pinned: true,
                delegate: _HeaderDelegate(
                  height: 16.h, // use the appropriate height here
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.cardBgW,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.navBarShadow,
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, -7),
                        ),
                      ],
                    ),
                    child: Divider(
                      indent: Get.size.width * 0.4,
                      endIndent: Get.size.width * 0.4,
                      color: AppColor.navBarBorder,
                      thickness: 5.h,
                    ),
                  ),
                ),
              ),
            ];
          },
          // Now build the list as the body.
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 9, // Adjust count as needed.
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 10.h,
                ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.buttonBgR,
                            minimumSize: Size(133.w, 46.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
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
                              borderRadius: BorderRadius.circular(8.r),
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
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _HeaderDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _HeaderDelegate oldDelegate) =>
      oldDelegate.child != child || oldDelegate.height != height;
}
