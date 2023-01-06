import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      widget: Stack(
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                print('values categories');
              },
              child: const CustomCardCategory(),
            ),
          ),
          const Positioned(bottom: 0, child: CustomAd())
        ],
      ),
      title: 'Categories',
      iconadd: true,
      leading: true,
    );
  }
}
