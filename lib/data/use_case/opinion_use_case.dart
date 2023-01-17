import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_wallet_front_end/data/repository/repository.dart';

import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';
import 'package:qr_wallet_front_end/models/models.dart';

class OpinionUseCase implements UseCaseNoParams<ListOpinionModel> {
  final OpinionRepository? opinionRepository;

  OpinionUseCase({this.opinionRepository});

  @override
  Future<ListOpinionModel> call() async {
    http.Response response = await opinionRepository!.getOpinions();

    switch (response.statusCode) {
      case 200:
        ListOpinionModel listOpinionModel = ListOpinionModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        return listOpinionModel;
      case 408:
        throw TimeoutException("");
      default:
        UseCaseException("Something has happened. Try again later");
    }
    throw UseCaseException("Something has happened. Try again later");
  }
}
