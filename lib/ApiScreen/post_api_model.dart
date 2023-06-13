// To parse this JSON data, do
//
//     final postApi = postApiFromJson(jsonString);

import 'dart:convert';

PostApi postApiFromJson(String str) => PostApi.fromJson(json.decode(str));

String postApiToJson(PostApi data) => json.encode(data.toJson());

class PostApi {
  PostApi({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  int id;
  String name;
  String email;
  String gender;
  String status;

  factory PostApi.fromJson(Map<String, dynamic> json) => PostApi(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };
}
