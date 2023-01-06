import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

import 'package:qr_wallet_front_end/controllers/controllers.dart';

import 'package:qr_wallet_front_end/ui/constants/constants.dart';

enum SpacePosition { begin, end }

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.onChange})
      : super(key: key);

  final ValueChanged<int> onChange;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final BottomNavigationBarController controller = context.watch();
    const double iconSize = 33;
    return SafeArea(
      top: false,
      child: Container(
        height: responsive.hp(8),
        width: responsive.wp(100),
        decoration: BoxDecoration(color: WalletColors.deepPurple, boxShadow: [
          BoxShadow(
              offset: const Offset(0.0, -10),
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10),
        ]),
        child: Row(
            children: List.generate(iconButtonNav.length, (index) {
          IconButtonNav item = iconButtonNav[index];
          bool isSelected = controller.currentIndex == index;
          Color color =
              isSelected ? WalletColors.white : WalletColors.weakPurple;
          Widget widget = Expanded(
            child: GestureDetector(
              onTap: !isSelected
                  ? () {
                      onChange(index);
                      controller.changeCurrentIndex(index);
                    }
                  : null,
              child: Icon(
                item.icon,
                color: color,
                size: iconSize,
              ),
            ),
          );
          if (index == 1) {
            return _SpaceInRow(
              widget: widget,
              spaceSize: 25,
              position: SpacePosition.end,
            );
          }

          if (index == 2) {
            return _SpaceInRow(
              widget: widget,
              spaceSize: 25,
              position: SpacePosition.begin,
            );
          }
          return widget;
        })),
      ),
    );
  }
}

class _SpaceInRow extends StatelessWidget {
  const _SpaceInRow(
      {Key? key,
      required this.widget,
      required this.spaceSize,
      this.position = SpacePosition.begin})
      : super(key: key);

  final Widget widget;
  final double spaceSize;
  final SpacePosition? position;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SizedBox(
      width: responsive.wp(100) / 4,
      child: Row(
        children: [
          position == SpacePosition.begin
              ? Container(width: spaceSize)
              : const SizedBox.shrink(),
          widget,
          position == SpacePosition.end
              ? SizedBox(width: spaceSize)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
