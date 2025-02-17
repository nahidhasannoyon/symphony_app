import 'package:symphony_app/imports.dart';

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