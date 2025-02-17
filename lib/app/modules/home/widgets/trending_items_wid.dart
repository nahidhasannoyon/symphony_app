import 'package:symphony_app/app/core/constants/imports.dart';

class TrendingItemsWid extends StatelessWidget {
  const TrendingItemsWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeCtrl = Get.find<HomeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'Trending items',
          color: AppColor.headingText,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 126.h,
          child: Obx(
            () {
              if (homeCtrl.isLoadingTrending.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeCtrl.trendingItemsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = homeCtrl.trendingItemsList[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Container(
                      width: 100.w,
                      height: 125.h,
                      decoration: BoxDecoration(
                        color: AppColor.cardBgW,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: CustomTextWidget(
                              text: item.title,
                              fontSize: 16.sp,
                              color: AppColor.subHeadingTextB,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 100.w,
                            height: 80.h,
                            child: Image(
                              fit: BoxFit.scaleDown,
                              image: AssetImage(item.imageUrl),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}