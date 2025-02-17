import 'package:symphony_app/app/core/constants/imports.dart';

class ProcessorWid extends StatelessWidget {
  const ProcessorWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      height: 166.h,
      width: Get.width / 2 - 30.w,
      decoration: BoxDecoration(
        color: AppColor.cardBgW,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: const AssetImage(Asset.imagesIconsSpecificationsProcessor),
            height: 32.r,
            width: 32.r,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          CustomTextWidget(
            text: 'Processor',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.mutedTextB,
          ),
          SizedBox(height: 5.h),
          CustomTextWidget(
            text: 'MediaTek Helio G99 6nm 2.2GHz Octa Core',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.subHeadingTextB,
          ),
        ],
      ),
    );
  }
}