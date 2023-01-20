import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/data/use_case/use_case.dart';
import 'package:qr_wallet_front_end/models/models.dart';

class OpinionController extends ChangeNotifier {
  late GetOpinionUseCase opinionUseCase;

  OpinionController({required this.opinionUseCase});

  ListOpinionModel listOpinionModel = ListOpinionModel();

  Future<void> getListOpinion() async {
    try {
      listOpinionModel = await opinionUseCase.call();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
