import 'package:symphony_app/app/core/constants/imports.dart';

List<GameItem> gameItemFromJson(String str) =>
    List<GameItem>.from(json.decode(str).map((x) => GameItem.fromJson(x)));

String gameItemToJson(List<GameItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameItem {
  final String imageUrl;

  GameItem({
    required this.imageUrl,
  });

  factory GameItem.fromJson(Map<String, dynamic> json) => GameItem(
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
      };
}