// To parse this JSON data, do
//
//     final userList = userListFromJson(jsonString);

import 'dart:convert';

List<UserList> userListFromJson(String str) =>
    List<UserList>.from(json.decode(str).map((x) => UserList.fromJson(x)));

String userListToJson(List<UserList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserList {
  UserList({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
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
