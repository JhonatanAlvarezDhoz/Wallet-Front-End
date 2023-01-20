import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class GetCategoryQRrecodrUSeCase implements UseCaseNoParams {
  CategoryQRrecordRepository categoryQRrecordRepository;

  GetCategoryQRrecodrUSeCase({required this.categoryQRrecordRepository});
  @override
  Future call() async {
    http.Response response =
        await categoryQRrecordRepository.getCatgoryQRrecord();

    switch (response.statusCode) {
      case 200:
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
