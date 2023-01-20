import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/utils/utils.dart';
import 'package:qr_wallet_front_end/data/repository/repository.dart';

class UserRespository extends Api {
  Future<http.Response> register({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phone,
  }) async {
    final Map<String, dynamic> body = {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phone': phone,
    };

    final http.Response response = await post("/user/create/", body);
    return response;
  }

  Future<http.Response> login({
    String? username,
    String? password,
  }) async {
    final Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };

    final http.Response response = await post("/user/ token/", body);
    return response;
  }

  Future<http.Response> getUserDatils() async {
    final http.Response response = await get("/user/detail/");

    LocalStorage()
        .setLocalStorageString("user_details", utf8.decode(response.bodyBytes));
    return response;
  }

  Future<http.Response> tokenRefresh({
    String? refresh,
  }) async {
    final Map<String, dynamic> body = {
      'refresh': refresh,
    };

    final http.Response response = await post("/user/token/refresh/", body);
    return response;
  }
}
