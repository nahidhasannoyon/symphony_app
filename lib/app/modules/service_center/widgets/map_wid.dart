import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapWid extends StatefulWidget {
  const MapWid({
    super.key,
  });

  @override
  State<MapWid> createState() => _MapWidState();
}

class _MapWidState extends State<MapWid> {
  LatLng? _currentPosition;
  final MapController _mapController = MapController();
  bool _didMoveMap = false;
  List<LatLng> _randomMarkerLocations = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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
      _randomMarkerLocations =
          _generateRandomLocations(_currentPosition!, 4, 3000);
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

    return SizedBox(
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
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: _currentPosition!,
                      radius: 20, // radius in pixels, adjust as needed
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
    );
  }
}
