import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/modules/home/widgets/app_bar_wid.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F7FF),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: Column(
              children: [
                const AppBarWid(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 160.h,
                    image: const AssetImage('assets/images/image1.png'),
                  ),
                ),
                SizedBox(height: 20.h),
                const NeedHelpWid(),
                SizedBox(height: 20.h),
                const TrendingItemsWid(),
                SizedBox(height: 20.h),
                const EntertainmentWid(),
                SizedBox(height: 20.h),
                const EWarrantyCardWid(),
                SizedBox(height: 20.h),
                const GamesWid(),
                SizedBox(height: 20.h),
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
                          image: AssetImage('assets/images/image4.jpg'),
                        ),
                      ),
                      Center(
                        child: Text(
                          'JOIN SOCIAL COMMUNITY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
