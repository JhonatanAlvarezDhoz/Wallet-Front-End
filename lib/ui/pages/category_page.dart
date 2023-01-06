import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/responsive.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return BasePage(
      widget: Stack(
        children: [
          ListView.builder(
            itemCount: 5 + 1,
            itemBuilder: (context, index) => index == 5
                ? SizedBox(
                    height: responsive.hp(17),
                  )
                : GestureDetector(
                    onTap: () {
                      print('values categories');
                    },
                    child: const CustomCardCategory(),
                  ),
          ),
          const Positioned(
            bottom: 0,
            child: CustomAd(),
          ),
          Column()
        ],
      ),
      title: 'Categories',
      iconadd: true,
      leading: true,
    );
  }
}
