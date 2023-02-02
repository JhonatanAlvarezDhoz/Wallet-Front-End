import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class CreateQRrecordUseCaseParams {
  final String name;
  final String value;
  final String qrCategory;

  CreateQRrecordUseCaseParams({
    required this.name,
    required this.value,
    required this.qrCategory,
  });
}

class InvalidPhone extends UseCaseException {
  InvalidPhone(super.message);
}

class CreateRecordUseCase
    implements UseCase<QRrecordModel, CreateQRrecordUseCaseParams> {
  QRrecordRepository qRrecordRepository;

  CreateRecordUseCase({required this.qRrecordRepository});

  @override
  Future<QRrecordModel> call({CreateQRrecordUseCaseParams? params}) async {
    http.Response response = await qRrecordRepository.createQRrecord(
      name: params!.name,
      value: params.value,
      qrCategory: params.qrCategory,
    );

    switch (response.statusCode) {
      case 201:
        QRrecordModel qRrecordModel =
            QRrecordModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return qRrecordModel;

      case 408:
        throw TimeoutException("");
      default:
        if (response.body.contains("The phone number entered is not valid.")) {
          throw InvalidPhone("");
        }
    }
    throw UseCaseException("Something has happened. Try again later");
  }
}
