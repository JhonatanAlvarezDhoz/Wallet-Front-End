import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomRecordModal extends StatelessWidget {
  const CustomRecordModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final List<String> itemCategory = <String>[
      'Review',
      'Comments',
      'Suggestions',
      'Bad Service',
      'Complints',
    ];
    return Container(
      height: responsive.hp(43),
      width: responsive.wp(85),
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: WalletColors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: responsive.wp(50),
            child: const CustomText(
              text: 'Name',
              color: Colors.black87,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: responsive.dp(1.8)),
            height: responsive.hp(5),
            width: responsive.wp(59),
            child: const TextFormFieldWidget(
              fillColor: WalletColors.gray,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: responsive.wp(50),
            child: const CustomText(
              text: 'Category',
              color: Colors.black87,
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: responsive.dp(1.9)),
              height: responsive.hp(6.5),
              width: responsive.wp(59),
              decoration: BoxDecoration(
                  color: WalletColors.gray,
                  borderRadius: BorderRadius.circular(20)),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  dropdownColor: WalletColors.gray,
                  hint: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const CustomText(
                      text: 'Choose category',
                    ),
                  ),
                  items: itemCategory.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomText(
                          text: e,
                          fontSize: responsive.dp(2),
                          textAlign: TextAlign.center,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              )),
          gapH20,
          SizedBox(
            height: responsive.hp(8),
            width: responsive.wp(60),
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
