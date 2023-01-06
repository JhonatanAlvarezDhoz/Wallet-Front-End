import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      leading: false,
      widget: Stack(
        children: [
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                print('Navigate value');
              },
              child: const CustomCardRecord(),
            ),
          ),
          const Positioned(bottom: 0, child: CustomAd())
        ],
      ),
      title: 'Home',
    );
  }
}
