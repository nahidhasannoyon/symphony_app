import 'package:get/get.dart';

import 'check_support_controller.dart';

class CheckSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckSupportController>(
      () => CheckSupportController(),
    );
  }
}
