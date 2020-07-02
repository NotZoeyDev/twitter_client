import 'dart:convert';
import 'User.dart';

class Tweet {
  Tweet({
    this.createdAt,
    this.id,
    this.idStr,
    this.text,
    this.source,
    this.user,
  });

  String createdAt;
  double id;
  String idStr;
  String text;
  String source;
  User user;

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
    createdAt: json["created_at"],
    id: json["id"].toDouble(),
    idStr: json["id_str"],
    text: json["text"],
    source: json["source"],
    user: User.fromJson(json['user'])
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "id": id,
    "id_str": idStr,
    "text": text,
    "source": source,
    "user": user.toString()
  };
}
