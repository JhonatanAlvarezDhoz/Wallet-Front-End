import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qr_wallet_front_end/controllers/bottom_navigation_controller.dart';

class DependencyInyector {
  static List<SingleChildWidget> dependencies = [
    ChangeNotifierProvider(
        create: (BuildContext context) => BottomNavigationBarController()),
  ];
}
