import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class RamWid extends StatelessWidget {
  const RamWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      height: 148.h,
      width: Get.width / 2 - 30.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: const AssetImage('assets/images/image5.png'),
            height: 32.r,
            width: 32.r,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              CustomTextWidget(
                text: 'RAM',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12.r,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          CustomTextWidget(
            text: '16GB (8GB Expandable RAM)',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
