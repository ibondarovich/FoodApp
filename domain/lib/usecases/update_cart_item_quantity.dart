import 'package:domain/domain.dart';

class UpdateCartItemQuantity extends FutureUseCase<CartItemModel, void>{
  final CartRepository _cartRepository;

  UpdateCartItemQuantity({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartItemModel input) {
    return _cartRepository.updateCartItem(input);
  }
}