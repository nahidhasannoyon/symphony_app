import 'package:get/get.dart';

import 'lso_query_controller.dart';

class LsoQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LsoQueryController>(
      () => LsoQueryController(),
    );
  }
}
