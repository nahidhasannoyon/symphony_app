import 'package:symphony_app/app/core/constants/imports.dart';

class DeviceSensorsWid extends StatelessWidget {
  const DeviceSensorsWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      height: 146.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.cardBgW,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image:
                const AssetImage(Asset.imagesIconsSpecificationsDeviceSensors),
            height: 32.r,
            width: 32.r,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          CustomTextWidget(
            text: 'Device Sensors',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.mutedTextB,
          ),
          SizedBox(height: 5.h),
          CustomTextWidget(
            text:
                'Fingerprint, Proximity, Light, Gravity, Magnetic, Gyro Sensor',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.subHeadingTextB,
          ),
        ],
      ),
    );
  }
}