import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/modules/home/widgets/e_warranty_card_wid.dart';
import 'package:symphony_app/app/modules/home/widgets/entertainment_wid.dart';
import 'package:symphony_app/app/modules/home/widgets/games_wid.dart';
import 'package:symphony_app/app/modules/home/widgets/need_help_wid.dart';
import 'package:symphony_app/app/modules/home/widgets/trending_items_wid.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bodyBg,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: Column(
              children: [
                /* --------------------------------- App Bar -------------------------------- */
                AppBarWidget(
                  willPop: false,
                  title: 'My Symphony',
                  action: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: AppColor.iconB,
                    ),
                  ),
                ),
                /* --------------------------------- Banner --------------------------------- */
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image(
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    height: 160.h,
                    image: const AssetImage(Asset.imagesBanner),
                  ),
                ),
                SizedBox(height: 20.h),
                /* -------------------------------- Need Help ------------------------------- */
                const NeedHelpWid(),
                SizedBox(height: 20.h),
                /* ----------------------------- Trending Items ----------------------------- */
                const TrendingItemsWid(),
                SizedBox(height: 20.h),
                /* ------------------------------ Entertainment ----------------------------- */
                const EntertainmentWid(),
                SizedBox(height: 20.h),
                /* ----------------------------- E-Warranty Card ---------------------------- */
                const EWarrantyCardWid(),
                SizedBox(height: 20.h),
                /* ----------------------------------- Games -------------------------------- */
                const GamesWid(),
                SizedBox(height: 20.h),
                /* ------------------------ Join Social Community Card ----------------------- */
                SizedBox(
                  height: 128.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: const Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage(Asset.imagesDots),
                        ),
                      ),
                      Center(
                        child: Text(
                          'JOIN SOCIAL COMMUNITY',
                          style: TextStyle(
                            color: AppColor.subHeadingTextW,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
