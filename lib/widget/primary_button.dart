import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w600,
    this.fontSize,
    this.borderRadius = 0.0,
    this.borderColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final double? fontSize;
  final double borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 2,
            ),
          ),
        ),
      ),
      child: SizedBox(
        width: 90,
        height: 45,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? 18,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
