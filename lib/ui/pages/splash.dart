import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          _BackGround(size: size),

          // Bubbles Top
          const Positioned(
              top: -32,
              right: -34,
              child: _Bubbles(
                  wihth: 200, heigth: 200, color: WalletColors.weakPurple)),
          const Positioned(
              top: -28,
              right: -30,
              child: _Bubbles(
                  wihth: 170, heigth: 170, color: WalletColors.ligthPurple)),
          const Positioned(
              top: -24,
              right: -26,
              child: _Bubbles(
                  wihth: 145, heigth: 145, color: WalletColors.softPurple)),
          const Positioned(
              top: -20,
              right: -22,
              child: _Bubbles(
                  wihth: 120, heigth: 120, color: WalletColors.purple)),
          const Positioned(
              top: -11,
              right: -13,
              child: _Bubbles(
                  wihth: 90, heigth: 90, color: WalletColors.deepPurple)),

          //Logo
          Container(
            margin: EdgeInsets.only(left: 27),
            child: Center(
                widthFactor: 3,
                heightFactor: 7.4,
                child: Image.asset('assets/icons/qr-wallet-out-bacground.png')),
          ),
          const Positioned(
            top: 440,
            left: 123,
            child: Text(
              'QR - Wallet',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),

          // Bubbles Bottom
          const Positioned(
              bottom: -39,
              left: -39,
              child: _Bubbles(
                  wihth: 300, heigth: 300, color: WalletColors.weakPurple)),
          const Positioned(
              bottom: -39,
              left: -39,
              child: _Bubbles(
                  wihth: 268, heigth: 268, color: WalletColors.ligthPurple)),
          const Positioned(
              bottom: -39,
              left: -39,
              child: _Bubbles(
                  wihth: 235, heigth: 235, color: WalletColors.softPurple)),
          const Positioned(
              bottom: -37,
              left: -37,
              child: _Bubbles(
                  color: WalletColors.purple, heigth: 202, wihth: 202)),
          const Positioned(
            bottom: -18,
            left: -18,
            child: _Bubbles(
                color: WalletColors.deepPurple, wihth: 150, heigth: 150),
          ),
        ],
      ),
    ));
  }
}

class _Bubbles extends StatelessWidget {
  final double wihth;
  final double heigth;
  final Color color;

  const _Bubbles({
    Key? key,
    required this.wihth,
    required this.heigth,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: wihth,
      width: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300),
        color: color,
      ),
    );
  }
}

class _BackGround extends StatelessWidget {
  const _BackGround({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 1,
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            'assets/images/qrO.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/qr70.png',
          ),
          Image.asset(
            'assets/images/qrO.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
