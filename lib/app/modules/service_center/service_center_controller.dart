import 'package:symphony_app/imports.dart';

class ServiceCenterController extends GetxController {
  final MapController mapController = MapController();
  Rx<LatLng?> currentPosition = Rx<LatLng?>(null);
  RxBool didMoveMap = false.obs;
  RxList<LatLng> randomMarkerLocations = <LatLng>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation().then((_) {
      randomMarkerLocations.value =
          _generateRandomLocations(currentPosition.value!, 10, 3000);
    }).then((_) {
      getSortedMarkers();
    });
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    currentPosition.value = LatLng(position.latitude, position.longitude);
    didMoveMap.value = false;
  }

  List<LatLng> _generateRandomLocations(
      LatLng center, int count, double radiusInMeters) {
    final random = Random();
    return List.generate(count, (_) {
      // Generate a random distance between 0 and the radius in meters
      double distance = random.nextDouble() * radiusInMeters;
      // Generate a random angle between 0 and 2*pi
      double angle = random.nextDouble() * 2 * pi;
      // 1 degree latitude is approx 111320 meters.
      double dLat = (distance * cos(angle)) / 111320;
      // 1 degree longitude is approx 111320 meters * cos(latitude).
      double dLng =
          (distance * sin(angle)) / (111320 * cos(center.latitude * pi / 180));
      return LatLng(center.latitude + dLat, center.longitude + dLng);
    });
  }

  void getSortedMarkers() {
    randomMarkerLocations.sort((a, b) {
      double distanceA = Geolocator.distanceBetween(
        currentPosition.value!.latitude,
        currentPosition.value!.longitude,
        a.latitude,
        a.longitude,
      );
      double distanceB = Geolocator.distanceBetween(
        currentPosition.value!.latitude,
        currentPosition.value!.longitude,
        b.latitude,
        b.longitude,
      );
      return distanceA.compareTo(distanceB);
    });
  }
}