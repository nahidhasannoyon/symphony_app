import 'package:symphony_app/app/core/constants/imports.dart';

class SpecificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecificationController>(
      () => SpecificationController(),
    );
  }
}