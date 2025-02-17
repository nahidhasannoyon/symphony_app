import 'package:symphony_app/imports.dart';

class CheckSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckSupportController>(
      () => CheckSupportController(),
    );
  }
}