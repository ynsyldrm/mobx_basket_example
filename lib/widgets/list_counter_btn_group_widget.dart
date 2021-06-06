import 'package:flutter/material.dart';
import 'package:mobx_basket_example/widgets/list_counter_btn_widget.dart';

class ListCounterBtnGroupWidget extends StatelessWidget {
  final int? count;
  final Function? btnIncrementCallback;
  final Function? btnDecrementCallback;

  const ListCounterBtnGroupWidget({
    this.count,
    this.btnIncrementCallback,
    this.btnDecrementCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListCounterBtnWidget(
            iconData: Icons.add,
            onPressed: btnIncrementCallback,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.redAccent,
            alignment: Alignment.center,
            child: Text(
              (count ?? '').toString(),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: ListCounterBtnWidget(
            iconData: Icons.remove,
            onPressed: btnDecrementCallback,
          ),
        ),
      ],
    );
  }
}
