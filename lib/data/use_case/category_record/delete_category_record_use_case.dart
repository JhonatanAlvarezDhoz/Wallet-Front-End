import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/repository/repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class DeleteCategoryRecordUseCaseParams {
  final int idCategoryRecord;

  DeleteCategoryRecordUseCaseParams({required this.idCategoryRecord});
}

class DeleteCategoryRecordUseCase
    implements UseCase<void, DeleteCategoryRecordUseCaseParams> {
  CategoryQRrecordRepository categoryQRrecordRepository;

  DeleteCategoryRecordUseCase({required this.categoryQRrecordRepository});

  @override
  Future<void> call({DeleteCategoryRecordUseCaseParams? params}) async {
    final http.Response response = await categoryQRrecordRepository
        .deleteCategoryQRrecord(idCategoryRecord: params!.idCategoryRecord);

    switch (response.statusCode) {
      case 204:
        break;

      default:
    }
    throw UnimplementedError();
  }
}
