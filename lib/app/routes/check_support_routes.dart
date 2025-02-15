import 'package:get/get.dart';

import '../modules/check_support/check_support_binding.dart';
import '../modules/check_support/check_support_page.dart';

class CheckSupportRoutes {
  CheckSupportRoutes._();

  static const checkSupport = '/check-support';

  static final routes = [
    GetPage(
      name: checkSupport,
      page: () => const CheckSupportPage(),
      binding: CheckSupportBinding(),
    ),
  ];
}
