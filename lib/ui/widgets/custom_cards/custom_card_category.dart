import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(
        top: responsive.hp(3.5),
        left: responsive.wp(14),
        right: responsive.wp(14),
      ),
      height: responsive.hp(11),
      width: responsive.wp(100),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: responsive.wp(40),
            margin: EdgeInsets.only(
              left: responsive.dp(1.9),
              top: responsive.dp(.6),
            ),
            child: CustomText(
              text: 'Title',
              fontSize: responsive.dp(3.6),
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.65),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: responsive.wp(2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    print('More');
                  },
                  icon: const Icon(Icons.more_vert_rounded),
                ),
                CustomText(
                  text: '5',
                  fontSize: responsive.dp(1.8),
                  fontWeight: FontWeight.w500,
                  color: WalletColors.softPurple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
