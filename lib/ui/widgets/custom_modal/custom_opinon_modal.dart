import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomOpinionModal extends StatelessWidget {
  CustomOpinionModal({Key? key}) : super(key: key);
  final comment = TextEditingController();

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
    return FractionallySizedBox(
        heightFactor: 0.9,
        child: Container(
          width: responsive.wp(100),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
                  margin: EdgeInsets.only(left: responsive.dp(4)),
                  width: responsive.wp(75),
                  child: const CustomText(
                    text: 'Title',
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
                Container(
                  margin: EdgeInsets.only(left: responsive.dp(3)),
                  width: responsive.wp(75),
                  child: const CustomText(
                    text: 'Category',
                    color: Colors.black87,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: responsive.dp(1.9)),
                    height: responsive.hp(7),
                    width: responsive.wp(75),
                    decoration: BoxDecoration(
                        color: WalletColors.gray,
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                Container(
                  margin: EdgeInsets.only(left: responsive.dp(3)),
                  width: responsive.wp(75),
                  child: const CustomText(
                    text: 'Coments',
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: responsive.hp(17),
                  width: responsive.wp(75),
                  child: TextFormFieldWidget(
                    controller: comment,
                    maxLines: 7,
                    maxLength: 500,
                    counterText: "",
                    autoFocus: false,
                    fillColor: WalletColors.gray,
                  ),
                ),
                CustomText(
                  text: '${comment.text.length}/500',
                  fontSize: responsive.dp(1.4),
                ),
                gapH12,
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
        ));
  }
}
