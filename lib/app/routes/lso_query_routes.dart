import 'package:get/get.dart';

import '../modules/lso_query/lso_query_binding.dart';
import '../modules/lso_query/lso_query_page.dart';

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
