import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/data/models/trending_item_model.dart';

class TrendingItemsRepository {
  Future<List<TrendingItem>> fetchTrendingItems() async {
    try {
      final String response =
          await rootBundle.loadString(Asset.dataTrendingItems);
      return trendingItemFromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error loading trending items: $e");
      }
      return [];
    }
  }
}
