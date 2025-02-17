import 'package:symphony_app/imports.dart';

class SpecificationPage extends GetView<SpecificationController> {
  const SpecificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bodyBg,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                const AppBarWidget(title: 'Specification'),
                SizedBox(height: 10.h),
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