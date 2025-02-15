import 'package:get/get.dart';

import '../modules/specification/specification_binding.dart';
import '../modules/specification/specification_page.dart';

class SpecificationRoutes {
  SpecificationRoutes._();

  static const specification = '/specification';

  static final routes = [
    GetPage(
      name: specification,
      page: () => const SpecificationPage(),
      binding: SpecificationBinding(),
    ),
  ];
}
