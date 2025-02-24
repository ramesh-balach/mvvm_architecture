import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  // Required properties
  final String text;  // The text on the button
  final VoidCallback onPressed;  // The function to execute on button press

  // Color properties
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;

  // Shape properties
  final double radius;
  final double elevation;
  final RoundedRectangleBorder shape;
  final BorderSide? borderSide;

  // Padding and Margin
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  // Icon properties
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double iconSize;

  // Alignment
  final Alignment alignment;

  // Text style and properties
  final TextStyle textStyle;
  final TextAlign textAlign;

  // Button type (outlined or filled)
  final bool isOutlined;

  const CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.shadowColor = Colors.black,
    this.radius = 8.0,
    this.elevation = 2.0,
    this.shape = const RoundedRectangleBorder(),
    this.borderSide,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
    this.margin = EdgeInsets.zero,
    this.prefixIcon,
    this.suffixIcon,
    this.iconSize = 24.0,
    this.alignment = Alignment.center,
    this.textStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.textAlign = TextAlign.center,
    this.isOutlined = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,  // External margin
      alignment: alignment,  // Alignment of the button in the parent
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: isOutlined ? Colors.transparent : backgroundColor,  // Text color
          shadowColor: shadowColor,  // Shadow color
          elevation: elevation,  // Elevation (shadow effect)
          shape: shape,  // Shape of the button
          side: borderSide ?? BorderSide(color: borderColor),  // Border color if outlined
          padding: padding,  // Padding inside the button
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Icon(
                prefixIcon?.icon,
                color: textColor,
                size: iconSize,
              ),
            Text(
              text,
              style: textStyle.copyWith(color: isOutlined ? borderColor : textColor),
              textAlign: textAlign,  // Align text inside the button
            ),
            if (suffixIcon != null)
              Icon(
                suffixIcon?.icon,
                color: textColor,
                size: iconSize,
              ),
          ],
        ),
      ),
    );
  }
}
