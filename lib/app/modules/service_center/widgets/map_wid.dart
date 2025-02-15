import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MapWid extends StatelessWidget {
  const MapWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: double.infinity,
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(23.8103, 90.4125),
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
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
