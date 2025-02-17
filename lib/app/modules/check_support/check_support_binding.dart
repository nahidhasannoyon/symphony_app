import 'package:symphony_app/app/core/constants/imports.dart';

class CheckSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckSupportController>(
      () => CheckSupportController(),
    );
  }
}