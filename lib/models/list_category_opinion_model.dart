import 'dart:convert';

class CategoryOpinionModel {
  CategoryOpinionModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<CategoryOpinion?>? results;

  factory CategoryOpinionModel.fromJson(String str) =>
      CategoryOpinionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryOpinionModel.fromMap(Map<String, dynamic> json) =>
      CategoryOpinionModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<CategoryOpinion?>.from(
                json["results"]!.map((x) => CategoryOpinion.fromMap(x))),
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

class CategoryOpinion {
  CategoryOpinion({
    this.nameCategory,
  });

  String? nameCategory;

  factory CategoryOpinion.fromJson(String str) =>
      CategoryOpinion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryOpinion.fromMap(Map<String, dynamic> json) => CategoryOpinion(
        nameCategory: json["name_category"],
      );

  Map<String, dynamic> toMap() => {
        "name_category": nameCategory,
      };
}
