import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/data/use_case/category_qr_record_use_case.dart';
import 'package:qr_wallet_front_end/models/models.dart';

class CategoryQRrecordController extends ChangeNotifier {
  late CategoryQRrecodrUSeCase categoryQRrecodrUSeCase;

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
