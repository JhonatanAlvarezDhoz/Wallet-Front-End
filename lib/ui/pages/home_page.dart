import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Stack(
      children: [
        ListView.builder(
          itemCount: 5 + 1,
          itemBuilder: (context, index) => index == 5
              ? SizedBox(
                  height: responsive.hp(17),
                  width: responsive.wp(100),
                )
              : GestureDetector(
                  onTap: () {
                    print('Navigate value');
                  },
                  child: const CustomCardRecord(),
                ),
        ),
        const Positioned(bottom: 0, child: CustomAd())
      ],
    );
  }
}
