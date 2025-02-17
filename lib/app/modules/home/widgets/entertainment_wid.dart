import 'package:symphony_app/app/core/constants/imports.dart';

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