import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class UpdateRecordUseCaseParams {
  final Map<String, dynamic> body;
  final int idQRrecord;

  UpdateRecordUseCaseParams({
    required this.body,
    required this.idQRrecord,
  });
}

class UpdateRecordUseCase
    implements UseCase<QRrecordModel, UpdateRecordUseCaseParams> {
  QRrecordRepository qRrecordRepository;

  UpdateRecordUseCase({required this.qRrecordRepository});

  @override
  Future<QRrecordModel> call({UpdateRecordUseCaseParams? params}) async {
    final http.Response response = await qRrecordRepository.updateQRrecord(
        idQRrecord: params!.idQRrecord, body: params.body);

    switch (response.statusCode) {
      case 200:
        return QRrecordModel.fromJson(
            json.decode(utf8.decode(response.bodyBytes)));

      default:
        UseCaseException("Opinion couldn't be update");
    }
    throw UseCaseException("Something has happened. Try again later");
  }
}
