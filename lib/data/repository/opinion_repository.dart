import 'package:http/http.dart' as http;
import 'package:qr_wallet_front_end/data/repository/repository.dart';

class OpinionRepository extends Api {
  Future<http.Response> getOpinions() async {
    final http.Response response = await get("/opinion/list/");
    return response;
  }

  Future<http.Response> createOpinion({
    String? title,
    String? text,
    List<String>? opinionCategory,
    String? user,
  }) async {
    final Map<String, dynamic> body = {
      'title': title,
      'text': text,
      'opinion_category':
          opinionCategory!.map((e) => "\"$e\"").toList().toString(),
    };

    final http.Response response = await post("/opinion/create/", body);
    return response;
  }

  Future<http.Response> updateOpinion({
    required int opinionId,
    required Map<String, dynamic> body,
  }) async {
    final http.Response response =
        await put("/opinion/update/$opinionId", body);
    return response;
  }

  Future<http.Response> deleteOpinion({
    required int idOpinion,
  }) async {
    final http.Response response = await delete("/opinion/delete/$idOpinion");
    return response;
  }
}
