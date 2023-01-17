import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:qr_wallet_front_end/utils/session.dart';

class Api {
  final String apiUrl = dotenv.get('apiUrl');
  final Session session = Session.instance;

  Map<String, String> get headers => _buildHeaders();
  Map<String, String> get headersWithoutAuth => _buildHeadersWithoutAuth();

  Map<String, String> _buildHeadersWithoutAuth() {
    final Map<String, String> headers = {'x-api-key': dotenv.get('x-api-key')};

    return headers;
  }

  Map<String, String> _buildHeaders() {
    final Map<String, String> headers = {'x-api-key': dotenv.get('x-api-key')};

    if (session.userToken != null) {
      headers.addAll({"Authorization": "Bearer ${session.userToken!.access}"});
    }
    return headers;
  }

  Future<http.Response> get(String path, {bool? useAuth = true}) {
    return http
        .get(Uri.parse("$apiUrl$path"),
            headers: useAuth! ? headers : headersWithoutAuth)
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response('', 408);
      },
    );
  }

  Future<http.Response> post(String path, Map<String, dynamic> body,
      {bool? useAuth = true}) {
    return http.post(Uri.parse("$apiUrl$path"),
        body: body, headers: useAuth! ? headers : headersWithoutAuth);
  }

  Future<http.Response> put(String path, Map<String, dynamic> body,
      {bool? useAuth = true}) {
    return http.put(Uri.parse("$apiUrl$path"),
        body: body, headers: useAuth! ? headers : headersWithoutAuth);
  }

  Future<http.Response> delete(String path, {useAuth = true}) {
    return http.delete(Uri.parse("$apiUrl$path"),
        headers: useAuth! ? headers : headersWithoutAuth);
  }
}
