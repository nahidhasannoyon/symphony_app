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

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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
    return SizedBox(
      height: 280.h,
      width: double.infinity,
      child: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _currentPosition!,
                // Use the desired zoom level directly.
                initialZoom: 15.0,
                // Removed onMapReady to avoid prematurely moving the map.
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
                  markers: [
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: const LatLng(23.8103, 90.4125),
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
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: const LatLng(23.8003, 90.4225),
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
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: const LatLng(23.8153, 90.4015),
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
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: const LatLng(23.8003, 90.3925),
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
                  ],
                ),
              ],
            ),
    );
  }
}
