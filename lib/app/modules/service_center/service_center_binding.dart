import 'package:symphony_app/app/core/constants/imports.dart';

class ServiceCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceCenterController>(
      () => ServiceCenterController(),
    );
  }
}