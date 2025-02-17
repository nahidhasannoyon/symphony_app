import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:symphony_app/app/core/constants/assets.dart';
import 'package:symphony_app/app/data/models/game_model.dart';

class GamesRepository {
  Future<List<GameItem>> fetchGames() async {
    try {
      final String response = await rootBundle.loadString(Asset.dataGames);

      return gameItemFromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error loading games: $e");
      }
      return [];
    }
  }
}
