import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/modules/service_center/widgets/header_delegate.dart';
import 'service_center_controller.dart';
import 'widgets/map_wid.dart';
import 'widgets/service_center_item.dart';

class ServiceCenterPage extends StatelessWidget {
  const ServiceCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceCenterController controller = Get.put(ServiceCenterController());
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: false,
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                        child: const AppBarWidget(title: 'Service Center'),
                      ),
                      Positioned(
                        top: kToolbarHeight.h + 10.h,
                        left: 0.w,
                        right: 0.w,
                        child: SizedBox(
                            height: 280.h,
                            width: double.infinity,
                            child: const MapWidget()),
                      ),
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
                          ),
                          onPressed: () {
                            controller.mapController
                                .move(controller.currentPosition.value!, 15.0);
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
              SliverPersistentHeader(
                pinned: true,
                delegate: HeaderDelegate(
                  height: 16.h,
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
          body: Obx(() {
            if (controller.currentPosition.value == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: controller.randomMarkerLocations.length,
              itemBuilder: (context, index) {
                return ServiceCenterItem(
                  marker: controller.randomMarkerLocations[index],
                  currentPosition: controller.currentPosition.value!,
                  index: index,
                );
              },
            );
          }),
        ),
        backgroundColor: AppColor.bodyBg,
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
