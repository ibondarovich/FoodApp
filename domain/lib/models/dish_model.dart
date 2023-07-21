import 'package:equatable/equatable.dart';

class DishModel extends Equatable{
  final int id;
  final String name;
  final String url;
  final num price;
  final String description;
  final List<String> ingredients;
  
  const DishModel({
    required this.id,
    required this.name,
    required this.url,
    required this.price,
    required this.description,
    required this.ingredients,
  });
  
  @override
  List<Object?> get props => [
    id,
    name,
    url,
    price,
    description,
    ingredients,
  ];
}