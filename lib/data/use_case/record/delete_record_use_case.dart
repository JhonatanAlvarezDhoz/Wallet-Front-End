import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class DeleteRecordUseCaseParams {
  final int recordId;

  DeleteRecordUseCaseParams({required this.recordId});
}

class DeleteRecordUseCase implements UseCase<void, DeleteRecordUseCaseParams> {
  QRrecordRepository qRrecordRepository;

  DeleteRecordUseCase({required this.qRrecordRepository});

  @override
  Future<void> call({DeleteRecordUseCaseParams? params}) async {
    final http.Response response =
        await qRrecordRepository.deleteQRrecord(idQRrecord: params!.recordId);

    switch (response.statusCode) {
      case 204:
        break;
      default:
    }
    throw UnimplementedError();
  }
}
