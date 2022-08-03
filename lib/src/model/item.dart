// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    required this.itemType,
    required this.name,
    required this.description,
  });

  final String itemType;
  final String name;
  final String description;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemType: json['item_type'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'item_type': itemType,
        'name': name,
        'description': description,
      };
}
