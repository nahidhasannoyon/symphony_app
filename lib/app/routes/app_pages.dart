import 'home_routes.dart';
import 'check_support_routes.dart';
import 'lso_query_routes.dart';
import 'service_center_routes.dart';
import 'specification_routes.dart';

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
