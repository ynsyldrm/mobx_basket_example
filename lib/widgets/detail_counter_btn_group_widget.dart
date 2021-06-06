import 'package:flutter/material.dart';

class DetailCounterBtnGroupWidget extends StatelessWidget {
  final int? count;
  final double? btnSize;
  final double? iconSize;
  final double? distance;
  final Function? btnIncrementCallback;
  final Function? btnDecrementCallback;

  const DetailCounterBtnGroupWidget({
    this.count,
    this.btnSize,
    this.iconSize,
    this.distance,
    this.btnIncrementCallback,
    this.btnDecrementCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildGestureDetectorCounter(
            btnSize ?? 0, Icons.add, btnIncrementCallback),
        SizedBox(width: distance),
        Text((count ?? 0).toString()),
        SizedBox(width: distance),
        buildGestureDetectorCounter(
            btnSize ?? 0, Icons.remove, btnDecrementCallback),
      ],
    );
  }

  GestureDetector buildGestureDetectorCounter(
      double btnSize, IconData iconData, Function? btnCallback) {
    return GestureDetector(
      onTap: () {
        if (btnCallback != null) btnCallback();
      },
      child: Container(
        padding: EdgeInsets.all(btnSize),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(),
        ),
        child: Icon(iconData, size: iconSize ?? 24),
      ),
    );
  }
}
