import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
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
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage(Asset.imagesPATTERN),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color(0xFFFF2C2C),
            BlendMode.dstATop,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.cardBgRThick,
            AppColor.cardBgRThin,
          ],
        ),
      ),
      height: 128.h,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.headset_mic_outlined,
            color: AppColor.iconW,
            size: 40.h,
          ),
          CustomTextWidget(
            text: 'Need Help?',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.subHeadingTextW,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
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
              color: AppColor.buttonTextB,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
