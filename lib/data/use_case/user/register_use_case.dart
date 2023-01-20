import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/user_model.dart';
import 'package:qr_wallet_front_end/data/repository/user_repositoey.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class RegisterUseCase implements UseCaseNoParams<UserModel> {
  UserRespository userRespository;

  RegisterUseCase({required this.userRespository});

  @override
  Future<UserModel> call() async {
    http.Response response = await userRespository.register();

    switch (response.statusCode) {
      case 201:
        UserModel userModel =
            UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
        return userModel;

      case 408:
        throw TimeoutException("");
      default:
        UseCaseException("Something has happened. Try again later");
    }

    throw UseCaseException("Something has happened. Try again later");
  }
}
