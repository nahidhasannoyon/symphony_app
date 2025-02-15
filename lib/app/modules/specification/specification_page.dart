import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/modules/specification/widgets/battery_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/camera_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/device_sensors_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/display_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/network_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/powered_by_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/processor_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/ram_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/sim_card_wid.dart';
import 'package:symphony_app/app/modules/specification/widgets/storage_wid.dart';

import 'specification_controller.dart';

class SpecificationPage extends GetView<SpecificationController> {
  const SpecificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F7FF),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                const AppBarWidget(title: 'Specification'),
                SizedBox(height: 20.h),
                /* ------------------------------- Powered By ------------------------------- */
                const PoweredByWid(),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    /* -------------------------------- Processor ------------------------------- */
                    const ProcessorWid(),
                    SizedBox(width: 20.w),
                    /* -------------------------------- Storage ------------------------------- */
                    const StorageWid(),
                  ],
                ),
                SizedBox(height: 20.h),
                /* -------------------------------- Display ------------------------------- */
                const DisplayWid(),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    /* ----------------------------------- Ram ---------------------------------- */
                    const RamWid(),
                    SizedBox(width: 20.w),
                    /* -------------------------------- Sim Card -------------------------------- */
                    const SimCardWid(),
                  ],
                ),
                SizedBox(height: 20.h),
                /* --------------------------------- Camera --------------------------------- */
                const CameraWid(),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    /* --------------------------------- Network -------------------------------- */
                    const NetworkWid(),
                    SizedBox(width: 20.w),
                    /* --------------------------------- Battery -------------------------------- */
                    const BatteryWid(),
                  ],
                ),
                SizedBox(height: 20.h),
                /* ----------------------------- Device Sensors ----------------------------- */
                const DeviceSensorsWid(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
