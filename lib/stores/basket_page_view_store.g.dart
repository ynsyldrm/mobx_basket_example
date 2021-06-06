// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_page_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BasketPageViewStore on _BasketPageViewStoreBase, Store {
  final _$foodsAtom = Atom(name: '_BasketPageViewStoreBase.foods');

  @override
  ObservableList<BasketModel>? get foods {
    _$foodsAtom.reportRead();
    return super.foods;
  }

  @override
  set foods(ObservableList<BasketModel>? value) {
    _$foodsAtom.reportWrite(value, super.foods, () {
      super.foods = value;
    });
  }

  @override
  String toString() {
    return '''
foods: ${foods}
    ''';
  }
}
