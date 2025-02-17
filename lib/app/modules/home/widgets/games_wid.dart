import 'package:symphony_app/imports.dart';

class GamesWid extends StatelessWidget {
  const GamesWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeCtrl = Get.find<HomeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: 'Games',
              color: AppColor.headingText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: 'See More',
                  fontSize: 14.sp,
                  color: AppColor.textButtonR,
                  fontWeight: FontWeight.w700,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.iconR,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Obx(() {
          if (homeCtrl.isLoadingGames.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (homeCtrl.gamesList.isEmpty) {
            return const Center(child: Text("No Games Available"));
          }

          return SizedBox(
            height: 126.h,
            child: ListView.builder(
              padding: EdgeInsets.all(10.w),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final game = homeCtrl.gamesList[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      width: 100.w,
                      height: 125.h,
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: AppColor.navBarShadow,
                          ),
                        ),
                        color: AppColor.cardBgW,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            game.imageUrl,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}