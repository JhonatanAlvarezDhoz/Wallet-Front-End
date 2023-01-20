import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class UpdateOpinionUseCaseParams {
  final Map<String, dynamic> body;
  final int opinionId;

  UpdateOpinionUseCaseParams({
    required this.body,
    required this.opinionId,
  });
}

class UpdateOpinionUseCase
    implements UseCase<Opinion, UpdateOpinionUseCaseParams> {
  OpinionRepository opinionRepository;

  UpdateOpinionUseCase({required this.opinionRepository});

  @override
  Future<Opinion> call({UpdateOpinionUseCaseParams? params}) async {
    final http.Response response = await opinionRepository.updateOpinion(
        opinionId: params!.opinionId, body: params.body);

    switch (response.statusCode) {
      case 200:
        return Opinion.fromJson(json.decode(utf8.decode(response.bodyBytes)));

      default:
        UseCaseException("Opinion couldn't be update");
    }
    throw UseCaseException("Something has happened. Try again later");
  }
}
