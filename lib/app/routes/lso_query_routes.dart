import 'package:symphony_app/app/core/constants/imports.dart';

class LsoQueryRoutes {
  LsoQueryRoutes._();

  static const lsoQuery = '/lso-query';

  static final routes = [
    GetPage(
      name: lsoQuery,
      page: () => const LsoQueryPage(),
      binding: LsoQueryBinding(),
    ),
  ];
}