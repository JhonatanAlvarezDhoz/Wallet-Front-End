import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

enum SampleItem { edit, delete }

class CustomCardRecord extends StatelessWidget {
  const CustomCardRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(
        top: responsive.hp(3.5),
        left: responsive.wp(6),
        right: responsive.wp(6),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: responsive.dp(1.9),
                  top: responsive.dp(.6),
                ),
                child: CustomText(
                  text: 'Title',
                  fontSize: responsive.dp(3),
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(.65),
                  maxLines: 1,
                ),
              ),
              PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case SampleItem.edit:
                      // Logica para editar
                      print('edit');
                      break;
                    case SampleItem.delete:
                      // TODO:  Logica para editar
                      print('delete');
                      break;
                    default:
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: SampleItem.edit,
                    child: CustomText(text: 'edit'),
                  ),
                  PopupMenuItem(
                      value: SampleItem.delete,
                      child: CustomText(text: 'delete'))
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: responsive.dp(2),
              bottom: responsive.hp(.2),
            ),
            child: CustomText(
              text: 'Value',
              fontSize: responsive.dp(1.6),
              fontWeight: FontWeight.w500,
              color: WalletColors.softPurple,
            ),
          ),
        ],
      ),
    );
  }
}
