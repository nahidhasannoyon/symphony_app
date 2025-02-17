import 'package:symphony_app/app/core/constants/imports.dart';

class ServiceCenterItem extends StatelessWidget {
  final LatLng marker;
  final LatLng currentPosition;
  final int index;

  const ServiceCenterItem({
    super.key,
    required this.marker,
    required this.currentPosition,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final double distanceInMeters = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      marker.latitude,
      marker.longitude,
    );
    final String distanceInKm = (distanceInMeters / 1000).toStringAsFixed(2);
    final String serviceCenterName = "Service Center ${index + 1}";
    final String serviceCenterAddress = "Random Address ${index + 1}";

    return Container(
      color: AppColor.cardBgW,
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
            text: serviceCenterName,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.subHeadingTextB,
          ),
          SizedBox(height: 8.h),
          CustomTextWidget(
            text: serviceCenterAddress,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.bodyText,
          ),
          SizedBox(height: 8.h),
          CustomTextWidget(
            text: "$distanceInKm KM",
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
  }
}