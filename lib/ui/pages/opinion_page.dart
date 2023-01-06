import 'package:flutter/material.dart';

import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class OpinionPage extends StatelessWidget {
  const OpinionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
        body: BasePage(
            widget: Stack(
              children: [
                ListView.builder(
                    itemCount: 5 + 1,
                    itemBuilder: (context, index) => index == 5
                        ? SizedBox(
                            height: responsive.hp(16.6),
                          )
                        : GestureDetector(
                            onTap: () {},
                            child: const CustomCardOpinion(),
                          )),
                const Positioned(bottom: 0, child: CustomAd())
              ],
            ),
            title: 'Opinions'));
  }
}
