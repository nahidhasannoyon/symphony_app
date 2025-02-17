import 'package:symphony_app/app/core/constants/imports.dart';

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