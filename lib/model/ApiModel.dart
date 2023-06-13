// To parse this JSON data, do
//
//     final placeholder = placeholderFromJson(jsonString);

import 'dart:convert';

List<Placeholder> placeholderFromJson(String str) => List<Placeholder>.from(
    json.decode(str).map((x) => Placeholder.fromJson(x)));

String placeholderToJson(List<Placeholder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Placeholder {
  Placeholder({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Placeholder.fromJson(Map<String, dynamic> json) => Placeholder(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
