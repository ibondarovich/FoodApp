class DishEntity{
  final String name;
  final String url;
  final num price;
  final String decription;
  final List<String> ingredients;

  DishEntity({
    required this.name,
    required this.url,
    required this.price,
    required this.decription,
    required this.ingredients
  });

  factory DishEntity.fromJson(Map<String, dynamic> json){
    return DishEntity(
      name : json['name'],
      url: json['url'],
      price: json['price'],
      decription: json['description'],
      ingredients: (json['ingredients'] as List<dynamic>)
            .map((e) => e.toString())
            .toList()
    );
  }
}