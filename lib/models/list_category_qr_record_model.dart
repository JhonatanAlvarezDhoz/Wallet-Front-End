import 'dart:convert';

class CategoryQRrecordModel {
  CategoryQRrecordModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<CategoryQRrecord?>? results;

  factory CategoryQRrecordModel.fromJson(String str) =>
      CategoryQRrecordModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryQRrecordModel.fromMap(Map<String, dynamic> json) =>
      CategoryQRrecordModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<CategoryQRrecord?>.from(
                json["results"]!.map((x) => CategoryQRrecord.fromMap(x))),
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

class CategoryQRrecord {
  CategoryQRrecord({
    this.id,
    this.name,
    this.userId,
  });

  int? id;
  String? name;
  int? userId;

  factory CategoryQRrecord.fromJson(String str) =>
      CategoryQRrecord.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryQRrecord.fromMap(Map<String, dynamic> json) =>
      CategoryQRrecord(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "user_id": userId,
      };
}
