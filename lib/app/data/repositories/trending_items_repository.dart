import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/data/models/trending_item_model.dart';

class TrendingItemsRepository {
  Future<List<TrendingItem>> fetchTrendingItems() async {
    final String response =
        await rootBundle.loadString(Asset.dataTrendingItems);

    if (kDebugMode) {
      print("JSON Data: $response");
    }
    return trendingItemFromJson(response);
  }
}
