import 'package:json_annotation/json_annotation.dart';

part 'basket_model.g.dart';

@JsonSerializable()
class BasketModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  int? quantity;

  BasketModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.quantity});

  fromJson(Map<String, dynamic> json) => _$BasketModelFromJson(json);

  Map<String, dynamic> toJson()  => _$BasketModelToJson(this);

}
