import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomCategoryModal extends StatelessWidget {
  const CustomCategoryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: responsive.hp(30),
      width: responsive.wp(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WalletColors.white,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 13, right: 13, bottom: 13),
                height: responsive.hp(5),
                width: responsive.wp(10.8),
                decoration: BoxDecoration(
                    color: WalletColors.purple,
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close_rounded,
                    color: WalletColors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: responsive.wp(60),
            child: const CustomText(
              text: 'Category Name',
              color: Colors.black87,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: responsive.dp(1.8)),
            height: responsive.hp(5),
            width: responsive.wp(70),
            child: const TextFormFieldWidget(
              fillColor: WalletColors.gray,
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: responsive.hp(8),
            width: responsive.wp(70),
            child: CustomButtom(
                borderRadius: BorderRadius.circular(35),
                child: CustomText(
                  text: 'Create',
                  fontSize: responsive.dp(3),
                  fontWeight: FontWeight.w600,
                  color: WalletColors.white,
                )),
          )
        ],
      ),
    );
  }
}
