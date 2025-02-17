import 'package:symphony_app/imports.dart';

class SpecificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecificationController>(
      () => SpecificationController(),
    );
  }
}