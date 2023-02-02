import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/use_case/use_case.dart';

class QRrecordController extends ChangeNotifier {
  CategoryQRrecord selectedQRCategory = CategoryQRrecord();
  late GetCategoryQRrecodrUSeCase categoryQRrecodrUSeCase;
  late List<CategoryQRrecord> qrCategoryList = [];

  final GlobalKey formkeyRecord = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController value = TextEditingController();
  final TextEditingController qrCategory = TextEditingController();

  late GetQRrecordUseCase getQRrecordUseCase;
  late CreateRecordUseCase createRecordUseCase;
  late UpdateRecordUseCase updateRecordUseCase;
  late DeleteRecordUseCase deleteRecordUseCase;

  QRrecordController({
    required this.getQRrecordUseCase,
    required this.createRecordUseCase,
    required this.updateRecordUseCase,
    required this.deleteRecordUseCase,
  });

  ListQRrecordModel qRrecordModel = ListQRrecordModel();

  Future<void> getListQRCategory() async {
    try {
      qrCategoryList = await categoryQRrecodrUSeCase.call();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getQRrecord() async {
    try {
      qRrecordModel = await getQRrecordUseCase.call();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void updateSelectedQRCategory(CategoryQRrecord categoryQRrecord) {
    selectedQRCategory = categoryQRrecord;
  }

  Future<QRrecordModel> createQRrecord() async {
    return await createRecordUseCase.call(
        params: CreateQRrecordUseCaseParams(
      name: name.text,
      value: value.text,
      qrCategory: selectedQRCategory.id.toString(),
    ));
  }
}
