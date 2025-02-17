import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/data/models/check_support_item.dart';

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
