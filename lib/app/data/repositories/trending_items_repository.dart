import 'package:symphony_app/imports.dart';

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