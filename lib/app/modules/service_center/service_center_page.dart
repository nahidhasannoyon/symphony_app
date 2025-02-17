import 'package:symphony_app/imports.dart';

class ServiceCenterPage extends StatelessWidget {
  const ServiceCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceCenterController serviceCenterCtrl =
        Get.find<ServiceCenterController>();
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: false,
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                        child: const AppBarWidget(title: 'Service Center'),
                      ),
                      Positioned(
                        top: kToolbarHeight.h + 10.h,
                        left: 0.w,
                        right: 0.w,
                        child: SizedBox(
                            height: 280.h,
                            width: double.infinity,
                            child: const MapWidget()),
                      ),
                      Positioned(
                        bottom: 10.h,
                        right: 10.w,
                        child: IconButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.buttonBgW,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: AppColor.buttonBgR,
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          onPressed: () {
                            serviceCenterCtrl.mapController.move(
                                serviceCenterCtrl.currentPosition.value!, 15.0);
                          },
                          icon: const Icon(
                            Icons.my_location,
                            color: AppColor.buttonIconR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: HeaderDelegate(
                  height: 16.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.cardBgW,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.navBarShadow,
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, -7),
                        ),
                      ],
                    ),
                    child: Divider(
                      indent: Get.size.width * 0.4,
                      endIndent: Get.size.width * 0.4,
                      color: AppColor.navBarBorder,
                      thickness: 5.h,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Obx(() {
            if (serviceCenterCtrl.currentPosition.value == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: serviceCenterCtrl.randomMarkerLocations.length,
              itemBuilder: (context, index) {
                return ServiceCenterItem(
                  marker: serviceCenterCtrl.randomMarkerLocations[index],
                  currentPosition: serviceCenterCtrl.currentPosition.value!,
                  index: index,
                );
              },
            );
          }),
        ),
        backgroundColor: AppColor.bodyBg,
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}