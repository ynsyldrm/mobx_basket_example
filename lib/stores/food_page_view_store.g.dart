// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_page_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodPageViewStore on _FoodPageViewStoreBase, Store {
  final _$foodsAtom = Atom(name: '_FoodPageViewStoreBase.foods');

  @override
  ObservableList<FoodModel>? get foods {
    _$foodsAtom.reportRead();
    return super.foods;
  }

  @override
  set foods(ObservableList<FoodModel>? value) {
    _$foodsAtom.reportWrite(value, super.foods, () {
      super.foods = value;
    });
  }

  final _$basketPageViewStoreAtom =
      Atom(name: '_FoodPageViewStoreBase.basketPageViewStore');

  @override
  BasketPageViewStore? get basketPageViewStore {
    _$basketPageViewStoreAtom.reportRead();
    return super.basketPageViewStore;
  }

  @override
  set basketPageViewStore(BasketPageViewStore? value) {
    _$basketPageViewStoreAtom.reportWrite(value, super.basketPageViewStore, () {
      super.basketPageViewStore = value;
    });
  }

  final _$getAllFoodsAsyncAction =
      AsyncAction('_FoodPageViewStoreBase.getAllFoods');

  @override
  Future<void> getAllFoods() {
    return _$getAllFoodsAsyncAction.run(() => super.getAllFoods());
  }

  @override
  String toString() {
    return '''
foods: ${foods},
basketPageViewStore: ${basketPageViewStore}
    ''';
  }
}
