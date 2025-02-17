import 'package:symphony_app/imports.dart';

class LsoQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LsoQueryController>(
      () => LsoQueryController(),
    );
  }
}