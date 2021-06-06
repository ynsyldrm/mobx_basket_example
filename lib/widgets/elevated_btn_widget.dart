import 'package:flutter/material.dart';

class ElevatedBtnWidget extends StatelessWidget {
  final Function? onPressed;
  final double? width;
  final TextStyle? textStyle;
  final String? btnText;
  final double? borderRadius;

  const ElevatedBtnWidget({
    this.btnText,
    this.width,
    this.textStyle,
    this.borderRadius,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          textStyle: textStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 15.0,
            ),
          ),
        ),
        onPressed: () => onPressed!(),
        child: Text(btnText ?? ''),
      ),
    );
  }
}
