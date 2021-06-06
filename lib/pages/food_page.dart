import 'package:flutter/material.dart';
import 'package:mobx_basket_example/models/basket_model.dart';
import 'package:mobx_basket_example/models/food_model.dart';
import 'package:mobx_basket_example/stores/food_page_view_store.dart';
import 'package:mobx_basket_example/widgets/image_card_widget.dart';
import 'package:mobx_basket_example/widgets/list_counter_btn_group_widget.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late final FoodPageViewStore foodPageViewStore;

  @override
  void didChangeDependencies() {
    foodPageViewStore = FoodPageViewStore();
    foodPageViewStore.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: buildGridViewFoods(context, foodPageViewStore),
    );
  }

  Widget buildGridViewFoods(
      BuildContext context, FoodPageViewStore foodPageViewStore) {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(15),
      crossAxisSpacing: 25,
      mainAxisSpacing: 50,
      crossAxisCount: 3,
      childAspectRatio: 0.6,
      children: List.generate(foodPageViewStore.foods?.length ?? 0, (index) {
        var food = foodPageViewStore.foods![index];
        return Column(
          children: [
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      buildFoodImg(food),
                      buildPositionedFoodCounter(
                          context, constraints, foodPageViewStore, food),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: buildFoodInfoText(food),
            ),
          ],
        );
      }),
    );
  }

  Widget buildFoodImg(FoodModel food) {
    return ImageCardWidget(
      food.image,
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  Widget buildPositionedFoodCounter(
    BuildContext context,
    BoxConstraints constraints,
    FoodPageViewStore foodPageViewStore,
    FoodModel food,
  ) {
    final existFoodsInBasket = foodPageViewStore.basketPageViewStore?.foods
        ?.where((x) => x.id == food.id);
    final isFoodInBasket = (existFoodsInBasket?.length ?? 0) > 0;

    return Positioned(
      left: constraints.maxWidth * 0.8,
      top: constraints.minHeight * -0.05,
      child: Container(
        //alignment: Alignment.center,
        width: constraints.maxWidth * 0.3,
        height: constraints.maxHeight * 1,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          border: Border.all(
            color: Color(0xffcfd6fe),
          ),
          color: Colors.white,
        ),
        child: ListCounterBtnGroupWidget(
          count: isFoodInBasket ? existFoodsInBasket!.first.quantity : null,
          btnIncrementCallback: () {
            if (!isFoodInBasket) {
              final basketFood = BasketModel(
                id: food.id,
                price: food.price,
                quantity: 1,
                title: food.title,
                image: food.image,
              );
              foodPageViewStore.basketPageViewStore!.foods!.add(basketFood);
            } else {
              final foodFirst = existFoodsInBasket!.first;
              final foodQty = foodFirst.quantity! + 1;
              foodFirst.quantity = foodQty;
            }
          },
          btnDecrementCallback: () {
            if (isFoodInBasket) {
              final foodFirst = existFoodsInBasket!.first;
              final foodQty = foodFirst.quantity!;
              if (foodQty > 1)
                foodFirst.quantity = foodQty - 1;
              else if (foodQty > 0)
                foodPageViewStore.basketPageViewStore?.foods!.remove(foodFirst);
            }
          },
        ),
      ),
    );
  }

  Widget buildFoodInfoText(FoodModel food) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: SizedBox()),
        Expanded(
          child: Text(
            '${food.price?.toString()} \$',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              food.title ?? '',
              style: TextStyle(fontSize: 11),
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
