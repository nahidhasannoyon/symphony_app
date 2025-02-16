import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class EntertainmentWid extends StatelessWidget {
  const EntertainmentWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'Entertainment',
          fontSize: 16.sp,
          color: AppColor.headingText,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: const Image(
            image: AssetImage(Asset.imagesPoster),
          ),
        ),
      ],
    );
  }
}
