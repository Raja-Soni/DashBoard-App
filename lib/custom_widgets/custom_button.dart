import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color focusColor;
  final Color splashColor;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final double textSize;
  final String buttonText;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color textColor;
  final FontWeight textBoldness;
  final VoidCallback callback;
  final String? givenHeroTag;

  const CustomButton({
    super.key,
    this.backgroundColor = Colors.brown,
    this.focusColor = Colors.yellow,
    this.splashColor = Colors.green,
    this.borderRadius = 10.0,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    required this.buttonText,
    required this.callback,
    this.textSize = 20.0,
    this.textColor = Colors.white,
    this.textBoldness = FontWeight.bold,
    this.givenHeroTag,
    this.buttonHeight = 50,
    this.buttonWidth = 150,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: FloatingActionButton(
        heroTag: givenHeroTag,
        onPressed: () {
          callback();
        },
        backgroundColor: backgroundColor,
        splashColor: splashColor,
        focusColor: focusColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(width: borderWidth, color: borderColor),
        ),
        child: CustomText(
          text: buttonText,
          textColor: textColor,
          textBoldness: textBoldness,
          textSize: textSize,
        ),
      ),
    );
  }
}
