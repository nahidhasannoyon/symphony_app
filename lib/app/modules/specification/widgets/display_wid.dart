import 'package:symphony_app/app/core/constants/imports.dart';

class DisplayWid extends StatelessWidget {
  const DisplayWid({
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
            image: const AssetImage(Asset.imagesIconsSpecificationsDisplay),
            height: 32.r,
            width: 32.r,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          CustomTextWidget(
            text: 'Display',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.mutedTextB,
          ),
          SizedBox(height: 5.h),
          CustomTextWidget(
            text: '6.7" FHD+ AMOLED GG5 120Hz Punch Hole ',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.subHeadingTextB,
          ),
        ],
      ),
    );
  }
}