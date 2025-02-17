import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import '../service_center_controller.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceCenterController controller = Get.find<ServiceCenterController>();
    return Obx(() {
      if (controller.currentPosition.value == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          initialCenter: controller.currentPosition.value!,
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: controller.currentPosition.value!,
                radius: 20,
                color: Colors.blue.withOpacity(0.2),
                borderStrokeWidth: 2,
                borderColor: Colors.blue,
              ),
            ],
          ),
          MarkerLayer(
            markers: controller.randomMarkerLocations.map((point) {
              return Marker(
                width: 40.0,
                height: 40.0,
                point: point,
                child:
                    const Icon(Icons.location_on, size: 40, color: Colors.red),
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
