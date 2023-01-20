import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class UpdateCategoryRecordUseCaseParams {
  final Map<String, dynamic> body;
  final int redordId;

  UpdateCategoryRecordUseCaseParams({
    required this.body,
    required this.redordId,
  });
}

class UpdateCategoryRecordUseCase
    implements
        UseCase<CategoryQRrecordModel, UpdateCategoryRecordUseCaseParams> {
  CategoryQRrecordRepository categoryQRrecordRepository;

  UpdateCategoryRecordUseCase({required this.categoryQRrecordRepository});

  @override
  Future<CategoryQRrecordModel> call(
      {UpdateCategoryRecordUseCaseParams? params}) async {
    final http.Response response =
        await categoryQRrecordRepository.updateCatgoryQRrecord(
            idCategoryRecord: params!.redordId, body: params.body);

    switch (response.statusCode) {
      case 200:
        return CategoryQRrecordModel.fromJson(
            json.decode(utf8.decode(response.bodyBytes)));

      default:
        UseCaseException("Opinion couldn't be update");
    }
    throw UseCaseException("Something has happened. Try again later");
  }
}
