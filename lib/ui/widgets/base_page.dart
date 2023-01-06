import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/colors.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/responsive.dart';

class BasePage extends StatelessWidget {
  final Widget widget;
  final String title;
  final bool? leading;
  final bool? iconadd;

  const BasePage({
    Key? key,
    required this.widget,
    required this.title,
    this.leading = true,
    this.iconadd = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
        appBar: AppBar(
          title: CustomText(text: title),
          elevation: 5,
          centerTitle: true,
          shadowColor: WalletColors.softPurple,
          backgroundColor: WalletColors.deepPurple,
          leading: _BcakButtom(
            leading: leading!,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: _IconAdd(
                responsive: responsive,
                iconAdd: iconadd!,
              ),
            )
          ],
        ),
        body: Center(
          child: widget,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FittedBox(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: FloatingActionButton(
                  onPressed: () {},
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: WalletColors.deepPurple,
                  child: Icon(
                    Icons.qr_code_scanner_rounded,
                    size: responsive.dp(3.4),
                  )),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onChange: (int value) {
            print(value);
          },
        ));
  }
}

class _BcakButtom extends StatelessWidget {
  final bool leading;
  const _BcakButtom({
    Key? key,
    required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (leading) {
      return const BackButton();
    }
    return const SizedBox();
  }
}

class _IconAdd extends StatelessWidget {
  final bool iconAdd;
  const _IconAdd({
    Key? key,
    required this.responsive,
    required this.iconAdd,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    if (iconAdd) {
      return IconButton(
        onPressed: () {
          print('Ad Category');
        },
        icon: Icon(
          Icons.add_circle_rounded,
          size: responsive.dp(3.7),
        ),
      );
    }
    return const SizedBox();
  }
}
