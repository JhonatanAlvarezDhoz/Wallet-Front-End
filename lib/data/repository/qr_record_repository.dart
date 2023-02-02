import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/repository/repository.dart';

class QRrecordRepository extends Api {
  Future<http.Response> getQRrecords() async {
    final http.Response response = await get("");
    return response;
  }

  Future<http.Response> createQRrecord({
    String? name,
    String? qrCategory,
    String? value,
  }) async {
    final Map<String, dynamic> body = {
      'name': name,
      'value': value,
      'qr_category': qrCategory!,
    };
    final http.Response response = await post("/qr/create/qr_record/", body);
    return response;
  }

  Future<http.Response> updateQRrecord({
    required int idQRrecord,
    required Map<String, dynamic> body,
  }) async {
    final http.Response response =
        await put("/qr/update/qr_record/$idQRrecord", body);
    return response;
  }

  Future<http.Response> deleteQRrecord({required int idQRrecord}) async {
    final http.Response response =
        await delete("/qr/delete/qr_record/$idQRrecord");
    return response;
  }
}
