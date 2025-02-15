import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class AppBarWid extends StatelessWidget {
  const AppBarWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: Colors.red,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        SizedBox(width: 10.w),
        CustomTextWidget(
          text: 'Specification',
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
