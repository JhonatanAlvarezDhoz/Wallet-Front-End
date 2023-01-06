import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.isUnderline = false,
    this.overflow,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.textOverflow,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isUnderline;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    final Responsive r = Responsive.of(context);
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: GoogleFonts.poppins(
          letterSpacing: letterSpacing,
          color: color,
          fontSize: fontSize ?? r.dp(2),
          fontWeight: fontWeight,
          decoration: isUnderline ? TextDecoration.underline : null),
    );
  }
}
