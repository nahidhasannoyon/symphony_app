import 'package:symphony_app/imports.dart';

class AppPages {
  AppPages._();

  static const initial = '/home';

  static final routes = [
    ...HomeRoutes.routes,
    ...CheckSupportRoutes.routes,
    ...LsoQueryRoutes.routes,
    ...ServiceCenterRoutes.routes,
    ...SpecificationRoutes.routes,
  ];
}