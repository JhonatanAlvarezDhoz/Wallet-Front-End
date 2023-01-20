import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/use_case/base_use_case.dart';
import 'package:qr_wallet_front_end/data/repository/reset_password_repository.dart';

class ResetPasswordUseCaseParams {
  final String token;
  final String password;

  ResetPasswordUseCaseParams({required this.token, required this.password});
}

class PasswordIsCommonAndNumeric extends UseCaseException {
  PasswordIsCommonAndNumeric(super.message);
}

class PasswordIsNumeric extends UseCaseException {
  PasswordIsNumeric(super.message);
}

class PasswordIsCommon extends UseCaseException {
  PasswordIsCommon(super.message);
}

class PasswordIsToShort extends UseCaseException {
  PasswordIsToShort(super.message);
}

class ResetPasswordUseCase
    implements UseCase<void, ResetPasswordUseCaseParams> {
  ResetPasswordRepository resetPasswordRepository;

  ResetPasswordUseCase({required this.resetPasswordRepository});

  @override
  Future<void> call({ResetPasswordUseCaseParams? params}) async {
    final http.Response response = await resetPasswordRepository.passwordReset(
        token: params!.token, password: params.password);

    switch (response.statusCode) {
      case 200:
        break;

      case 400:
        if (response.body.contains("This password is too common."
            "This password is entirely numeric.")) {
          throw PasswordIsCommonAndNumeric("This password is too common."
              "This password is entirely numeric.");
        }

        if (response.body.contains("This password is entirely numeric.")) {
          throw PasswordIsNumeric("This password is entirely numeric.");
        }

        if (response.body.contains("This password is too common.")) {
          throw PasswordIsCommon("This password is too common.");
        }

        if (response.body.contains(
            "This password is too short. It must contain at least 8 characters.")) {
          throw PasswordIsToShort(
              "This password is too short. It must contain at least 8 characters.");
        }

        throw UseCaseException("Something has happened. Try again later");

      default:
        throw UseCaseException("Something has happened. Try again later");
    }

    throw UnimplementedError();
  }
}
