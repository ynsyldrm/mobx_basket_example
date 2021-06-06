// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return FoodModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    description: json['description'] as String?,
    category: json['category'] as String?,
    image: json['image'] as String?,
    quantity: json['quantity'] as int?,
  );
}

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'quantity': instance.quantity,
    };
