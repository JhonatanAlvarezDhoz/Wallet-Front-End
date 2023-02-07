import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_wallet_front_end/controllers/controllers.dart';
import 'package:qr_wallet_front_end/ui/constants/constants.dart';
import 'package:qr_wallet_front_end/ui/pages/pages.dart';
import 'package:qr_wallet_front_end/ui/widgets/widgets.dart';
import 'package:qr_wallet_front_end/utils/responsive.dart';

class BasePage extends StatefulWidget {
  final Widget widget;
  final String title;
  final bool? leading;
  final bool? iconadd;
  final Color? color;

  const BasePage({
    Key? key,
    required this.widget,
    required this.title,
    this.leading = true,
    this.iconadd = false,
    this.color = const Color.fromARGB(255, 250, 250, 250),
  }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  static final PageController pageController = PageController();
  int curretTitleIndex = 0;
  String currentTitle = 'Hola Mundo';
  bool currentLeading = true;
  bool currentIconAdd = false;

  final List<Widget> pages = const [
    HomePage(),
    CategoryPage(),
    OpinionPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final BottomNavigationBarController controller = context.watch();

    switch (curretTitleIndex) {
      case 0:
        currentTitle = 'Home';
        currentLeading = false;
        currentIconAdd = false;
        break;

      case 1:
        currentTitle = 'Categories';
        currentLeading = true;
        currentIconAdd = true;
        break;

      case 2:
        currentTitle = 'Opinons';
        currentLeading = true;
        currentIconAdd = true;
        break;

      case 3:
        currentTitle = 'Settings';
        currentLeading = true;
        currentIconAdd = false;
        break;
      default:
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(text: currentTitle),
        elevation: 5,
        centerTitle: true,
        shadowColor: WalletColors.softPurple,
        backgroundColor: WalletColors.deepPurple,
        leading: _BcakButtom(
          leading: currentLeading,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: _IconAdd(
              responsive: responsive,
              iconAdd: currentIconAdd,
              curretIndex: curretTitleIndex,
            ),
          )
        ],
      ),
      body: PageView(
        onPageChanged: (value) => controller.changeCurrentIndex(value),
        controller: pageController,
        children: pages,
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
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const CustomRecordModal());
                },
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
          pageController.jumpToPage(value);
          setState(() {
            curretTitleIndex = value;
          });
        },
      ),
    );
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
  final int curretIndex;
  _IconAdd({
    Key? key,
    required this.responsive,
    required this.iconAdd,
    required this.curretIndex,
  }) : super(key: key);

  final Responsive responsive;

  final List<String> itemCategory = <String>[
    'Review',
    'Comments',
    'Suggestions',
    'Bad Service',
    'Complints',
  ];

  @override
  Widget build(BuildContext context) {
    if (iconAdd) {
      return IconButton(
        onPressed: () {
          switch (curretIndex) {
            case 1:
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const CustomCategoryModal());
              break;
            case 2:
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => CustomOpinionModal());
              break;
            default:
          }
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
