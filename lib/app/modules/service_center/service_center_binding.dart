import 'package:symphony_app/imports.dart';

class ServiceCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceCenterController>(
      () => ServiceCenterController(),
    );
  }
}