import 'package:symphony_app/app/core/constants/imports.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: Container(
        height: 96.h,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.navBarBorder,
              width: 2,
            ),
          ),
          color: AppColor.navBarBg,
          boxShadow: [
            BoxShadow(
              color: AppColor.navBarShadow,
              blurRadius: 15,
              spreadRadius: 0,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                // Navigation logic for Website
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.public,
                    size: 24.w,
                    color: AppColor.navBarIconG,
                  ),
                  const SizedBox(height: 4),
                  CustomTextWidget(
                    text: 'Website',
                    color: AppColor.navBarTextG,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(HomeRoutes.home);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 24.w,
                    color: AppColor.navBarIconR,
                  ),
                  const SizedBox(height: 4),
                  CustomTextWidget(
                    text: 'Home',
                    color: AppColor.navBarTextR,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigation logic for Social
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people,
                    size: 24.w,
                    color: AppColor.navBarIconG,
                  ),
                  const SizedBox(height: 4),
                  CustomTextWidget(
                    text: 'Social',
                    color: AppColor.navBarTextG,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}