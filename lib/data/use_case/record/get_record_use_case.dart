import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class GetQRrecordUseCase implements UseCaseNoParams<ListQRrecordModel> {
  final QRrecordRepository? qRrecordRepository;

  GetQRrecordUseCase({this.qRrecordRepository});

  @override
  Future<ListQRrecordModel> call() async {
    http.Response response = await qRrecordRepository!.getQRrecords();

    switch (response.statusCode) {
      case 200:
        ListQRrecordModel listQRrecordModel = ListQRrecordModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        return listQRrecordModel;

      case 408:
        throw TimeoutException("");
      default:
        UseCaseException("Something has happened. Try again later");
    }
    throw UseCaseException("Something has happened. Try again later");
  }
}
