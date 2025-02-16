import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class TrendingItemsWid extends StatelessWidget {
  const TrendingItemsWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'Trending items',
          color: AppColor.headingText,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 126.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Container(
                  width: 100.w,
                  height: 125.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: CustomTextWidget(
                          text: 'Name',
                          fontSize: 16.sp,
                          color: AppColor.subHeadingTextB,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 100.w,
                        height: 80.h,
                        child: const Image(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(Asset.imagesPhone),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
