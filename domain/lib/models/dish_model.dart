class DishModel{
  final String name;
  final String url;
  final num price;
  final String description;
  final List<String> ingredients;
  
  DishModel({
    required this.name,
    required this.url,
    required this.price,
    required this.description,
    required this.ingredients,
  });
}