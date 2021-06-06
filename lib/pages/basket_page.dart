import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_basket_example/stores/basket_page_view_store.dart';
import 'package:mobx_basket_example/widgets/detail_counter_btn_group_widget.dart';
import 'package:mobx_basket_example/widgets/elevated_btn_widget.dart';
import 'package:mobx_basket_example/widgets/image_card_widget.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    final _basketStore = Provider.of<BasketPageViewStore>(context);

    return buildBasket(context, _basketStore);
  }

  Widget buildBasket(BuildContext context, BasketPageViewStore viewStore) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              primary: false,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: (viewStore.foods?.length ?? 0) > 0
                    ? buildBasketRows(viewStore, context)
                    : [],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: buildTotalAndApprove(viewStore, context),
          ),
        ],
      ),
    );
  }

  List<Widget> buildBasketRows(
    BasketPageViewStore viewStore,
    BuildContext context,
  ) {
    return viewStore.foods!.map((food) {
      return Padding(
        padding: EdgeInsets.only(bottom: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth,
                    child: ImageCardWidget(
                      food.image,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(1),
                child: Column(
                  children: [
                    Text(
                      'Salmon Burgers',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(height: 5),
                    DetailCounterBtnGroupWidget(
                      btnSize: 0.1,
                      iconSize: 20,
                      distance: 25,
                      count: food.quantity,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(1),
                child: Column(
                  children: [
                    Text(
                      '${food.price} \$',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    IconButton(
                      icon: Icon(Icons.cancel_presentation_sharp),
                      color: Colors.red,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  Widget buildTotalAndApprove(
    BasketPageViewStore basketPageViewStore,
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 17, color: Colors.grey),
            ),
            Text(
              '30.0 \$',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          child: ElevatedBtnWidget(
            width: MediaQuery.of(context).size.width,
            btnText: 'Basket Approve',
            textStyle: Theme.of(context).textTheme.headline6,
            borderRadius: 10.0,
            onPressed: () async {
              print('CLICK ELEVATED BTN');
            },
          ),
        )
      ],
    );
  }
}
