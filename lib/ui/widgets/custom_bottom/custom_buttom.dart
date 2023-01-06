import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.onTap,
    this.splashColor,
    this.borderRadius,
    this.backgroungColor,
  });

  final Widget child;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;
  final Color? splashColor;
  final BorderRadius? borderRadius;
  final Color? backgroungColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            side: BorderSide(color: borderColor ?? color ?? WalletColors.white),
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
            splashColor ?? WalletColors.deepPurple.withOpacity(0.2)),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroungColor ?? WalletColors.purple),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: child,
      ),
    );
  }
}
