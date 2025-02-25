import 'package:symphony_app/app/core/constants/imports.dart';

class EWarrantyCardWid extends StatelessWidget {
  const EWarrantyCardWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'E-warranty card',
          color: AppColor.headingText,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColor.cardBgB,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 100.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Image(
                  height: 80.h,
                  width: 60.w,
                  fit: BoxFit.contain,
                  image: const AssetImage(Asset.imagesTrendingItemsPhone),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Helio 50',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.subHeadingTextW,
                      ),
                      SizedBox(height: 6.h),
                      CustomTextWidget(
                        text: 'Valid for 406 Days',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.mutedTextW,
                      ),
                      CustomTextWidget(
                        text: 'Expiry Date: December 10, 2024',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.mutedTextW,
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.iconR,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}