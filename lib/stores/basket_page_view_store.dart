import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_basket_example/models/basket_model.dart';

part 'basket_page_view_store.g.dart';

class BasketPageViewStore = _BasketPageViewStoreBase with _$BasketPageViewStore;

abstract class _BasketPageViewStoreBase with Store {
  late BuildContext context;

  @observable
  ObservableList<BasketModel>? foods = ObservableList.of(<BasketModel>[]);

  _BasketPageViewStoreBase();

  void init(BuildContext context) {
    this.context = context;
  }
}
