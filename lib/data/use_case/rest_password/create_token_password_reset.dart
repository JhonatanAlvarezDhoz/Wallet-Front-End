import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/data/repository/reset_password_repository.dart';
import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';

class CreateTokenPasswordResetUseCaseParams {
  final String email;

  CreateTokenPasswordResetUseCaseParams({required this.email});
}

class EmailNotExist extends UseCaseException {
  EmailNotExist(super.message);
}

class InvalidEmail extends UseCaseException {
  InvalidEmail(super.message);
}

class CreateTokenPasswordReseUseCase
    implements
        UseCase<ResetPasswordModel, CreateTokenPasswordResetUseCaseParams> {
  ResetPasswordRepository resetPasswordRepository;

  CreateTokenPasswordReseUseCase({required this.resetPasswordRepository});

  @override
  Future<ResetPasswordModel> call(
      {CreateTokenPasswordResetUseCaseParams? params}) async {
    final http.Response response = await resetPasswordRepository
        .createTokenPasswordReset(email: params!.email);

    switch (response.statusCode) {
      case 200:
        ResetPasswordModel resetPasswordModel =
            ResetPasswordModel.fromJson(json.decode(response.body));
        return resetPasswordModel;

      case 400:
        if (response.body.contains(
            "We couldn't find an account associated with that email. Please try a different e-mail address.")) {
          throw EmailNotExist(
              "We couldn't find an account associated with that email. Please try a different e-mail address.");
        }

        if (response.body.contains("Enter a valid email address.")) {
          throw InvalidEmail("Enter a valid email address.");
        }

        throw UseCaseException("Something has happened. Try again later");

      default:
        throw UseCaseException("Something has happened. Try again later");
    }
  }
}
