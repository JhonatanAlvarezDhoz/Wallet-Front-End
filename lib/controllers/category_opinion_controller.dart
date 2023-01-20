import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/data/use_case/use_case.dart';
import 'package:qr_wallet_front_end/models/models.dart';

class CategeryOpinionController extends ChangeNotifier {
  late CategoryOpinionUseCase categoryOpinionUseCase;

  CategeryOpinionController({required this.categoryOpinionUseCase});

  CategoryOpinionModel categoryOpinionModel = CategoryOpinionModel();

  Future<void> getListCategoryOpinion() async {
    try {
      categoryOpinionModel = await categoryOpinionUseCase.call();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
