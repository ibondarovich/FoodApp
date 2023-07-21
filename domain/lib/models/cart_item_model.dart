import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable{
  final DishModel dishModel;
  final int quantity;

  const CartItemModel({
    required this.dishModel,
    required this.quantity,
  });

  CartItemModel copyWith(DishModel? dishModel, int? quantity){
    return CartItemModel(
      dishModel: dishModel ?? this.dishModel,
      quantity: quantity ?? this.quantity,
    );
  }
  
  @override
  List<Object?> get props => [dishModel, quantity];
}