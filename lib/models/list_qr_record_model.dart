import 'dart:convert';

class ListQRrecordModel {
  ListQRrecordModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<QRrecordModel?>? results;

  factory ListQRrecordModel.fromJson(String str) =>
      ListQRrecordModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListQRrecordModel.fromMap(Map<String, dynamic> json) =>
      ListQRrecordModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<QRrecordModel?>.from(
                json["results"]!.map((x) => QRrecordModel.fromMap(x))),
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

class QRrecordModel {
  QRrecordModel({
    this.name,
    this.value,
    this.qrCategory,
    this.isActive,
  });

  String? name;
  String? value;
  int? qrCategory;
  bool? isActive;

  factory QRrecordModel.fromJson(String str) =>
      QRrecordModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QRrecordModel.fromMap(Map<String, dynamic> json) => QRrecordModel(
        name: json["name"],
        value: json["value"],
        qrCategory: json["qr_category"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
        "qr_category": qrCategory,
        "is_active": isActive,
      };
}
