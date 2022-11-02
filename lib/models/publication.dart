import 'dart:convert';

import 'package:psychohelp_app/models/nutritionist.dart';

Publication publicationFromJson(String str) =>
    Publication.fromJson(json.decode(str));
String publicationModelToJson(Publication data) => json.encode(data.toJson());

class Publication {
  int id;
  String title;
  String tags;
  String description;
  String photoUrl;
  String content;
  Nutritionist nutritionist;

  Publication({
    required this.id,
    required this.title,
    required this.tags,
    required this.description,
    required this.photoUrl,
    required this.content,
    required this.nutritionist,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      id: json["id"],
      title: json["title"],
      tags: json["tags"],
      description: json["description"],
      photoUrl: json["photoUrl"],
      content: json["content"],
      nutritionist: Nutritionist.fromJson(json["nutritionist"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "tags": tags,
      "description": description,
      "photoUrl": photoUrl,
      "content": content,
    };
  }
}
