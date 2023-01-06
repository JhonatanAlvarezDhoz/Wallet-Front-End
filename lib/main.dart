import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_wallet_front_end/ui/pages/pages.dart';
import 'package:qr_wallet_front_end/ui/routes/routes.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

void main() => runApp(MultiProvider(
      providers: DependencyInyector.dependencies,
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor:
                    MediaQuery.of(context).textScaleFactor.clamp(0.9, 1.4)),
            child: child!);
      },
      onGenerateRoute: CustomRoute.route,
      home: const CategoryPage(),
    );
  }
}
