import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class DeleteOpinionUseCaseParams {
  final int opinionId;

  DeleteOpinionUseCaseParams({required this.opinionId});
}

class DeleteOpinionUseCase
    implements UseCase<void, DeleteOpinionUseCaseParams> {
  OpinionRepository opinionRepository;

  DeleteOpinionUseCase({required this.opinionRepository});

  @override
  Future<void> call({DeleteOpinionUseCaseParams? params}) async {
    final http.Response response =
        await opinionRepository.deleteOpinion(idOpinion: params!.opinionId);

    switch (response.statusCode) {
      case 204:
        break;
      default:
    }
    throw UnimplementedError();
  }
}
