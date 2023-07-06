// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DishEntity _$$_DishEntityFromJson(Map<String, dynamic> json) =>
    _$_DishEntity(
      name: json['name'] as String,
      url: json['url'] as String,
      price: json['price'] as num,
      decription: json['decription'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_DishEntityToJson(_$_DishEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'price': instance.price,
      'decription': instance.decription,
      'ingredients': instance.ingredients,
    };
