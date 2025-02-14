import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/app/core/widgets/cus_text_wid.dart';

class EntertainmentWidget extends StatelessWidget {
  const EntertainmentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CusTextWid(
          text: 'Entertainment',
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: const Image(
            image: AssetImage('assets/images/image3.png'),
          ),
        ),
      ],
    );
  }
}
