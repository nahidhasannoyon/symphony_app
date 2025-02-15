import 'package:get/get.dart';

import '../modules/service_center/service_center_binding.dart';
import '../modules/service_center/service_center_page.dart';

class ServiceCenterRoutes {
  ServiceCenterRoutes._();

  static const serviceCenter = '/service-center';

  static final routes = [
    GetPage(
      name: serviceCenter,
      page: () => const ServiceCenterPage(),
      binding: ServiceCenterBinding(),
    ),
  ];
}
