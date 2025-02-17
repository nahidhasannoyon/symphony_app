import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:symphony_app/app/data/models/game_model.dart';
import 'package:symphony_app/app/data/models/trending_item_model.dart';
import 'package:symphony_app/app/data/repositories/games_repository.dart';
import 'package:symphony_app/app/data/repositories/trending_items_repository.dart';

class HomeController extends GetxController {
  final GamesRepository _gamesRepository = GamesRepository();
  final TrendingItemsRepository _trendingItemsRepository =
      TrendingItemsRepository();

  RxList<GameItem> gamesList = <GameItem>[].obs;
  RxList<TrendingItem> trendingItemsList = <TrendingItem>[].obs;

  RxBool isLoadingGames = false.obs;
  RxBool isLoadingTrending = false.obs;

  @override
  void onInit() {
    fetchGames();
    fetchTrendingItems();
    super.onInit();
  }

  Future<void> fetchGames() async {
    try {
      isLoadingGames(true);
      final items = await _gamesRepository.fetchGames();
      gamesList.assignAll(items);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching games: $e");
      }
    } finally {
      isLoadingGames(false);
    }
  }

  Future<void> fetchTrendingItems() async {
    try {
      isLoadingTrending(true);
      final items = await _trendingItemsRepository.fetchTrendingItems();
      trendingItemsList.assignAll(items);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching trending items: $e");
      }
    } finally {
      isLoadingTrending(false);
    }
  }
}
