import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomCategoryModal extends StatelessWidget {
  const CustomCategoryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return FractionallySizedBox(
      heightFactor: .8,
      child: Container(
        width: responsive.wp(100),
        decoration: const BoxDecoration(
          color: WalletColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    color: Colors.black,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close)),
              ),
              Container(
                margin: EdgeInsets.only(left: responsive.wp(5)),
                width: responsive.wp(75),
                child: const CustomText(
                  text: 'Category Name',
                  color: Colors.black87,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: responsive.dp(1.8)),
                height: responsive.hp(6),
                width: responsive.wp(75),
                child: const TextFormFieldWidget(
                  fillColor: WalletColors.gray,
                  maxLines: 1,
                ),
              ),
              gapH8,
              SizedBox(
                height: responsive.hp(8),
                width: responsive.wp(75),
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
        ),
      ),
    );
  }
}
