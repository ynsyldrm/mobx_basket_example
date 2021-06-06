import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  int? quantity;

  FoodModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.quantity,
  });

  fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}
