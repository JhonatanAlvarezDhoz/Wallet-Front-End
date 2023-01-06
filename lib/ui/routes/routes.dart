import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/pages/pages.dart';
import 'package:qr_wallet_front_end/ui/routes/route.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomRoute {
  static Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return CustomMaterialPageRoute(
            builder: (BuildContext context) => const SplashPage(),
            settings: settings);

      case RouteNames.login:
        return CustomMaterialPageRoute(
            builder: (BuildContext builder) => const LoginPage(),
            settings: settings);

      case RouteNames.register:
        return CustomMaterialPageRoute(
            builder: (BuildContext builder) => const RegisterPage(),
            settings: settings);

      case RouteNames.category:
        return CustomMaterialPageRoute(
            builder: (BuildContext context) => const CategoryPage(),
            settings: settings);

      default:
        return CustomMaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(),
            settings: settings);
    }
  }
}
