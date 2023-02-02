import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/use_case/use_case.dart';

class CategoryQRrecordController extends ChangeNotifier {
  late GetCategoryQRrecodrUSeCase categoryQRrecodrUSeCase;
  CategoryQRrecord selectedQRCategory = CategoryQRrecord();

  CategoryQRrecordController({required this.categoryQRrecodrUSeCase});

  CategoryQRrecordModel categoryQRrecordModel = CategoryQRrecordModel();

  Future<void> getCategoryRecord() async {
    try {
      categoryQRrecordModel = await categoryQRrecodrUSeCase.call();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
