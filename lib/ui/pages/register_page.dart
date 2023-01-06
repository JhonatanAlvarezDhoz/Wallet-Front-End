import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double heigth = 200;
    return Scaffold(
        backgroundColor: WalletColors.purple,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 380,
                width: size.width,
                color: WalletColors.purple,
                child: Image.asset('assets/images/qrO.png'),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: heigth,
                width: size.width,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    child:
                        Image.asset('assets/icons/qr-wallet-out-bacground.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: (size.height - heigth) * 1,
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(120)),
                  color: Colors.white,
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  final heigth = constraints.maxHeight - 110;
                  return Column(
                    children: [
                      gapH32,
                      const CustomText(
                        text: 'Register',
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                      gapH16,
                      _RegisterForm(
                        size: size,
                        heigth: heigth,
                      )
                    ],
                  );
                }),
              ),
            )
          ],
        ));
  }
}

class _RegisterForm extends StatelessWidget {
  final double heigth;
  const _RegisterForm({
    Key? key,
    required this.size,
    required this.heigth,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Form(
        child: SizedBox(
      height: heigth,
      width: size.width * .8,
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: const CustomText(
                    text: 'Name',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const TextFormFieldWidget(
                  fillColor: WalletColors.gray,
                ),
                gapH12,
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: const CustomText(
                    text: 'email',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const TextFormFieldWidget(
                  fillColor: WalletColors.gray,
                ),
                gapH12,
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: const CustomText(
                    text: 'Phone',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const TextFormFieldWidget(
                  fillColor: WalletColors.gray,
                ),
                gapH12,
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: const CustomText(
                    text: 'Password',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const TextFormFieldWidget(
                  fillColor: WalletColors.gray,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: 'Already a Menber?',
                      fontSize: responsive.dp(1.4),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: 'Log In',
                          fontSize: responsive.dp(1.7),
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: responsive.wp(100),
            height: responsive.hp(6.8),
            child: CustomButtom(
                borderRadius: BorderRadius.circular(50),
                child: const CustomText(
                  text: 'Create',
                  color: WalletColors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
          gapH4,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Termin Conditions',
                    fontSize: responsive.dp(1.4),
                  )),
              CustomText(
                text: 'y',
                fontSize: responsive.dp(1.4),
              ),
              TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Politics Privacity',
                    fontSize: responsive.dp(1.4),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
