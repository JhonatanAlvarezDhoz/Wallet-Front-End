import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/responsive.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return BasePage(
        color: WalletColors.white,
        widget: SizedBox(
          child: Column(
            children: [
              _Banner(responsive: responsive),
              gapH16,
              Container(
                width: responsive.wp(89),
                child: const CustomText(
                  text: 'General',
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .7,
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const CustomText(text: 'Account'),
                      iconColor: WalletColors.deepPurple,
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                      leading: Icon(
                        Icons.account_circle_rounded,
                        size: responsive.dp(3.5),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const CustomText(text: 'My Opinions'),
                      iconColor: WalletColors.deepPurple,
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(
                        Icons.message_rounded,
                        size: responsive.dp(3.5),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const CustomText(text: 'Logout'),
                      iconColor: WalletColors.deepPurple,
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(
                        Icons.logout_rounded,
                        size: responsive.dp(3.5),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const CustomText(text: 'Delete account'),
                      iconColor: WalletColors.deepPurple,
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(
                        Icons.delete,
                        size: responsive.dp(3.5),
                      ),
                      onTap: () {},
                    ),
                    const ListTile(
                      title: CustomText(
                        text: 'Feedback',
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .7,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const CustomText(text: 'Report a bug'),
                      iconColor: WalletColors.deepPurple,
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(
                        Icons.warning,
                        size: responsive.dp(3.5),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const CustomText(text: 'Sugestion'),
                      iconColor: WalletColors.deepPurple,
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(
                        Icons.note_alt,
                        size: responsive.dp(3.5),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        title: 'Settings');
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: responsive.hp(26),
            width: responsive.wp(100),
            child: Image.asset(
              'assets/images/banner.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: responsive.hp(1.3),
            left: responsive.hp(2),
          ),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: WalletColors.purple,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(31, 135, 133, 133),
                offset: Offset(0, 9),
                blurRadius: 12,
              )
            ],
          ),
        ),
        Positioned(
          top: responsive.hp(16),
          left: responsive.wp(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Eduardo Martines',
                fontSize: responsive.dp(2.2),
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              CustomText(
                text: 'eduardo.molina@gemail.com',
                fontSize: responsive.dp(1.6),
              )
            ],
          ),
        )
      ],
    );
  }
}
