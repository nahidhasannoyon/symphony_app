import 'package:symphony_app/imports.dart';

class CheckSupportRepository {
  Future<List<CheckSupportItem>> fetchCheckSupportItems() async {
    try {
      final String response =
          await rootBundle.loadString(Asset.dataCheckSupport);
      return checkSupportItemFromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error loading check support items: $e");
      }
      return [];
    }
  }
}