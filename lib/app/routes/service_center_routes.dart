import 'package:symphony_app/imports.dart';

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