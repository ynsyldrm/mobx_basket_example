import 'package:flutter/material.dart';

class ListCounterBtnWidget extends StatelessWidget {
  final String? count;
  final IconData? iconData;
  final double? distance;
  final Function? onPressed;

  const ListCounterBtnWidget({
    this.count,
    this.iconData,
    this.distance,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        iconData,
        color: Colors.redAccent,
      ),
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
    );
  }
}
