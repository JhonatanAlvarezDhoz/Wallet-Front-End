import 'dart:convert';

class ListOpinionModel {
  ListOpinionModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Opinion?>? results;

  factory ListOpinionModel.fromJson(String str) =>
      ListOpinionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListOpinionModel.fromMap(Map<String, dynamic> json) =>
      ListOpinionModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Opinion?>.from(
                json["results"]!.map((x) => Opinion.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x!.toMap())),
      };
}

class Opinion {
  Opinion({
    this.id,
    this.title,
    this.text,
    this.isActive,
    this.opinionCategory,
    this.user,
  });

  int? id;
  String? title;
  String? text;
  bool? isActive;
  int? opinionCategory;
  int? user;

  factory Opinion.fromJson(String str) => Opinion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Opinion.fromMap(Map<String, dynamic> json) => Opinion(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        isActive: json["is_active"],
        opinionCategory: json["opinion_category"],
        user: json["user"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "text": text,
        "is_active": isActive,
        "opinion_category": opinionCategory,
        "user": user,
      };
}
