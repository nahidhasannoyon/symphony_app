import 'package:symphony_app/app/core/constants/imports.dart';

class LsoQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LsoQueryController>(
      () => LsoQueryController(),
    );
  }
}