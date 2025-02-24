import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.maxLines = 100,
    this.softWrap = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.font,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.textDecorationStyle,
    this.textDecoration,
    this.letterSpace,
    this.wordSpace,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final bool softWrap;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? wordSpace, letterSpace;
  final TextStyle? font;
  final TextDecorationStyle? textDecorationStyle;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    double size = fontSize;

    // Adjusting the font size based on the text scale factor of the device for accessibility
    size = fontSize * MediaQuery.of(context).textScaleFactor;

    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: (font ?? GoogleFonts.poppins()).copyWith(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationStyle: textDecorationStyle,
        letterSpacing: letterSpace,
        wordSpacing: wordSpace,
      ),
    );
  }
}