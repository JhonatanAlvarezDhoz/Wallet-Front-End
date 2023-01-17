import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/repository/repository.dart';

class CategoryOpinionRepository extends Api {
  Future<http.Response> getCategoryOpinion() async {
    final http.Response response = await get("/opinion/category/");
    return response;
  }
}
