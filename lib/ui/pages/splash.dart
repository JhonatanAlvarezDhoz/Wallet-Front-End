// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/pages/pages.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  final List<Color> colors = [
    WalletColors.deepPurple,
    WalletColors.purple,
    WalletColors.softPurple,
    WalletColors.ligthPurple,
    WalletColors.weakPurple,
  ];

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );

    animationController.forward();

    Future.delayed(
      const Duration(milliseconds: 3500),
      () => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => BasePage(
            widget: Container(),
            title: '',
          ),
        ),
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (_, child) => Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                _BackGround(size: size),
                ...List.generate(
                  colors.length,
                  (index) {
                    double begin = index * 0.2;
                    double end = index * 0.2 + 0.2;
                    double width = 140.0 + 36.0 * index;
                    double height = 140.0 + 36.0 * index;
                    Color color = colors[index];
                    Animation<double> animation = CurveTween(
                      curve: Interval(begin, end, curve: Curves.ease),
                    ).animate(animationController);
                    return _Bubble(
                      animation: animation,
                      width: width,
                      height: height,
                      color: color,
                      left: -20,
                      bottom: -30,
                    );
                  },
                ).reversed,
                ...List.generate(
                  colors.length,
                  (index) {
                    double begin = index * 0.2;
                    double end = index * 0.2 + 0.2;
                    double width = 80 + 36.0 * index;
                    double height = 80 + 36.0 * index;
                    Color color = colors[index];
                    Animation<double> animation = CurveTween(
                      curve: Interval(begin, end, curve: Curves.ease),
                    ).animate(animationController);
                    return _Bubble(
                      animation: animation,
                      width: width,
                      height: height,
                      color: color,
                      right: -20,
                      top: -30,
                    );
                  },
                ).reversed,
                Center(
                  widthFactor: 3,
                  heightFactor: 7.4,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 4),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Image.asset(
                            "assets/icons/qr-wallet-out-bacground.png"),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 480,
                  left: 110,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 4),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const CustomText(
                            text: "QR - Wallet",
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final Animation<double> animation;
  final double width;
  final double height;
  final Color color;
  final double? left;
  final double? bottom;
  final double? right;
  final double? top;

  const _Bubble({
    required this.animation,
    required this.width,
    required this.height,
    required this.color,
    this.left,
    this.bottom,
    this.right,
    this.top,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      top: top,
      right: right,
      child: Container(
        width: width * animation.value,
        height: height * animation.value,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:qr_wallet_front_end/ui/constants/constants.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: SizedBox(
//       child: Stack(
//         children: [
//           _BackGround(size: size),

//           // Bubbles Top
//           const Positioned(
//               top: -32,
//               right: -34,
//               child: _Bubbles(
//                   wihth: 200, heigth: 200, color: WalletColors.weakPurple)),
//           const Positioned(
//               top: -28,
//               right: -30,
//               child: _Bubbles(
//                   wihth: 170, heigth: 170, color: WalletColors.ligthPurple)),
//           const Positioned(
//               top: -24,
//               right: -26,
//               child: _Bubbles(
//                   wihth: 145, heigth: 145, color: WalletColors.softPurple)),
//           const Positioned(
//               top: -20,
//               right: -22,
//               child: _Bubbles(
//                   wihth: 120, heigth: 120, color: WalletColors.purple)),
//           const Positioned(
//               top: -11,
//               right: -13,
//               child: _Bubbles(
//                   wihth: 90, heigth: 90, color: WalletColors.deepPurple)),

//           //Logo
//           Container(
//             margin: const EdgeInsets.only(left: 27),
//             child: Center(
//                 widthFactor: 3,
//                 heightFactor: 7.4,
//                 child: Image.asset('assets/icons/qr-wallet-out-bacground.png')),
//           ),
//           const Positioned(
//             top: 440,
//             left: 123,
//             child: Text(
//               'QR - Wallet',
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
//             ),
//           ),

//           // Bubbles Bottom
//           const Positioned(
//               bottom: -39,
//               left: -39,
//               child: _Bubbles(
//                   wihth: 300, heigth: 300, color: WalletColors.weakPurple)),
//           const Positioned(
//               bottom: -39,
//               left: -39,
//               child: _Bubbles(
//                   wihth: 268, heigth: 268, color: WalletColors.ligthPurple)),
//           const Positioned(
//               bottom: -39,
//               left: -39,
//               child: _Bubbles(
//                   wihth: 235, heigth: 235, color: WalletColors.softPurple)),
//           const Positioned(
//               bottom: -37,
//               left: -37,
//               child: _Bubbles(
//                   color: WalletColors.purple, heigth: 202, wihth: 202)),
//           const Positioned(
//             bottom: -18,
//             left: -18,
//             child: _Bubbles(
//                 color: WalletColors.deepPurple, wihth: 150, heigth: 150),
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class _Bubbles extends StatelessWidget {
//   final double wihth;
//   final double heigth;
//   final Color color;

//   const _Bubbles({
//     Key? key,
//     required this.wihth,
//     required this.heigth,
//     required this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: wihth,
//       width: heigth,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(300),
//         color: color,
//       ),
//     );
//   }
// }

class _BackGround extends StatelessWidget {
  const _BackGround({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
