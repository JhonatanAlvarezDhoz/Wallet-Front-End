import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/use_case/use_case.dart';

class QRrecordController extends ChangeNotifier {
  late GetQRrecordUseCase qRrecordUseCase;

  QRrecordController({required this.qRrecordUseCase});

  ListQRrecordModel qRrecordModel = ListQRrecordModel();

  Future<void> getQRrecord() async {
    try {
      qRrecordModel = await qRrecordUseCase.call();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
