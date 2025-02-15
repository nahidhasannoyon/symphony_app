import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';
import 'package:symphony_app/app/routes/check_support_routes.dart';

class NeedHelpWid extends StatelessWidget {
  const NeedHelpWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20.r),
      ),
      height: 128.h,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.headset_mic_outlined,
            color: Colors.white,
            size: 40.h,
          ),
          CustomTextWidget(
            text: 'Need Help?',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
            ),
            onPressed: () {
              Get.toNamed(CheckSupportRoutes.checkSupport);
            },
            child: CustomTextWidget(
              text: 'Check Support',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
