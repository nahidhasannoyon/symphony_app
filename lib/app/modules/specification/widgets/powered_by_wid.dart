import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class PoweredByWid extends StatelessWidget {
  const PoweredByWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextWidget(
                  text: 'Powered by',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextWidget(
                  text: 'Android™ 14',
                  fontSize: 20.sp,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const Spacer(),
          Image(
            image: const AssetImage('assets/images/image 49.png'),
            height: 46.h,
            width: 80.w,
          ),
          SizedBox(width: 15.w),
        ],
      ),
    );
  }
}
