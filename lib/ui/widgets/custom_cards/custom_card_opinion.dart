import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomCardOpinion extends StatelessWidget {
  const CustomCardOpinion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double side = responsive.wp(10);

    return Container(
      padding: EdgeInsets.all(responsive.dp(2)),
      margin: EdgeInsets.only(left: side, right: side, top: responsive.hp(5)),
      height: responsive.hp(31),
      width: responsive.wp(80),
      decoration: BoxDecoration(
        color: WalletColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(31, 135, 133, 133),
            offset: Offset(0, 8),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: WalletColors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(31, 135, 133, 133),
                      offset: Offset(0, 9),
                      blurRadius: 12,
                    )
                  ],
                ),
              ),
              gapW32,
              SizedBox(
                width: responsive.wp(42),
                child: const CustomText(
                  text: 'Jorege Eliecer Gaitan Robles',
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              )
            ],
          ),
          gapH4,
          SizedBox(
            height: 20,
            width: responsive.wp(67),
            child: CustomText(
              text: 'Category',
              fontSize: responsive.dp(1.5),
              textAlign: TextAlign.end,
              color: WalletColors.purple,
            ),
          ),
          gapH8,
          SizedBox(
            height: responsive.wp(20),
            width: responsive.wp(66),
            child: CustomText(
              text:
                  'Est aute duis elit duis mollit irure. Consequat duis dolor ex elit ipsum quis ipsum dolore. Est aute duis elit duis mollit irure. Consequat duis dolor ex elit ipsum quis ipsum dolore.  elit ipsum quis ipsum ',
              fontSize: responsive.dp(1.6),
              textAlign: TextAlign.justify,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
