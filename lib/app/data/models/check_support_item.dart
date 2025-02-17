import 'package:symphony_app/imports.dart';

List<CheckSupportItem> checkSupportItemFromJson(String str) =>
    List<CheckSupportItem>.from(
        json.decode(str).map((x) => CheckSupportItem.fromJson(x)));

String checkSupportItemToJson(List<CheckSupportItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckSupportItem {
  final String title;
  final String imageUrl;
  final String route;

  CheckSupportItem({
    required this.title,
    required this.imageUrl,
    required this.route,
  });

  factory CheckSupportItem.fromJson(Map<String, dynamic> json) =>
      CheckSupportItem(
        title: json["title"],
        imageUrl: json["imageUrl"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "imageUrl": imageUrl,
        "route": route,
      };
}