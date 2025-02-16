import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:symphony_app/app/core/constants/colors.dart';
import 'package:symphony_app/app/core/widgets/app_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:symphony_app/app/core/widgets/cus_text_widget.dart';

class ServiceCenterPage extends StatefulWidget {
  const ServiceCenterPage({super.key});

  @override
  State<ServiceCenterPage> createState() => _ServiceCenterPageState();
}

class _ServiceCenterPageState extends State<ServiceCenterPage> {
  LatLng? _currentPosition;
  final MapController _mapController = MapController();
  bool _didMoveMap = false;
  List<LatLng> _randomMarkerLocations = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((_) {
      setState(() {
        // Generate 10 random locations within 3km
        _randomMarkerLocations =
            _generateRandomLocations(_currentPosition!, 10, 3000);
      });
    });
  }

  // Generates [count] random locations within [radiusInMeters] from [center].
  List<LatLng> _generateRandomLocations(
      LatLng center, int count, double radiusInMeters) {
    final random = Random();
    List<LatLng> locations = [];
    for (int i = 0; i < count; i++) {
      // Random distance between 0 and radius
      double distance = random.nextDouble() * radiusInMeters;
      // Random angle between 0 and 2π
      double angle = random.nextDouble() * 2 * pi;
      // 1 degree latitude is approx 111320 meters.
      double dLat = (distance * cos(angle)) / 111320;
      // 1 degree longitude in meters varies based on latitude.
      double dLng =
          (distance * sin(angle)) / (111320 * cos(center.latitude * pi / 180));
      locations.add(LatLng(center.latitude + dLat, center.longitude + dLng));
    }
    return locations;
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _didMoveMap = false; // reset the flag when getting position
    });
  }

  @override
  Widget build(BuildContext context) {
    // Move the map controller once when the position is available.
    if (_currentPosition != null && !_didMoveMap) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mapController.move(_currentPosition!, 15.0);
        setState(() {
          _didMoveMap = true;
        });
      });
    }

    // If current position exists, create a sorted list of markers based on distance.
    List<LatLng> sortedMarkers =
        _currentPosition == null ? [] : List.from(_randomMarkerLocations)
          ..sort((a, b) {
            final dA = Geolocator.distanceBetween(_currentPosition!.latitude,
                _currentPosition!.longitude, a.latitude, a.longitude);
            final dB = Geolocator.distanceBetween(_currentPosition!.latitude,
                _currentPosition!.longitude, b.latitude, b.longitude);
            return dA.compareTo(dB);
          });

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
                expandedHeight: kToolbarHeight + 20.h + 270.h,
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
                          child: _currentPosition == null
                              ? const Center(child: CircularProgressIndicator())
                              : FlutterMap(
                                  mapController: _mapController,
                                  options: MapOptions(
                                    initialCenter: _currentPosition!,
                                    initialZoom: 15.0,
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    ),
                                    CircleLayer(
                                      circles: [
                                        CircleMarker(
                                          point: _currentPosition!,
                                          radius: 20,
                                          color: Colors.blue.withOpacity(0.2),
                                          borderStrokeWidth: 2,
                                          borderColor: Colors.blue,
                                        ),
                                      ],
                                    ),
                                    MarkerLayer(
                                      markers: _randomMarkerLocations
                                          .map(
                                            (point) => Marker(
                                              width: 40.0,
                                              height: 40.0,
                                              point: point,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: const Icon(
                                                  Icons.location_on,
                                                  size: 40.0,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                        ),
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
                            _getCurrentLocation();
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
                delegate: _HeaderDelegate(
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
          // Now build the sorted list in the body.
          body: _currentPosition == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: sortedMarkers.length,
                  itemBuilder: (context, index) {
                    final marker = sortedMarkers[index];
                    // Compute the distance in meters from your current position.
                    final distanceInMeters = Geolocator.distanceBetween(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                      marker.latitude,
                      marker.longitude,
                    );
                    final distanceInKm =
                        (distanceInMeters / 1000).toStringAsFixed(2);

                    // Generate dummy name and address details.
                    final serviceCenterName = "Service Center ${index + 1}";
                    final serviceCenterAddress = "Random Address ${index + 1}";

                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextWidget(
                            text: serviceCenterName,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.subHeadingTextB,
                          ),
                          SizedBox(height: 8.h),
                          CustomTextWidget(
                            text: serviceCenterAddress,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.bodyText,
                          ),
                          SizedBox(height: 8.h),
                          CustomTextWidget(
                            text: "$distanceInKm KM",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.bodyTextR,
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.buttonBgR,
                                  minimumSize: Size(133.w, 46.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                onPressed: () {
                                  // Add your Directions logic here.
                                },
                                icon: const Icon(
                                  Icons.directions,
                                  color: AppColor.buttonIconW,
                                ),
                                label: CustomTextWidget(
                                  text: "Directions",
                                  color: AppColor.buttonTextW,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              OutlinedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.buttonBgW,
                                  minimumSize: Size(105.w, 46.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                onPressed: () {
                                  // Add your Share logic here.
                                },
                                icon: const Icon(
                                  Icons.share,
                                  color: AppColor.iconR,
                                ),
                                label: const CustomTextWidget(
                                  text: "Share",
                                  color: AppColor.textButtonR,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _HeaderDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _HeaderDelegate oldDelegate) =>
      oldDelegate.child != child || oldDelegate.height != height;
}
