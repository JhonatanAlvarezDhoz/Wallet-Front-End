import 'package:flutter/material.dart';

class ItemCategory {
  String item;

  ItemCategory({required this.item});
}

List<ItemCategory> itemCategory = [
  ItemCategory(item: 'Review'),
  ItemCategory(item: 'Comments'),
  ItemCategory(item: 'Suggestions'),
  ItemCategory(item: 'Bad Service'),
  ItemCategory(item: 'Complints'),
];
