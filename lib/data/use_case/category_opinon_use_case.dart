import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class CategoryOpinionUseCase implements UseCaseNoParams<CategoryOpinionModel> {
  final CategoryOpinionRepository categoryOpinionRepository;

  CategoryOpinionUseCase({required this.categoryOpinionRepository});
  @override
  Future<CategoryOpinionModel> call() async {
    http.Response response =
        await categoryOpinionRepository.getCategoryOpinion();
    switch (response.statusCode) {
      case 200:
        CategoryOpinionModel categoryOpinionModel =
            CategoryOpinionModel.fromJson(
                jsonDecode(utf8.decode(response.bodyBytes)));
        return categoryOpinionModel;
      case 408:
        throw TimeoutException("");
      default:
        UseCaseException("Something has happened. Try again later");
    }
    throw UseCaseException("Something has happened. Try again later");
  }
}
