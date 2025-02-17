import 'package:symphony_app/imports.dart';

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