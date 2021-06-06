import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_basket_example/models/food_model.dart';
import 'package:mobx_basket_example/stores/basket_page_view_store.dart';
import 'package:provider/provider.dart';

part 'food_page_view_store.g.dart';

class FoodPageViewStore = _FoodPageViewStoreBase with _$FoodPageViewStore;

abstract class _FoodPageViewStoreBase with Store {
  late BuildContext context;

  _FoodPageViewStoreBase();

  @observable
  ObservableList<FoodModel>? foods = ObservableList.of(<FoodModel>[]);

  @observable
  BasketPageViewStore? basketPageViewStore;

  @action
  Future<void> getAllFoods() async {
      foods = ObservableList.of(getDummyFoods()!);
  }

  void init(BuildContext context) {
    this.context = context;
    basketPageViewStore = Provider.of<BasketPageViewStore>(context);
    getAllFoods();
  }

  List<FoodModel>? getDummyFoods() {
    return [
      FoodModel(
        id: 1,
        category: 'food',
        title: 'Antepin Meshur Boregi',
        description: 'Antepin Meshur Boregi',
        price: 10,
        quantity: 20,
        image: 'https://foodish-api.herokuapp.com/images/samosa/samosa7.jpg',
      ),
      FoodModel(
        id: 2,
        category: 'food',
        title: 'Diyarbakir Meshur Biryani',
        description: 'Diyarbakir Meshur Biryani',
        price: 20,
        quantity: 10,
        image: 'https://foodish-api.herokuapp.com/images/biryani/biryani10.jpg',
      ),
      FoodModel(
        id: 3,
        category: 'food',
        title: 'Hatay Meshur Perde Pilav',
        description: 'Hatay Meshur Perde Pilav',
        price: 30,
        
        quantity: 15,
        image: 'https://foodish-api.herokuapp.com/images/rice/rice13.jpg',
      ),
      FoodModel(
        id: 4,
        category: 'food',
        title: 'Dominos Pizza',
        description: 'Dominosun Meshur Pizzasi',
        price: 45,
        quantity: 10,
        image: 'https://foodish-api.herokuapp.com/images/pizza/pizza12.jpg',
      ),
      FoodModel(
        id: 5,
        category: 'food',
        title: 'Tavuk Dunyasi',
        description: 'Tavuk Dunyasi Meshur Tavuk Menu',
        price: 18,
        quantity: 15,
        image:
            'https://foodish-api.herokuapp.com/images/butter-chicken/butter-chicken12.jpg',
      ),
      FoodModel(
        id: 6,
        category: 'food',
        title: 'Little Ceasers',
        description: 'Little Ceasers Meshur Pizza',
        price: 18,
        quantity: 15,
        image: 'https://foodish-api.herokuapp.com/images/pizza/pizza50.jpg',
      ),
      FoodModel(
        id: 7,
        category: 'food',
        title: 'Adiyaman Meshur Corba',
        description: 'Adiyaman Meshur Corba',
        price: 18,
        quantity: 50,
        image: 'https://foodish-api.herokuapp.com/images/dosa/dosa30.jpg',
      ),
      FoodModel(
        id: 8,
        category: 'food',
        title: 'BurgerKing Meshur Double Burger',
        description: 'BurgerKing Meshur Double Burger',
        price: 18,
        quantity: 50,
        image: 'https://foodish-api.herokuapp.com/images/burger/burger8.jpg',
      ),
      FoodModel(
        id: 9,
        category: 'food',
        title: 'Penna Arabiatta',
        description: 'Istanbul Meshur Penna Arabiatta',
        price: 20,
        quantity: 20,
        image: 'https://foodish-api.herokuapp.com/images/pasta/pasta26.jpg',
      ),
    ];
  }
}
