import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/repository/repository.dart';

class CategoryQRrecordRepository extends Api {
  Future<http.Response> getCatgoryQRrecord() async {
    final http.Response response = await get("/qr/list/qr_category/");
    return response;
  }

  Future<http.Response> createCatgoryQRrecord({String? name}) async {
    final Map<String, String> body = {
      'name': name!,
    };
    final http.Response response = await post("/qr/create/qr_category/", body);
    return response;
  }

  Future<http.Response> updateCatgoryQRrecord({
    required int idCategoryRecord,
    required Map<String, dynamic> body,
  }) async {
    final http.Response response =
        await put("/qr/update/qr_category/$idCategoryRecord", body);
    return response;
  }

  Future<http.Response> deleteCategoryQRrecord({
    required int idCategoryRecord,
  }) async {
    final http.Response response =
        await delete("/qr/delete/qr_category/$idCategoryRecord");
    return response;
  }
}
