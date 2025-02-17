import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/data/models/trending_item_model.dart';
import 'package:symphony_app/app/data/repositories/trending_items_repository.dart';

class HomeController extends GetxController {
  final TrendingItemsRepository _repository = TrendingItemsRepository();
  var trendingItems = <TrendingItem>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrendingItems();
  }

  Future<void> fetchTrendingItems() async {
    try {
      isLoading(true);
      if (kDebugMode) {
        print("Fetching trending items...");
      }

      final items = await _repository.fetchTrendingItems();
      if (kDebugMode) {
        print("Fetched items: ${items.length}");
      }

      trendingItems.assignAll(items);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching items: $e");
      }
    } finally {
      isLoading(false);
    }
  }
}
