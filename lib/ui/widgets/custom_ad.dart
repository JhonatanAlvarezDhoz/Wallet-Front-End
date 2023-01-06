import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/custom_text/custom_text.dart';
import 'package:qr_wallet_front_end/utils/responsive.dart';

class CustomAd extends StatelessWidget {
  const CustomAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      height: 200,
      width: responsive.wp(100),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: responsive.hp(16),
              width: responsive.wp(100),
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 40, bottom: 36),
              height: 95,
              width: responsive.wp(80),
              color: WalletColors.gray,
              child: const Center(
                child: CustomText(
                  text: 'AD',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
