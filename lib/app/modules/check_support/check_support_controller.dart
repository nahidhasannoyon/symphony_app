import 'package:get/get.dart';
import 'package:symphony_app/app/data/models/check_support_item.dart';
import 'package:symphony_app/app/data/repositories/check_support_repository.dart';

class CheckSupportController extends GetxController {
  final CheckSupportRepository checkSupportRepo = CheckSupportRepository();
  var supportItems = <CheckSupportItem>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchSupportItems();
    super.onInit();
  }

  void fetchSupportItems() async {
    try {
      isLoading(true);
      var items = await checkSupportRepo.fetchCheckSupportItems();
      supportItems.assignAll(items);
    } finally {
      isLoading(false);
    }
  }
}
