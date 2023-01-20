import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class CreateCategoryRecordUseCase
    implements UseCaseNoParams<CategoryQRrecordModel> {
  CategoryQRrecordRepository categoryQRrecordRepository;

  CreateCategoryRecordUseCase({required this.categoryQRrecordRepository});

  @override
  Future<CategoryQRrecordModel> call() async {
    final http.Response response =
        await categoryQRrecordRepository.createCatgoryQRrecord();

    switch (response.statusCode) {
      case 201:
        CategoryQRrecordModel categoryQRrecordModel =
            CategoryQRrecordModel.fromJson(
                json.decode(utf8.decode(response.bodyBytes)));
        return categoryQRrecordModel;

      case 408:
        throw TimeoutException("");
      default:
        UseCaseException("Something has happened. Try again later");
    }

    throw UseCaseException("Something has happened. Try again later");
  }
}
