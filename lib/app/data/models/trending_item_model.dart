import 'package:symphony_app/imports.dart';

// To parse this JSON data, do
//
//     final trendingItem = trendingItemFromJson(jsonString);



List<TrendingItem> trendingItemFromJson(String str) => List<TrendingItem>.from(
    json.decode(str).map((x) => TrendingItem.fromJson(x)));

String trendingItemToJson(List<TrendingItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendingItem {
  final String title;
  final String imageUrl;

  TrendingItem({
    required this.title,
    required this.imageUrl,
  });

  factory TrendingItem.fromJson(Map<String, dynamic> json) => TrendingItem(
        title: json["title"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "imageUrl": imageUrl,
      };
}