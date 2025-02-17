import 'package:symphony_app/imports.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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