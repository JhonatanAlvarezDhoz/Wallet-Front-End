import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/data/repository/repository.dart';

class ResetPasswordRepository extends Api {
  Future<http.Response> createTokenPasswordReset(
      {required String email}) async {
    final Map<String, dynamic> body = {"email": email};
    final http.Response response = await post("/create_token/", body);

    return response;
  }

  Future<http.Response> passwordReset({
    required String token,
    required String password,
  }) async {
    final Map<String, dynamic> body = {
      "token": token,
      "password": password,
    };

    final http.Response response = await post("/password_reset/confirm/", body);

    return response;
  }
}
