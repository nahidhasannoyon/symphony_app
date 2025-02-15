import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class GamesWid extends StatelessWidget {
  const GamesWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: 'Games',
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: 'See More',
                  fontSize: 14.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.red,
                ),
              ],
            ),
          ],
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
                  child: const Image(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(
                      Asset.imagesPhone,
                    ),
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
